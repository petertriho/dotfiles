return {
    "kwkarlwang/bufjump.nvim",
    keys = {
        "<M-i>",
        "<M-o>",
    },
    config = function()
        require("bufjump").setup({
            forward = "<M-i>",
            backward = "<M-o>",
            on_success = function()
                vim.cmd([[execute "normal! g`\"zz"]])
            end,
        })
    end,
}
