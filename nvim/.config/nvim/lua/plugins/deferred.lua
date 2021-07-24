function LoadDeferredPlugins()
    local loader = require("packer").loader
    local plugins = {
        "nvim-treesitter", "vim-matchup", "vim-unimpaired", "gitsigns.nvim",
        "todo-comments.nvim", "indent-blankline.nvim", "nvim-colorizer.lua",
        "quick-scope", "vimwiki"
    }
    for _, plugin in pairs(plugins) do loader(plugin) end
end

vim.cmd([[autocmd User LoadDeferredPlugins lua LoadDeferredPlugins()]])

vim.defer_fn(function() vim.cmd([[doautocmd User LoadDeferredPlugins]]) end, 80)

-- vim.defer_fn(function() vim.cmd([[doautocmd ColorScheme]]) end, 100)
