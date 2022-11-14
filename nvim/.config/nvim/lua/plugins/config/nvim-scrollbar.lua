return {
    "petertriho/nvim-scrollbar",
    config = function()
        local colors = require("colors")

        require("scrollbar").setup({
            folds = false,
            marks = {
                Cursor = { text = "", priority = -1, highlight = "Normal" },
                Search = { color = colors.orange },
                GitAdd = { text = "│" },
                GitChange = { text = "│" },
                GitDelete = { text = "│" },
            },
            excluded_filetypes = require("filetypes").excludes,
        })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "CursorMoved", "CursorMovedI" }, {
            callback = function()
                local current_line = vim.fn.line(".") - 1
                local bufnr = vim.fn.bufnr("%")

                local utils = require("scrollbar.utils")
                local scrollbar_marks = utils.get_scrollbar_marks(bufnr)
                scrollbar_marks.cursor = { { line = current_line, text = "", type = "Cursor" } }
                utils.set_scrollbar_marks(bufnr, scrollbar_marks)

                require("scrollbar").render()
            end,
            desc = "Render scrollbar cursor",
        })
    end,
}
