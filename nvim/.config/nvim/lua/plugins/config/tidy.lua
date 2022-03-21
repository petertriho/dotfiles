return {
    "mcauley-penney/tidy.nvim",
    branch = "cfg",
    config = function()
        require("tidy").setup({
            fmts = {
                "eof",
                "ws",
            },
        })
    end,
    event = "BufWritePre",
}
