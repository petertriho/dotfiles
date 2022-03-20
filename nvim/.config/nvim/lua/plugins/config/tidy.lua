return {
    "mcauley-penney/tidy.nvim",
    branch = "cfg",
    config = function()
        require("tidy").setup({
            fmts = {
                "eof",
                "sof",
                "ws",
            },
        })
    end,
    event = "BufWritePre",
}
