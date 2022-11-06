return {
    "ggandor/flit.nvim",
    requires = "ggandor/leap.nvim",
    config = function()
        require("flit").setup({
            labeled_modes = "nvo",
        })
    end,
}
