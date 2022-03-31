return {
    "akinsho/git-conflict.nvim",
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
