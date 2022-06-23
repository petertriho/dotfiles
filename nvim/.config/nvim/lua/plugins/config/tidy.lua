return {
    "mcauley-penney/tidy.nvim",
    config = function()
        require("tidy").setup()
    end,
    event = "BufWritePre",
}
