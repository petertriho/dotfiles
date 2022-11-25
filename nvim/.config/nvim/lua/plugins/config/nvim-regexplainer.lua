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
            mappings = {
                toggle = "gE",
            },
            popup = {
                border = {
                    padding = { 0, 0 },
                    style = "rounded",
                },
            },
        })
    end,
}
