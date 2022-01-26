return {
    "windwp/nvim-ts-autotag",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({ autotag = { enable = true } })
    end,
}
