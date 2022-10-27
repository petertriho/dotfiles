return {
    "akinsho/git-conflict.nvim",
    after = "tokyonight.nvim",
    tag = "v1.0.0",
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
