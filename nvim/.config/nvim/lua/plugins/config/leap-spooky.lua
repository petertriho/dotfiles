return {
    "ggandor/leap-spooky.nvim",
    requires = "ggandor/leap.nvim",
    config = function()
        require("leap-spooky").setup()
    end,
}
