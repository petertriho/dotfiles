return {
    "ggandor/flit.nvim",
    requires = "ggandor/leap.nvim",
    config = function()
        require("flit").setup()
    end,
}
