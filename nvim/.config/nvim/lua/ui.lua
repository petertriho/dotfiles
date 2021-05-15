vim.g.tokyonight_style = 'night'
vim.cmd("colorscheme tokyonight")

-- hoob3rt/lualine.nvim
require('lualine').setup {
    options = {
        theme = 'tokyonight',
        disabled_filetypes = {
            'Mundo',
            'MundoDiff'
        }
    },
    sections = {
        lualine_x = { 'filetype' }
    },
    extensions = {
        'fzf',
        'fugitive',
        'nvim-tree',
        'quickfix'
    }
}

-- akinsho/nvim-bufferline.lua
require('bufferline').setup {
    options = {
        numbers = 'ordinal',
        number_style = "",
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'EXPLORER',
                highlight = 'Directory',
                text_align = 'center'
            },
            {
                filetype = 'Mundo',
                text = 'UNDOTREE',
                highlight = 'Directory',
                text_align = 'center'
            }
        }
    }
}
