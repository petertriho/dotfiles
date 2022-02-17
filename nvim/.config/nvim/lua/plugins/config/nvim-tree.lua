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
        vim.g.nvim_tree_window_picker_exclude = {
            filetype = require("filetypes").excludes,
            buftype = { "terminal" },
        }
    end,
    config = function()
        require("nvim-tree").setup({
            update_focused_file = {
                enable = true,
            },
            filters = {
                custom = { ".git", "node_modules", ".venv" },
            },
            git = {
                ignore = false,
            },
            view = {
                signcolumn = "no",
            },
        })
    end,
}
