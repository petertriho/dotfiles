--[[
-- TODO:
-- - Defer + debounce
-- - Show search + listen to nohl
-- - Use mark levels for predefined mark text
]]

local config = require("scrollbar.config")

local M = {}

local NAME_PREFIX = "Scrollbar"
local NAME_SUFFIX = "Handle"

local NAMESPACE = vim.api.nvim_create_namespace(NAME_PREFIX)

local get_highlight_name = function(mark_type, handle)
    return string.format("%s%s%s", NAME_PREFIX, mark_type, handle and NAME_SUFFIX or "")
end

M.refresh = function()
    vim.api.nvim_buf_clear_namespace(0, NAMESPACE, 0, -1)

    if not vim.tbl_contains(config.excluded_filetypes, vim.bo.filetype) then
        local total_lines = vim.api.nvim_buf_line_count(0)
        local visible_lines = vim.api.nvim_win_get_height(0)
        local first_visible_line = vim.fn.line("w0")
        local last_visible_line = vim.fn.line("w$")

        if visible_lines >= total_lines then
            visible_lines = total_lines
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
                    return config.marks[a.type].priority < config.marks[b.type].priority
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
                        handle_marks[#handle_marks].text = config.marks[mark.type].text[2]
                    elseif
                        other_marks[#other_marks]
                        and math.floor(other_marks[#other_marks].line * ratio) == relative_mark_line
                    then
                        other_marks[#other_marks].text = config.marks[mark.type].text[2]
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

        local scroll_offset = visible_lines - (last_visible_line - first_visible_line)

        for i = relative_first_line, relative_last_line, 1 do
            local mark_line = first_visible_line + i - scroll_offset

            if mark_line >= 0 then
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
                        { config.handle.text, get_highlight_name("", true) },
                    }
                end

                vim.api.nvim_buf_set_extmark(0, NAMESPACE, mark_line, -1, handle_opts)
            end
        end

        for _, mark in pairs(other_marks) do
            if mark ~= nil then
                local mark_line = first_visible_line + math.floor(tonumber(mark.line) * ratio) - scroll_offset

                if mark_line >= 0 then
                    local mark_opts = {
                        virt_text_pos = "right_align",
                        virt_text = { { mark.text, get_highlight_name(mark.type, false) } },
                    }
                    vim.api.nvim_buf_set_extmark(0, NAMESPACE, mark_line, -1, mark_opts)
                end
            end
        end
    end
end

local diagnostics_mark_type_map = {
    [vim.diagnostic.severity.ERROR] = "Error",
    [vim.diagnostic.severity.WARN] = "Warn",
    [vim.diagnostic.severity.INFO] = "Info",
    [vim.diagnostic.severity.HINT] = "Hint",
}

M.diagnostics_handler = function(_, result, _, _)
    local bufnr = vim.uri_to_bufnr(result.uri)
    local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

    if not vim.tbl_contains(config.excluded_filetypes, filetype) then
        local diagnostics_scrollbar_marks = {}

        for _, diagnostic in pairs(result.diagnostics) do
            local mark_type = diagnostics_mark_type_map[diagnostic.severity]
            table.insert(diagnostics_scrollbar_marks, {
                line = diagnostic.range.start.line,
                text = config.marks[mark_type].text[1],
                type = mark_type,
            })
        end

        vim.api.nvim_buf_set_var(bufnr, "scrollbar_marks", { diagnostics = diagnostics_scrollbar_marks })

        if vim.uri_from_bufnr(0) == result.uri then
            M.refresh()
        end
    end
end

M.setup = function(overrides)
    config = vim.tbl_deep_extend("force", config, overrides or {})

    vim.cmd(string.format("highlight %s guifg=%s guibg=%s", get_highlight_name("", true), "none", config.handle.color))
    for mark_type, properties in pairs(config.marks) do
        vim.cmd(
            string.format(
                "highlight %s guifg=%s guibg=%s",
                get_highlight_name(mark_type, false),
                properties.color,
                "NONE"
            )
        )
        vim.cmd(
            string.format(
                "highlight %s guifg=%s guibg=%s",
                get_highlight_name(mark_type, true),
                properties.color,
                config.handle.color
            )
        )
    end

    if config.autocmd and config.autocmd.refresh and #config.autocmd.refresh > 0 then
        vim.cmd(string.format(
            [[
        augroup scrollbar
            autocmd!
            autocmd %s * lua require('scrollbar').refresh()
        augroup END
        ]],
            table.concat(config.autocmd.refresh, ",")
        ))
    end

    if config.show.lsp_diagnostics then
        vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, conf)
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, conf)
            M.diagnostics_handler(err, result, ctx, conf)
        end
    end
end

return M
