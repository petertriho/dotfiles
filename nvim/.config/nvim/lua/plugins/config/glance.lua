return {
    "dnlhc/glance.nvim",
    cmd = {
        "Glance",
    },
    setup = function()
        local set_keymap = vim.keymap.set

        set_keymap("n", "gpd", "<CMD>Glance definitions<CR>")
        set_keymap("n", "gpr", "<CMD>Glance references<CR>")
        set_keymap("n", "gpy", "<CMD>Glance type_definitions<CR>")
        set_keymap("n", "gpm", "<CMD>Glance implementations<CR>")
    end,
    config = function()
        local glance = require("glance")
        local actions = glance.actions
        glance.setup({
            height = 36,
            mappings = {
                list = {
                    ["gP"] = actions.enter_win("preview"),
                },
                preview = {
                    ["gP"] = actions.enter_win("list"),
                },
            },
        })
    end,
}
