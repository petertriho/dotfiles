return {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
    },
    after = "telescope.nvim",
    module = "refactoring",
    config = function()
        require("refactoring").setup({})
        require("telescope").load_extension("refactoring")
    end,
}
