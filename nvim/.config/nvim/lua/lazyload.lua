function LazyLoad()
    local loader = require("packer").loader
    local plugins = {
        "nvim-treesitter", "gitsigns.nvim", "todo-comments.nvim",
        "indent-blankline.nvim", "nvim-colorizer.lua", "quick-scope"
    }
    for _, plugin in pairs(plugins) do loader(plugin) end
end

vim.cmd([[autocmd User LoadLazyPlugins lua LazyLoad()]])

vim.defer_fn(function() vim.cmd([[doautocmd User LoadLazyPlugins]]) end, 80)

vim.defer_fn(function() vim.cmd([[doautocmd ColorScheme]]) end, 100)