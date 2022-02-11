return {
    "svban/YankAssassin.vim",
    keys = {
        "<Plug>YAMotion",
        "<Plug>YAVisual",
        "<Plug>YALine",
    },
    setup = function()
        vim.g.yankassassin_use_mappings = 1

        local set_keymap = vim.api.nvim_set_keymap
        set_keymap("n", "y", "<Plug>YAMotion", {})
        set_keymap("x", "y", "<Plug>YAVisual", {})
        set_keymap("n", "yy", "<plug>YALine", {})
    end,
}
