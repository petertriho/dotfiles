function LazyLoad()
    local loader = require("packer").loader
    local plugins = {
        "nvim-compe", "nvim-treesitter", "vim-matchup", "vim-unimpaired",
        "gitsigns.nvim", "todo-comments.nvim", "indent-blankline.nvim",
        "nvim-colorizer.lua", "quick-scope", "vimwiki"
    }
    for _, plugin in pairs(plugins) do loader(plugin) end

    -- NOTE: Need to disable this on initial install
    vim.cmd([[
    augroup _compe
        autocmd!
        autocmd FileType * call vsnip#get_complete_items(bufnr())
    augroup END
    ]])
end

vim.cmd([[autocmd User LoadLazyPlugins lua LazyLoad()]])

vim.defer_fn(function() vim.cmd([[doautocmd User LoadLazyPlugins]]) end, 80)

vim.defer_fn(function() vim.cmd([[doautocmd ColorScheme]]) end, 100)
