return {
    "RRethy/nvim-treesitter-textsubjects",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            textsubjects = {
                enable = true,
                prev_selection = "<BS>",
                keymaps = {
                    ["."] = "textsubjects-smart",
                    ["<CR>"] = "textsubjects-container-outer",
                },
            },
        })
    end,
}
