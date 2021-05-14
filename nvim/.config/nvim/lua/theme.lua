vim.o.termguicolors = true

vim.cmd[[colorscheme tokyonight]]

-- hoob3rt/lualine.nvim
require('lualine').setup{
    options = {
        theme = 'tokyonight'
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
        numbers = "ordinal",
        number_style = "",
        offsets = {{
            filetype = "NvimTree",
            text = "EXPLORER",
            highlight = "Directory",
            text_align = "left"
        }}
    }
}
