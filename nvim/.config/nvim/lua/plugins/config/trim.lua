return {
    "cappyzawa/trim.nvim",
    config = function()
        require("trim").setup({
            patterns = {
                [[%s/\s\+$//e]],
                [[%s/\($\n\s*\)\+\%$//]],
            },
        })
    end,
    event = "BufWritePre",
}
