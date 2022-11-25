return {
    "nvim-treesitter/nvim-treesitter",
    opt = true,
    run = ":TSUpdateSync",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                -- "comment",
                "markdown_inline",
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
                disable = function(lang, bufnr)
                    if vim.api.nvim_buf_line_count(bufnr) > 5000 then
                        pcall(require("illuminate").pause_buf)
                        return true
                    end

                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
                    if ok and stats and stats.size > max_filesize then
                        pcall(require("illuminate").pause_buf)
                        return true
                    end
                end,
            },
            incremental_selection = {
                enable = false,
            },
            indent = {
                enable = false,
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
