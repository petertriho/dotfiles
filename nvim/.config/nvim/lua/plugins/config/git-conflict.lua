return {
    "akinsho/git-conflict.nvim",
    after = "tokyonight.nvim",
    config = function()
        require("git-conflict").setup({
            highlights = {
                ancestor = "DiffDelete",
                current = "DiffAdd",
                incoming = "DiffChange",
            },
        })
    end,
}
