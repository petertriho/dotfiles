local function load_deferred_plugins()
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

vim.api.nvim_add_user_command("LoadDeferredPlugins", load_deferred_plugins, {})

vim.cmd([[
    augroup deferred_plugins
        autocmd User LoadDeferredPlugins LoadDeferredPlugins
    augroup END
]])

vim.defer_fn(function()
    vim.cmd([[doautocmd User LoadDeferredPlugins]])
end, 80)
