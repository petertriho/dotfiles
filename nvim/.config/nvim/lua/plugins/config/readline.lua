return {
    "linty-org/readline.nvim",
    config = function()
        local readline = require("readline")
        local set_keymap = vim.keymap.set
        set_keymap("!", "<C-k>", readline.kill_line)
        set_keymap("!", "<C-u>", readline.backward_kill_line)
        set_keymap("!", "<M-d>", readline.kill_word)
        set_keymap("!", "<M-BS>", readline.backward_kill_word)
        set_keymap("!", "<C-w>", readline.unix_word_rubout)
        set_keymap("!", "<C-d>", "<Delete>") -- delete-char
        set_keymap("!", "<C-h>", "<BS>") -- backward-delete-char
        set_keymap("!", "<C-a>", readline.beginning_of_line)
        set_keymap("!", "<C-e>", readline.end_of_line)
        set_keymap("!", "<M-f>", readline.forward_word)
        set_keymap("!", "<M-b>", readline.backward_word)
        set_keymap("!", "<C-f>", "<Right>") -- forward-char
        set_keymap("!", "<C-b>", "<Left>") -- backward-char
        set_keymap("!", "<C-n>", "<Down>") -- next-line
        set_keymap("!", "<C-p>", "<Up>") -- previous-line
    end,
}
