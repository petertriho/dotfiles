function LoadDeferredPlugins()
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

vim.cmd([[autocmd User LoadDeferredPlugins lua LoadDeferredPlugins()]])

vim.defer_fn(function()
    vim.cmd([[doautocmd User LoadDeferredPlugins]])
end, 80)
