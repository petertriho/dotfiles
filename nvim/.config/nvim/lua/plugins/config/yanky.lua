return {
    "gbprod/yanky.nvim",
    keys = { "y", "Y", "<Plug>(YankyYank)" },
    module = "yanky",
    setup = function()
        local set_keymap = vim.keymap.set

        set_keymap("n", "y", "<Plug>(YankyYank)", {})
        set_keymap("x", "y", "<Plug>(YankyYank)", {})
    end,
    config = function()
        require("yanky").setup({
            ring = {
                storage = "memory",
            },
            highlight = {
                on_put = true,
                on_yank = true,
                timer = 200,
            },
        })

        local set_keymap = vim.keymap.set

        set_keymap("n", "p", "<Plug>(YankyPutAfter)", {})
        set_keymap("n", "P", "<Plug>(YankyPutBefore)", {})
        set_keymap("x", "p", "<Plug>(YankyPutAfter)", {})
        set_keymap("x", "P", "<Plug>(YankyPutBefore)", {})
        set_keymap("n", "]p", "<Plug>(YankyGPutAfter)", {})
        set_keymap("n", "[p", "<Plug>(YankyGPutBefore)", {})
        set_keymap("x", "]p", "<Plug>(YankyGPutAfter)", {})
        set_keymap("x", "[p", "<Plug>(YankyGPutBefore)", {})

        set_keymap("n", "<M-n>", "<Plug>(YankyCycleForward)", {})
        set_keymap("n", "<M-p>", "<Plug>(YankyCycleBackward)", {})

        set_keymap("n", "Y", "y$", {})
    end,
}
