return {
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
    module = "gitlinker",
    config = function()
        require("gitlinker").setup({
            mappings = nil,
        })
    end,
}
