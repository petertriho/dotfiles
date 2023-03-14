return {
    "stevearc/oil.nvim",
    setup = function()
        vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end,
    config = function()
        require("oil").setup({
            keymaps = {
                ["<C-v>"] = "actions.select_vsplit",
                ["<C-x>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-r>"] = "actions.refresh",
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["g."] = "actions.toggle_hidden",
            },
            use_default_keymaps = false,
            view_options = {
                show_hidden = true,
            },
        })
    end,
}
