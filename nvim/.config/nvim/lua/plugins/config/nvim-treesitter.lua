return {
    "nvim-treesitter/nvim-treesitter",
    opt = true,
    run = ":TSUpdateSync",
    config = function()
        local ts_utils = require("nvim-treesitter.ts_utils")
        ts_utils.get_node_text = vim.treesitter.query.get_node_text

        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "comment",
                "prisma",
                "regex",
                "todotxt",
                "tsx",
                unpack(require("filetypes").treesitter),
            },
            sync_install = true,
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            incremental_selection = {
                enable = false,
            },
            indent = {
                enable = true,
                disable = { "python" },
            },
            fold = { enable = false },
        })
        require("nvim-treesitter").define_modules({
            fold = {
                attach = function()
                    vim.opt_local.foldmethod = "expr"
                    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
                    vim.opt_local.foldminlines = 1
                    vim.opt_local.foldnestmax = 3
                    vim.opt_local.foldlevel = 3
                    vim.opt_local.foldtext =
                        "substitute(getline(v:foldstart),'\\t',repeat(' ',&tabstop),'g').'...'.trim(getline(v:foldend)).' ('.(v:foldend-v:foldstart+1).' lines)'"
                end,
                detach = function() end,
                is_supported = function()
                    return true
                end,
            },
        })

        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.markdown.filetype_to_parsername = "octo"
    end,
}
