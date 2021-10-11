function LoadDeferredPlugins()
    local plugins =
        "nvim-treesitter gitsigns.nvim indent-blankline.nvim todo-comments.nvim nvim-colorizer.lua quick-scope rainbow nvim-lightbulb"
    local loader = require("packer").loader
    loader(plugins)
end

vim.cmd([[autocmd User LoadDeferredPlugins lua LoadDeferredPlugins()]])

vim.defer_fn(function()
    vim.cmd([[doautocmd User LoadDeferredPlugins]])
end, 80)
