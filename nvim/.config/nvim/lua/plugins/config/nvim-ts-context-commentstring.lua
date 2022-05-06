return {
    "JoosepAlviste/nvim-ts-context-commentstring",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
                config = {
                    json = { __default = "// %s", __multiline = "/* %s */" },
                },
            },
        })
    end,
}
