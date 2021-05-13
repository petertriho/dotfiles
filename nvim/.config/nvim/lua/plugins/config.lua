require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "comment",
        "css",
        "go",
        "graphql",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "python",
        "regex",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "yaml"
    },
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true
    },
    indentation = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1000
    },
    textobjects = {
        enable = true
    }
}
