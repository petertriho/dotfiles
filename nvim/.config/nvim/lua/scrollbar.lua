local colors = require("tokyonight.colors").setup()

local M = {}

local NAME_PREFIX = "Scrollbar"
local NAME_SUFFIX = "Handle"

local NAMESPACE = vim.api.nvim_create_namespace(NAME_PREFIX)

local SIGNS = { "-", "=" }

local SIGN_TYPES = {
    ERROR = "Error",
    WARN = "Warn",
    INFO = "Info",
    HINT = "Hint",
}

local SIGN_TYPE_PRIORITY = {
    [SIGN_TYPES.ERROR] = 1,
    [SIGN_TYPES.WARN] = 2,
    [SIGN_TYPES.INFO] = 3,
    [SIGN_TYPES.HINT] = 4,
}

local get_highlight_name = function(sign_type, handle)
    return string.format("%s%s%s", NAME_PREFIX, sign_type, handle and NAME_SUFFIX or "")
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

    local scrollbar_signs = vim.b.scrollbar_signs or {}

    local handle_signs = {}
    local other_signs = {}

    for _, namespace_signs in pairs(scrollbar_signs) do
        table.sort(namespace_signs, function(a, b)
            if a.line == b.line then
                return SIGN_TYPE_PRIORITY[a.type] < SIGN_TYPE_PRIORITY[b.type]
            end
            return a.line < b.line
        end)

        for _, sign in pairs(namespace_signs) do
            local relative_sign_line = math.floor(sign.line * ratio)

            if sign.line <= total_lines then
                if
                    handle_signs[#handle_signs]
                    and math.floor(handle_signs[#handle_signs].line * ratio) == relative_sign_line
                then
                    handle_signs[#handle_signs].text = SIGNS[2]
                elseif
                    other_signs[#other_signs]
                    and math.floor(other_signs[#other_signs].line * ratio) == relative_sign_line
                then
                    other_signs[#other_signs].text = SIGNS[2]
                else
                    if relative_sign_line >= relative_first_line and relative_sign_line <= relative_last_line then
                        table.insert(handle_signs, sign)
                    else
                        table.insert(other_signs, sign)
                    end
                end
            end
        end
    end

    for i = relative_first_line, relative_last_line, 1 do
        local handle_opts = {
            virt_text_pos = "right_align",
        }

        local handle_sign = nil

        for index, sign in ipairs(handle_signs) do
            local relative_sign_line = math.floor(sign.line * ratio)
            if relative_sign_line >= i - 1 and relative_sign_line <= i then
                handle_sign = sign
                table.remove(handle_signs, index)
                break
            end
        end

        if handle_sign then
            handle_opts.virt_text = {
                { handle_sign.text, get_highlight_name(handle_sign.type, true) },
            }
        else
            handle_opts.virt_text = {
                { " ", get_highlight_name("", true) },
            }
        end

        vim.api.nvim_buf_set_extsign(0, NAMESPACE, first_visible_line - 1 + i, -1, handle_opts)
    end

    for _, sign in pairs(other_signs) do
        if sign ~= nil then
            local handle_opts = {
                virt_text_pos = "right_align",
                virt_text = { { sign.text, get_highlight_name(sign.type, false) } },
            }
            vim.api.nvim_buf_set_extsign(
                0,
                NAMESPACE,
                first_visible_line - 1 + math.floor(tonumber(sign.line) * ratio),
                -1,
                handle_opts
            )
        end
    end
end

local diagnostics_sign_properties = {
    [vim.diagnostic.severity.ERROR] = { text = SIGNS[1], type = SIGN_TYPES.ERROR },
    [vim.diagnostic.severity.WARN] = { text = SIGNS[1], type = SIGN_TYPES.WARN },
    [vim.diagnostic.severity.INFO] = { text = SIGNS[1], type = SIGN_TYPES.INFO },
    [vim.diagnostic.severity.HINT] = { text = SIGNS[1], type = SIGN_TYPES.HINT },
}

M.diagnostics_handler = function(err, result, ctx, config)
    local bufnr = vim.uri_to_bufnr(result.uri)

    local diagnostics_scrollbar_signs = {}

    for _, diagnostic in pairs(result.diagnostics) do
        table.insert(diagnostics_scrollbar_signs, {
            line = diagnostic.range.start.line,
            text = diagnostics_sign_properties[diagnostic.severity].text,
            type = diagnostics_sign_properties[diagnostic.severity].type,
        })
    end

    vim.api.nvim_buf_set_var(bufnr, "scrollbar_signs", { diagnostics = diagnostics_scrollbar_signs })

    if vim.uri_from_bufnr(0) == result.uri then
        M.render()
    end
end

M.setup = function()
    local highlights = {
        [NAME_PREFIX .. NAME_SUFFIX] = { "NONE", colors.bg_highlight },
        [NAME_PREFIX .. SIGN_TYPES.ERROR .. NAME_SUFFIX] = { colors.error, colors.bg_highlight },
        [NAME_PREFIX .. SIGN_TYPES.WARN .. NAME_SUFFIX] = { colors.warning, colors.bg_highlight },
        [NAME_PREFIX .. SIGN_TYPES.INFO .. NAME_SUFFIX] = { colors.info, colors.bg_highlight },
        [NAME_PREFIX .. SIGN_TYPES.HINT .. NAME_SUFFIX] = { colors.hint, colors.bg_highlight },
        [NAME_PREFIX .. SIGN_TYPES.ERROR] = { colors.error, "NONE" },
        [NAME_PREFIX .. SIGN_TYPES.WARN] = { colors.warning, "NONE" },
        [NAME_PREFIX .. SIGN_TYPES.INFO] = { colors.info, "NONE" },
        [NAME_PREFIX .. SIGN_TYPES.HINT] = { colors.hint, "NONE" },
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
