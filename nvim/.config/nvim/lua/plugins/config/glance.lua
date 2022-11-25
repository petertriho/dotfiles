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
                    ["\\"] = actions.jump_vsplit,
                    ["-"] = actions.jump_split,
                    ["s"] = "<Plug>(leap-forward-to)",
                    ["v"] = "v",
                    ["gP"] = actions.enter_win("preview"),
                    ["<leader>l"] = "<leader>l",
                },
                preview = {
                    ["gP"] = actions.enter_win("list"),
                    ["<leader>l"] = "<leader>l",
                },
            },
            folds = {
                folded = false,
            },
        })
    end,
}
