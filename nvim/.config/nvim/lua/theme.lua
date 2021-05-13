vim.o.termguicolors = true
vim.g.edge_better_performance = 1

vim.cmd('colorscheme edge')

local custom_lualine_theme = require'lualine.themes.auto'

require('lualine').setup{
    options = {
        theme = 'auto'
    },
    extensions = {
        'fzf',
        'fugitive',
        'nvim-tree',
        'quickfix'
    }
}

vim.g.edge_transparent_background = 1
