return {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    module = "nvim-gps",
    config = function()
        require("nvim-gps").setup()
    end,
}
