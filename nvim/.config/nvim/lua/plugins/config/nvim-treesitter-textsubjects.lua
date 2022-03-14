return {
    "RRethy/nvim-treesitter-textsubjects",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        local textobjects = {
            ["."] = "textsubjects-smart",
            ["<CR>"] = "textsubjects-container-outer",
            ["i<CR>"] = "textsubjects-container-inner",
        }

        require("nvim-treesitter.configs").setup({
            textsubjects = {
                enable = true,
                prev_selection = "<BS>",
                keymaps = textobjects,
            },
        })

        require("which-key").register(textobjects, { mode = "o", prefix = "" })
    end,
}
