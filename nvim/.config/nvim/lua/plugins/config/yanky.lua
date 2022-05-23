return {
    "gbprod/yanky.nvim",
    keys = {
        "<Plug>(YankyYank)",
    },
    module = "yanky",
    setup = function()
        local set_keymap = vim.keymap.set

        set_keymap({ "n", "x" }, "y", "<Plug>(YankyYank)", {})
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

        set_keymap({ "n", "x" }, "[p", "<Plug>(YankyGPutBefore)", {})
        set_keymap({ "n", "x" }, "]p", "<Plug>(YankyGPutAfter)", {})
        set_keymap({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", {})
        set_keymap({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", {})

        set_keymap("n", "<M-f>", "<Plug>(YankyCycleForward)", {})
        set_keymap("n", "<M-b>", "<Plug>(YankyCycleBackward)", {})

        set_keymap("n", "Y", "y$", {})
    end,
}
