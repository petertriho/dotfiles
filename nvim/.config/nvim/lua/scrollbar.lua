local colors = require("tokyonight.colors").setup()

local M = {}

local NAMESPACE = vim.api.nvim_create_namespace("scrollbar")

local get_highlight_name = function(mark_type, handle)
    return string.format("Scrollbar%s%s", handle and "Handle" or "", mark_type)
end

M.render = function()
    vim.api.nvim_buf_clear_namespace(0, NAMESPACE, 0, -1)

    local total_lines = vim.fn.line("$")
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
            return a.line < b.line
        end)

        for _, mark in pairs(namespace_marks) do
            local relative_mark_line = math.floor(mark.line * ratio)

            if
                not (
                    handle_marks[#handle_marks]
                        and math.floor(handle_marks[#handle_marks].line * ratio) == relative_mark_line
                    or other_marks[#other_marks]
                        and math.floor(other_marks[#other_marks].line * ratio) == relative_mark_line
                )
            then
                if relative_mark_line >= relative_first_line and relative_mark_line <= relative_last_line then
                    table.insert(handle_marks, mark)
                else
                    table.insert(other_marks, mark)
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
            local handle_opts = {
                virt_text_pos = "right_align",
                virt_text = { { mark.text, get_highlight_name(mark.type, false) } },
            }
            vim.api.nvim_buf_set_extmark(
                0,
                NAMESPACE,
                first_visible_line - 1 + math.floor(tonumber(mark.line) * ratio),
                -1,
                handle_opts
            )
        end
    end
end

function M.setup()
    local highlights = {
        ScrollbarHandle = { "NONE", colors.bg_highlight },
        ScrollbarHandleError = { colors.error, colors.bg_highlight },
        ScrollbarHandleWarn = { colors.warning, colors.bg_highlight },
        ScrollbarHandleInfo = { colors.info, colors.bg_highlight },
        ScrollbarHandleHint = { colors.hint, colors.bg_highlight },
        ScrollbarError = { colors.error, "NONE" },
        ScrollbarWarn = { colors.warning, "NONE" },
        ScrollbarInfo = { colors.info, "NONE" },
        ScrollbarHint = { colors.hint, "NONE" },
    }

    for name, highlight in pairs(highlights) do
        vim.cmd(string.format("highlight %s guifg=%s guibg=%s", name, highlight[1], highlight[2]))
    end

    vim.cmd([[
    augroup scrollbar
        autocmd!
        autocmd BufWinEnter,TabEnter,TermEnter,WinEnter * lua require('scrollbar').render()
        autocmd CmdwinLeave * lua require('scrollbar').render()
        autocmd TextChanged * lua require('scrollbar').render()
        autocmd VimResized * lua require('scrollbar').render()
        autocmd WinScrolled * lua require('scrollbar').render()
    augroup end
    ]])

    local diagnostic_severity_to_mark_type = {
        [vim.diagnostic.severity.ERROR] = "Error",
        [vim.diagnostic.severity.WARN] = "Warn",
        [vim.diagnostic.severity.INFO] = "Info",
        [vim.diagnostic.severity.HINT] = "Hint",
    }

    vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
        vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)

        local diagnostics_scrollbar_marks = {}

        for _, diagnostic in pairs(result.diagnostics) do
            table.insert(diagnostics_scrollbar_marks, {
                line = diagnostic.range.start.line,
                text = "-",
                type = diagnostic_severity_to_mark_type[diagnostic.severity],
            })
        end

        vim.b.scrollbar_marks = { diagnostics = diagnostics_scrollbar_marks }

        M.render()
    end
end

return M
