return {
    "bennypowers/nvim-regexplainer",
    requires = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    after = "nvim-treesitter",
    config = function()
        require("regexplainer").setup({
            display = "popup",
            popup = {
                border = {
                    padding = { 0, 0 },
                    style = "rounded",
                },
            },
        })
    end,
}
