return {
    "dnlhc/glance.nvim",
    cmd = {
        "Glance",
    },
    setup = function()
        local set_keymap = vim.keymap.set

        set_keymap("n", "gD", "<CMD>Glance definitions<CR>")
        set_keymap("n", "gR", "<CMD>Glance references<CR>")
        set_keymap("n", "gT", "<CMD>Glance type_definitions<CR>")
        set_keymap("n", "gI", "<CMD>Glance implementations<CR>")
    end,
    config = function()
        local glance = require("glance")
        local actions = glance.actions
        glance.setup({
            mappings = {
                list = {
                    ["p"] = actions.enter_win("preview"),
                },
                preview = {
                    ["p"] = actions.enter_win("list"),
                },
            },
        })
    end,
}
