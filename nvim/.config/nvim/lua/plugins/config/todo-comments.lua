return {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    opt = true,
    config = function()
        require("todo-comments").setup()

        local Config = require("todo-comments.config")
        local highlight = require("todo-comments.highlight")
        highlight.is_valid_buf = function(buf)
            local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
            if buftype ~= "" or buftype ~= "nofile" or buftype ~= "quickfix" then
                return false
            end
            local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
            if vim.tbl_contains(Config.options.highlight.exclude, filetype) then
                return false
            end
            return true
        end
    end,
}
