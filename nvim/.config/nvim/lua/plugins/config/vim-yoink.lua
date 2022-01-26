return {
    "svermeulen/vim-yoink",
    config = function()
        local set_keymap = vim.api.nvim_set_keymap

        set_keymap("n", "<M-n>", "<Plug>(YoinkPostPasteSwapBack)", {})
        set_keymap("n", "<M-p>", "<Plug>(YoinkPostPasteSwapForward)", {})

        set_keymap("n", "<C-M-n>", "<Plug>(YoinkRotateBack)", {})
        set_keymap("n", "<C-M-p>", "<Plug>(YoinkRotateForward)", {})

        set_keymap("n", "p", "<Plug>(YoinkPaste_p)", {})
        set_keymap("n", "P", "<Plug>(YoinkPaste_P)", {})
    end,
}
