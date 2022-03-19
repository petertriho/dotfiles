return {
    "mcauley-penney/tidy.nvim",
    branch = "cfg",
    config = function()
        require("tidy").setup({})
    end,
    event = "BufWritePre",
}
