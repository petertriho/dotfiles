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
    end,
}
