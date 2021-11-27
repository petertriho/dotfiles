function _G.load_deferred_plugins()
    require("packer").loader(
        "nvim-treesitter",
        "gitsigns.nvim",
        "indent-blankline.nvim",
        "todo-comments.nvim",
        "vim-hexokinase",
        "quick-scope",
        "rainbow"
    )
end

vim.cmd([[
    augroup deferred_plugins
        autocmd User LoadDeferredPlugins call v:lua.load_deferred_plugins()
    augroup END
]])

vim.defer_fn(function()
    vim.cmd([[doautocmd User LoadDeferredPlugins]])
end, 80)
