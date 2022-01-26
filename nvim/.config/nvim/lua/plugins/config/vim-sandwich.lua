return {
    "machakann/vim-sandwich",
    config = function()
        vim.cmd("runtime macros/sandwich/keymap/surround.vim")
        local set_keymap = vim.api.nvim_set_keymap

        set_keymap("x", "is", "<Plug>(textobj-sandwich-query-i)", {})
        set_keymap("x", "as", "<Plug>(textobj-sandwich-query-a)", {})
        set_keymap("o", "is", "<Plug>(textobj-sandwich-query-i)", {})
        set_keymap("o", "as", "<Plug>(textobj-sandwich-query-a)", {})

        set_keymap("x", "iss", "<Plug>(textobj-sandwich-auto-i)", {})
        set_keymap("x", "ass", "<Plug>(textobj-sandwich-auto-a)", {})
        set_keymap("o", "iss", "<Plug>(textobj-sandwich-auto-i)", {})
        set_keymap("o", "ass", "<Plug>(textobj-sandwich-auto-a)", {})

        set_keymap("x", "im", "<Plug>(textobj-sandwich-literal-query-i)", {})
        set_keymap("x", "am", "<Plug>(textobj-sandwich-literal-query-a)", {})
        set_keymap("o", "im", "<Plug>(textobj-sandwich-literal-query-i)", {})
        set_keymap("o", "am", "<Plug>(textobj-sandwich-literal-query-a)", {})
    end,
}
