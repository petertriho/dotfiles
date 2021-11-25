local colors = require("tokyonight.colors").setup()

local M = {}

local NAME_PREFIX = "Scrollbar"
local NAME_SUFFIX = "Handle"

local NAMESPACE = vim.api.nvim_create_namespace(NAME_PREFIX)

local MARKS = { "-", "=" }

local MARK_TYPE_PRIORITY = {
    Error = 1,
    Warn = 2,
    Info = 3,
    Hint = 4,
}

local get_highlight_name = function(mark_type, handle)
    return string.format("%s%s%s", NAME_PREFIX, mark_type, handle and NAME_SUFFIX or "")
end

M.render = function()
    vim.api.nvim_buf_clear_namespace(0, NAMESPACE, 0, -1)

    local total_lines = vim.api.nvim_buf_line_count(0)
    local visible_lines = vim.api.nvim_win_get_height(0)
    local first_visible_line = vim.fn.line("w0")
    local last_visible_line = vim.fn.line("w$")

    if visible_lines >= total_lines then
        visible_lines = total_lines
    end

    if last_visible_line - first_visible_line + 1 < visible_lines then
        return
    end

    local ratio = visible_lines / total_lines

    local relative_first_line = math.floor(first_visible_line * ratio) - math.floor(1 * ratio)
    local relative_last_line = math.floor(last_visible_line * ratio)

    local scrollbar_marks = vim.b.scrollbar_marks or {}

    local handle_marks = {}
    local other_marks = {}

    for _, namespace_marks in pairs(scrollbar_marks) do
        table.sort(namespace_marks, function(a, b)
            if a.line == b.line then
                return MARK_TYPE_PRIORITY[a.type] < MARK_TYPE_PRIORITY[b.type]
            end
            return a.line < b.line
        end)

        for _, mark in pairs(namespace_marks) do
            local relative_mark_line = math.floor(mark.line * ratio)

            if mark.line <= total_lines then
                if
                    handle_marks[#handle_marks]
                    and math.floor(handle_marks[#handle_marks].line * ratio) == relative_mark_line
                then
                    handle_marks[#handle_marks].text = MARKS[2]
                elseif
                    other_marks[#other_marks]
                    and math.floor(other_marks[#other_marks].line * ratio) == relative_mark_line
                then
                    other_marks[#other_marks].text = MARKS[2]
                else
                    if relative_mark_line >= relative_first_line and relative_mark_line <= relative_last_line then
                        table.insert(handle_marks, mark)
                    else
                        table.insert(other_marks, mark)
                    end
                end
            end
        end
    end

    for i = relative_first_line, relative_last_line, 1 do
        local handle_opts = {
            virt_text_pos = "right_align",
        }

        local handle_mark = nil

        for index, mark in ipairs(handle_marks) do
            local relative_mark_line = math.floor(mark.line * ratio)
            if relative_mark_line >= i - 1 and relative_mark_line <= i then
                handle_mark = mark
                table.remove(handle_marks, index)
                break
            end
        end

        if handle_mark then
            handle_opts.virt_text = {
                { handle_mark.text, get_highlight_name(handle_mark.type, true) },
            }
        else
            handle_opts.virt_text = {
                { " ", get_highlight_name("", true) },
            }
        end

        vim.api.nvim_buf_set_extmark(0, NAMESPACE, first_visible_line - 1 + i, -1, handle_opts)
    end

    for _, mark in pairs(other_marks) do
        if mark ~= nil then
            local mark_opts = {
                virt_text_pos = "right_align",
                virt_text = { { mark.text, get_highlight_name(mark.type, false) } },
            }
            vim.api.nvim_buf_set_extmark(
                0,
                NAMESPACE,
                first_visible_line - 1 + math.floor(tonumber(mark.line) * ratio),
                -1,
                mark_opts
            )
        end
    end
end

local diagnostics_mark_properties = {
    [vim.diagnostic.severity.ERROR] = { text = MARKS[1], type = "Error" },
    [vim.diagnostic.severity.WARN] = { text = MARKS[1], type = "Warn" },
    [vim.diagnostic.severity.INFO] = { text = MARKS[1], type = "Info" },
    [vim.diagnostic.severity.HINT] = { text = MARKS[1], type = "Hint" },
}

M.diagnostics_handler = function(err, result, ctx, config)
    local bufnr = vim.uri_to_bufnr(result.uri)

    local diagnostics_scrollbar_marks = {}

    for _, diagnostic in pairs(result.diagnostics) do
        table.insert(diagnostics_scrollbar_marks, {
            line = diagnostic.range.start.line,
            text = diagnostics_mark_properties[diagnostic.severity].text,
            type = diagnostics_mark_properties[diagnostic.severity].type,
        })
    end

    vim.api.nvim_buf_set_var(bufnr, "scrollbar_marks", { diagnostics = diagnostics_scrollbar_marks })

    if vim.uri_from_bufnr(0) == result.uri then
        M.render()
    end
end

M.setup = function()
    local highlights = {
        [NAME_PREFIX .. NAME_SUFFIX] = { "NONE", colors.bg_highlight },
        [NAME_PREFIX .. "Error" .. NAME_SUFFIX] = { colors.error, colors.bg_highlight },
        [NAME_PREFIX .. "Warn" .. NAME_SUFFIX] = { colors.warning, colors.bg_highlight },
        [NAME_PREFIX .. "Info" .. NAME_SUFFIX] = { colors.info, colors.bg_highlight },
        [NAME_PREFIX .. "Hint" .. NAME_SUFFIX] = { colors.hint, colors.bg_highlight },
        [NAME_PREFIX .. "Error"] = { colors.error, "NONE" },
        [NAME_PREFIX .. "Warn"] = { colors.warning, "NONE" },
        [NAME_PREFIX .. "Info"] = { colors.info, "NONE" },
        [NAME_PREFIX .. "Hint"] = { colors.hint, "NONE" },
    }

    for name, highlight in pairs(highlights) do
        vim.cmd(string.format("highlight %s guifg=%s guibg=%s", name, highlight[1], highlight[2]))
    end

    local autocmd_events = {
        "BufWinEnter",
        "TabEnter",
        "TermEnter",
        "WinEnter",
        "CmdwinLeave",
        "TextChanged",
        "VimResized",
        "WinScrolled",
    }

    vim.cmd(string.format(
        [[
        augroup scrollbar
            autocmd!
            autocmd %s * lua require('scrollbar').render()
        augroup END
        ]],
        table.concat(autocmd_events, ",")
    ))

    vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
        vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
        M.diagnostics_handler(err, result, ctx, config)
    end
end

return M
