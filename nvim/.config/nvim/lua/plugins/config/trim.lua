return {
    "cappyzawa/trim.nvim",
    config = function()
        require("trim").setup()
    end,
    event = "BufWritePre",
}
