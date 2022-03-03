return {
    "ixru/nvim-markdown",
    requires = {
        "godlygeek/tabular",
    },
    ft = "markdown",
    setup = function()
        vim.g.vim_markdown_conceal = 0
        vim.g.vim_markdown_no_default_key_mappings = 1
    end,
}
