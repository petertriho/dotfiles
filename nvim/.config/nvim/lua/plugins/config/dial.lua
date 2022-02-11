return {
    "monaqa/dial.nvim",
    keys = {
        "<Plug>(dial-increment)",
        "<Plug>(dial-decrement)",
        "<Plug>(dial-increment-additional)",
        "<Plug>(dial-decrement-additional)",
    },
    setup = function()
        local set_keymap = vim.api.nvim_set_keymap

        set_keymap("", "<C-a>", "<Plug>(dial-increment)", {})
        set_keymap("", "<C-x>", "<Plug>(dial-decrement)", {})
        set_keymap("v", "g<C-a>", "<Plug>(dial-increment-additional)", {})
        set_keymap("v", "g<C-x>", "<Plug>(dial-decrement-additional)", {})
    end,
}
