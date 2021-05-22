-- nvim-treesitter/nvim-treesitter
local colors = require("tokyonight.colors").setup()

require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "bash", "comment", "css", "dockerfile", "fish", "go", "graphql", "html",
        "javascript", "jsdoc", "json", "jsonc", "lua", "python", "regex",
        "scss", "toml", "tsx", "typescript", "yaml"
    },
    autotag = {enable = true},
    context_commentstring = {enable = true},
    highlight = {enable = true},
    incremental_selection = {enable = true},
    indentation = {enable = true},
    matchup = {enable = true},
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1000,
        colors = {
            colors.red, colors.green, colors.yellow, colors.blue,
            colors.magenta, colors.cyan
        }
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        }
    }
}

