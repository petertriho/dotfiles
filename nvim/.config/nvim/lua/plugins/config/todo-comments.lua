return {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    opt = true,
    config = function()
        require("todo-comments").setup()

        local highlight = require("todo-comments.highlight")
        highlight.is_valid_buf = function(buf)
            local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
            local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
            if (buftype == "" and filetype == "") or buftype == "nofile" or buftype == "quickfix" then
                return false
            end
            return true
        end

        highlight.is_valid_win = function(win)
            if not vim.api.nvim_win_is_valid(win) then
                return false
            end
            -- avoid E5108 after pressing q:
            if vim.fn.getcmdwintype() ~= "" then
                return false
            end
            -- dont do anything for floating windows
            if highlight.is_float(win) then
                return false
            end
            local buf = vim.api.nvim_win_get_buf(win)
            return highlight.is_valid_buf(buf)
        end
    end,
}
