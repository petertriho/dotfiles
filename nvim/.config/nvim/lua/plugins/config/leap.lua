return {
    "ggandor/leap.nvim",
    config = function()
        require("leap").add_default_mappings()
        vim.keymap.del({ "x", "o" }, "x")
        vim.keymap.del({ "x", "o" }, "X")
        vim.keymap.set({ "x", "o" }, "z", "<Plug>(leap-forward-till)")
        vim.keymap.set({ "x", "o" }, "Z", "<Plug>(leap-backward-till)")
    end,
}
