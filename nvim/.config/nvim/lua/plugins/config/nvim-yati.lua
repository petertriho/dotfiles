return {
    "yioneko/nvim-yati",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            yati = {
                enable = true,
                default_lazy = true,
                default_fallback = "auto",
            },
        })
    end,
}
