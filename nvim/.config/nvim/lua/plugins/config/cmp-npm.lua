return {
    "David-Kunz/cmp-npm",
    after = "nvim-cmp",
    config = function()
        require("cmp-npm").setup({})
    end,
}
