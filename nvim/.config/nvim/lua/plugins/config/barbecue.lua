return {
    "utilyre/barbecue.nvim",
    requires = {
        "SmiteshP/nvim-navic",
    },
    config = function()
        require("barbecue").setup({
            modifiers = {
                dirname = ":s?.*??",
            },
        })
    end,
}
