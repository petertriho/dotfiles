return {
    "andymass/vim-matchup",
    require = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            matchup = { enable = true },
        })
        vim.g.matchup_matchparen_offscreen = {
            method = "popup",
        }
        vim.g.matchup_matchparen_deferred = 1
        vim.api.nvim_del_keymap("", "z%")
    end,
}
