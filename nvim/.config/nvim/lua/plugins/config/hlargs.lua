return {
    "m-demare/hlargs.nvim",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        require("hlargs").setup()
    end,
}
