function LoadDeferredPlugins()
    local plugins =
        "nvim-treesitter gitsigns.nvim todo-comments.nvim indent-blankline.nvim nvim-colorizer.lua quick-scope nvim-lightbulb rainbow"
    local loader = require("packer").loader
    loader(plugins)
end

vim.cmd([[autocmd User LoadDeferredPlugins lua LoadDeferredPlugins()]])

vim.defer_fn(function()
    vim.cmd([[doautocmd User LoadDeferredPlugins]])
end, 80)
