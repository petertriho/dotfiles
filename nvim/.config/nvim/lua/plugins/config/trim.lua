return {
    "cappyzawa/trim.nvim",
    config = function()
        require("trim").setup({
            trim_trailing = true,
            trim_first_line = false,
            trim_last_line = true,
        })
    end,
    event = "BufWritePre",
}
