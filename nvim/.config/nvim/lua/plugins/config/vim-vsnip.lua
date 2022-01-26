return {
    "hrsh7th/vim-vsnip",
    after = "nvim-cmp",
    setup = function()
        vim.g.vsnip_filetypes = {
            javascriptreact = { "javascript" },
            typescript = { "javascript" },
            typescriptreact = { "javascript" },
        }
    end,
}
