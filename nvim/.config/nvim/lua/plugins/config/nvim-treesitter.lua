return {
    "nvim-treesitter/nvim-treesitter",
    opt = true,
    run = ":TSUpdateSync",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "comment",
                "css",
                "dockerfile",
                "fish",
                "go",
                "graphql",
                "html",
                "javascript",
                "json",
                "jsonc",
                "lua",
                "markdown",
                "python",
                "regex",
                "rust",
                "scss",
                "svelte",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "yaml",
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
                enable = true
            },
            fold = { enable = true },
        })
        require("nvim-treesitter").define_modules({
            fold = {
                attach = function()
                    vim.cmd([[
                    setlocal foldmethod=expr
                    setlocal foldexpr=nvim_treesitter#foldexpr()
                    setlocal foldminlines=1
                    setlocal foldnestmax=3
                    setlocal foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)).'\ ('.(v:foldend-v:foldstart+1).'\ lines)'
                    setlocal foldlevel=3
                    ]])
                end,
                detach = function() end,
                is_supported = function()
                    return true
                end,
            },
        })
    end,
}