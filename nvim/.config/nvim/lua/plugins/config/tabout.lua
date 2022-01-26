return {
    "abecodes/tabout.nvim",
    requires = "nvim-treesitter",
    after = { "nvim-cmp", "nvim-treesitter" },
    config = function()
        require("tabout").setup({
            tabkey = "<c-l>",
            backwards_tabkey = "<c-h>",
        })
    end,
}
