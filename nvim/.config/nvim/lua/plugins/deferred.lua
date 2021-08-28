function LoadDeferredPlugins()
	local plugins =
		"nvim-cmp nvim-treesitter vim-matchup vim-unimpaired gitsigns.nvim todo-comments.nvim indent-blankline.nvim nvim-colorizer.lua quick-scope vimwiki"
	local loader = require("packer").loader
	loader(plugins)
end

vim.cmd([[autocmd User LoadDeferredPlugins lua LoadDeferredPlugins()]])

vim.defer_fn(function()
	vim.cmd([[doautocmd User LoadDeferredPlugins]])
end, 80)

vim.defer_fn(function()
	vim.cmd([[doautocmd ColorScheme]])
end, 100)
