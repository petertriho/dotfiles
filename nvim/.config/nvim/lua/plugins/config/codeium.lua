return {
    "jcdickinson/codeium.nvim",
    after = "nvim-cmp",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("codeium").setup({})
    end,
}
