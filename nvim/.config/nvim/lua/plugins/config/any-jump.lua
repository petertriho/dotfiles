return {
    "pechorin/any-jump.vim",
    cmd = {
        "AnyJump",
        "AnyJumpVisual",
        "AnyJumpBack",
        "AnyJumpLastResults",
    },
    setup = function()
        vim.g.any_jump_disable_default_keybindings = 1

        local set_keymap = vim.keymap.set

        set_keymap("n", "gj", "<CMD>AnyJump<CR>", {})
        set_keymap("n", "gJ", "<CMD>AnyJumpBack<CR>", {})
        set_keymap("n", "gk", "<CMD>AnyJumpLastResults<CR>", {})
        set_keymap("x", "gj", "<CMD>AnyJumpVisual<CR>", {})
    end,
}
