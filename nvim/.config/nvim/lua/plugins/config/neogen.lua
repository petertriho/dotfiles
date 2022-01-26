return {
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    module = "neogen",
    config = function()
        require("neogen").setup({
            enabled = true,
        })
    end,
}
