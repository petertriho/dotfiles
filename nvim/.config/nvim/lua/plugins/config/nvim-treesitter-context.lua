return {
    "romgrk/nvim-treesitter-context",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        require("treesitter-context").setup({
            enable = true,
            throttle = true,
        })
    end,
}
