return {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = {
        "NvimTreeOpen",
        "NvimTreeClose",
        "NvimTreeToggle",
        "NvimTreeRefresh",
        "NvimTreeFindFile",
        "NvimTreeFindFileToggle",
        "NvimTreeClipboard",
    },
    setup = function()
        vim.g.nvim_tree_git_hl = 0
        vim.g.nvim_tree_show_icons = {
            git = 0,
            folders = 1,
            files = 1,
            folder_arrows = 1,
        }
        vim.g.nvim_tree_window_picker_exclude = {
            filetype = require("filetypes").excludes,
            buftype = { "terminal" },
        }
    end,
    config = function()
        require("nvim-tree").setup({
            auto_reload_on_write = false,
            hijack_unnamed_buffer_when_opening = false,
            update_focused_file = {
                enable = true,
            },
            filters = {
                custom = { ".git", "node_modules", ".venv" },
            },
            git = {
                enable = false,
                ignore = false,
            },
            view = {
                signcolumn = "no",
            },
        })
    end,
}
