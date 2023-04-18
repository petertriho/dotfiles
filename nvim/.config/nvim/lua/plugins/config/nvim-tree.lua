return {
    "nvim-tree/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons",
    cmd = {
        "NvimTreeOpen",
        "NvimTreeClose",
        "NvimTreeToggle",
        "NvimTreeRefresh",
        "NvimTreeFindFile",
        "NvimTreeFindFileToggle",
        "NvimTreeClipboard",
    },
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
            },
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                api.config.mappings.default_on_attach(bufnr)

                vim.keymap.del("n", "s", { buffer = bufnr })
                vim.keymap.del("n", "S", { buffer = bufnr })

                vim.keymap.set("n", "<C-f>", function()
                    require("plugins.nvim-tree-utils").launch_telescope("find_files")
                end, opts("Telescope Files"))

                vim.keymap.set("n", "<C-s>", function()
                    require("plugins.nvim-tree-utils").launch_telescope("live_grep")
                end, opts("Telescope Grep"))
            end,
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
            renderer = {
                highlight_git = true,
            },
        })
    end,
}
