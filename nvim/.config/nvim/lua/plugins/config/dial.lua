return {
    "monaqa/dial.nvim",
    keys = {
        "<Plug>(dial-increment)",
        "<Plug>(dial-decrement)",
    },
    setup = function()
        local set_keymap = vim.api.nvim_set_keymap

        set_keymap("", "<C-a>", "<Plug>(dial-increment)", {})
        set_keymap("", "<C-x>", "<Plug>(dial-decrement)", {})
        set_keymap("v", "g<C-a>", "g<Plug>(dial-increment)", {})
        set_keymap("v", "g<C-x>", "g<Plug>(dial-decrement)", {})
    end,
}
