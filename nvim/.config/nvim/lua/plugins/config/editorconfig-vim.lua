return {
    "editorconfig/editorconfig-vim",
    setup = function()
        vim.g.EditorConfig_exclude_patterns = {
            "dbui",
            "DiffViewFiles",
            "fugitive",
            "fugitiveblame",
            "lspinfo",
            "Mundo",
            "MundoDiff",
            "NeogitStatus",
            "NvimTree",
            "Outline",
            "packer",
        }
    end,
}
