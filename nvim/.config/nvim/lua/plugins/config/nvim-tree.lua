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
    config = function()
        vim.g.nvim_tree_git_hl = 1
        require("nvim-tree").setup({
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
