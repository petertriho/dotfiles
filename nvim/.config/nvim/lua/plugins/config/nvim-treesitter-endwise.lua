return {
    "RRethy/nvim-treesitter-endwise",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            endwise = {
                enable = true,
            },
        })
    end,
}
