return {
    "akinsho/git-conflict.nvim",
    after = "tokyonight.nvim",
    config = function()
        require("git-conflict").setup({
            highlights = {
                ancestor = "DiffChange",
                current = "DiffAdd",
                incoming = "DiffDelete",
            },
        })
    end,
}
