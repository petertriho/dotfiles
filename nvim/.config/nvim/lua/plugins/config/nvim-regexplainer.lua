return {
    "bennypowers/nvim-regexplainer",
    requires = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    after = "nvim-treesitter",
    config = function()
        require("regexplainer").setup()
    end,
}
