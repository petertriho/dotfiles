return {
    "ggandor/lightspeed.nvim",
    keys = {
        "<Plug>Lightspeed_s",
        "<Plug>Lightspeed_S",
        "<Plug>Lightspeed_x",
        "<Plug>Lightspeed_X",
        "<Plug>Lightspeed_f",
        "<Plug>Lightspeed_F",
        "<Plug>Lightspeed_t",
        "<Plug>Lightspeed_T",
        "<Plug>Lightspeed_gs",
        "<Plug>Lightspeed_gS",
    },
    setup = function()
        local set_keymap = vim.api.nvim_set_keymap

        set_keymap("", "<Leader>s", "<Plug>Lightspeed_s", {})
        set_keymap("", "<leader>S", "<Plug>Lightspeed_S", {})

        set_keymap("n", "gz", "<Plug>Lightspeed_gs", {})
        set_keymap("n", "gZ", "<Plug>Lightspeed_gS", {})

        set_keymap("x", "z", "<Plug>Lightspeed_s", {})
        set_keymap("x", "Z", "<Plug>Lightspeed_S", {})

        set_keymap("o", "z", "<Plug>Lightspeed_x", {})
        set_keymap("o", "Z", "<Plug>Lightspeed_X", {})

        set_keymap("", "f", "<Plug>Lightspeed_f", {})
        set_keymap("", "F", "<Plug>Lightspeed_F", {})

        set_keymap("", "t", "<Plug>Lightspeed_t", {})
        set_keymap("", "T", "<Plug>Lightspeed_T", {})
    end,
    config = function()
        require("lightspeed").setup({
            exit_after_idle_msecs = { unlabeled = nil, labeled = nil },
            substitute_chars = {
                [" "] = "␣",
                ["\r"] = "¬",
                ["\t"] = "»",
            },
        })
    end,
}
