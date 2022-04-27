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
        vim.g.nvim_tree_git_hl = 1
    end,
    config = function()
        require("nvim-tree").setup({
            auto_reload_on_write = false,
            hijack_unnamed_buffer_when_opening = false,
            hijack_directories = {
                enable = false,
            },
            update_focused_file = {
                enable = true,
            },
            filters = {
                custom = {
                    "^.git$",
                    "^.venv$",
                    "^__pycache__$",
                    "^node_modules$",
                },
            },
            git = {
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
            actions = {
                open_file = {
                    window_picker = {
                        exclude = {
                            filetype = require("filetypes").excludes,
                            buftype = { "nofile", "terminal", "help" },
                        },
                    },
                },
            },
        })
    end,
}
