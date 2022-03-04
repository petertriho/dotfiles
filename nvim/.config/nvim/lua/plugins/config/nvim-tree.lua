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
    end,
    config = function()
        require("nvim-tree").setup({
            auto_reload_on_write = false,
            hijack_unnamed_buffer_when_opening = false,
            update_focused_file = {
                enable = true,
            },
            filters = {
                custom = {
                    ".git",
                    ".venv",
                    "__pycache__",
                    "node_modules",
                },
            },
            git = {
                enable = false,
                ignore = false,
            },
            view = {
                signcolumn = "no",
                mappings = {
                    list = {
                        {
                            key = "<c-f>",
                            cb = "<CMD>lua require('plugins.nvim-tree-utils').launch_telescope('find_files')<CR>",
                        },
                        {
                            key = "<c-s>",
                            cb = "<CMD>lua require('plugins.nvim-tree-utils').launch_telescope('live_grep')<CR>",
                        },
                    },
                },
            },
            window_picker = {
                exclude = {
                    filetype = require("filetypes").excludes,
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        })
    end,
}
