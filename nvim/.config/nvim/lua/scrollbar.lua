local colors = require("tokyonight.colors").setup()

local M = {}

local NAMESPACE = vim.api.nvim_create_namespace("scrollbar")

local scrollbar_handle_bg = colors.bg_highlight
local error_fg = colors.error
local warn_fg = colors.warning
local info_fg = colors.info
local hint_fg = colors.hint

vim.api.nvim_command(
    string.format("highlight %s guifg=%s guibg=%s", "ScrollbarHandleEmpty", "NONE", scrollbar_handle_bg)
)

vim.api.nvim_command(
    string.format("highlight %s guifg=%s guibg=%s", "ScrollbarHandleError", error_fg, scrollbar_handle_bg)
)
vim.api.nvim_command(
    string.format("highlight %s guifg=%s guibg=%s", "ScrollbarHandleWarn", warn_fg, scrollbar_handle_bg)
)
vim.api.nvim_command(
    string.format("highlight %s guifg=%s guibg=%s", "ScrollbarHandleInfo", info_fg, scrollbar_handle_bg)
)
vim.api.nvim_command(
    string.format("highlight %s guifg=%s guibg=%s", "ScrollbarHandleHint", hint_fg, scrollbar_handle_bg)
)

vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s", "ScrollbarError", error_fg, "NONE"))
vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s", "ScrollbarWarn", warn_fg, "NONE"))
vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s", "ScrollbarInfo", info_fg, "NONE"))
vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s", "ScrollbarHint", hint_fg, "NONE"))

local get_highlight = function(mark_type, handle)
    return string.format("Scrollbar%s%s", handle and "Handle" or "", mark_type)
end

M.refresh = function()
    -- vim.b.scrollbar_marks = {
    --     diagnostics = {
    --         { line = 5, text = "-", type = "Error" },
    --         { line = 15, text = "-", type = "Warn" },
    --         { line = 25, text = "-", type = "Info" },
    --         { line = 35, text = "-", type = "Hint" },
    --     },
    -- }

    vim.api.nvim_buf_clear_namespace(0, NAMESPACE, 0, -1)

    local total_lines = vim.fn.line("$")
    local visible_lines = vim.api.nvim_win_get_height(0)
    local first_visible_line = vim.fn.line("w0")
    local last_visible_line = vim.fn.line("w$")

    if visible_lines >= total_lines then
        return
    end

    if last_visible_line - first_visible_line + 1 < visible_lines then
        return
    end

    local ratio = visible_lines / total_lines

    local relative_first_line = math.floor(first_visible_line * ratio)
    local relative_last_line = math.floor(last_visible_line * ratio)

    local scrollbar_marks = vim.b.scrollbar_marks or {}

    local handle_marks = {}
    local other_marks = {}

    for _, namespace_marks in pairs(scrollbar_marks) do
        for _, mark in pairs(namespace_marks) do
            local relative_mark_line = math.floor(mark.line * ratio)
            if relative_mark_line >= relative_first_line and relative_mark_line <= relative_last_line then
                table.insert(handle_marks, mark)
            else
                table.insert(other_marks, mark)
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
                { handle_mark.text, get_highlight(handle_mark.type, true) },
            }
        else
            handle_opts.virt_text = {
                { " ", get_highlight("Empty", true) },
            }
        end

        vim.api.nvim_buf_set_extmark(0, NAMESPACE, first_visible_line - 1 + i, -1, handle_opts)
    end

    for _, mark in pairs(other_marks) do
        if mark ~= nil then
            local handle_opts = {
                virt_text_pos = "right_align",
                virt_text = { { mark.text, get_highlight(mark.type, false) } },
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
    vim.cmd([[
    augroup scrollbar
        autocmd!
        autocmd BufWinEnter,TabEnter,TermEnter,WinEnter * lua require('scrollbar').refresh()
        autocmd TextChanged * lua require('scrollbar').refresh()
        autocmd VimResized * lua require('scrollbar').refresh()
        autocmd WinScrolled * lua require('scrollbar').refresh()
    augroup end
    ]])
end

return M
