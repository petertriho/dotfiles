-- nvim-treesitter/nvim-treesitter
require('nvim-treesitter.configs').setup {
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
        "lua",
        "python",
        "regex",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "yaml"
    },
    autotag = {
        enable = true
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
    matchup = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1000,
        colors = {
            '#f7768e',
            '#9ece6a',
            '#e0af68',
            '#7aa2f7',
            '#bb9af7',
            '#7dcfff'
        }
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            }
        }
    }
}

