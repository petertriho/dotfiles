local set_keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }
set_keymap('n', '<Space>', '<Nop>', options)
vim.g.mapleader = ' '

-- Buffers
set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', options)
set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', options)

-- Tabs
set_keymap('n', '<C-p>', ':tabprevious<CR>', options)
set_keymap('n', '<C-n>', ':tabnext<CR>', options)

-- Windows: Navigation
set_keymap('', '<C-j>', '<C-w>j', {})
set_keymap('', '<C-k>', '<C-w>k', {})
set_keymap('', '<C-h>', '<C-w>h', {})
set_keymap('', '<C-l>', '<C-w>l' ,{})
set_keymap('', '<C-\\>', '<C-w>p', {})

-- Windows: Resize
set_keymap('n', '<M-k>', ':resize -2<CR>', options)
set_keymap('n', '<M-j>', ':resize +2<CR>', options)
set_keymap('n', '<M-h>', ':vertical resize -2<CR>', options)
set_keymap('n', '<M-l>', ':vertical resize +2<CR>', options)
set_keymap('', '<M-=>', '<C-w>=', {})

-- Move lines
set_keymap('n', '<M-u>', ':m .-2<CR>==', options)
set_keymap('n', '<M-d>', ':m .+1<CR>==', options)
set_keymap('v', '<M-u>', ":m '<-2<CR>gv=gv", options)
set_keymap('v', '<M-d>', ":m '>+1<CR>gv=gv", options)

-- Which Key
local wk = require('which-key')

local keymaps = {
    [' '] = { ':w<CR>', 'write' },
    ['-'] = { '<C-w>s', 'split-below' },
    ['\\'] = { '<C-w>v', 'split-right' },
    [','] = { ':ScratchPreview<CR>', 'scratch-preview' },
    ['.'] = { ':BufOnly<CR>', 'only-buffer' },
    ['/'] = 'commentary',
    b = { ':BufferLinePick<CR>', 'buffer-pick' },
    d = { ':BufferWipeout<CR>', 'delete-buffer' },
    e = { '<CMD>NvimTreeToggle<CR>', 'explorer' },
    h = { ':nohl<CR>', 'no-highlight' },
}

set_keymap('n', '<Leader>/', "<Plug>kommentary_line_default", { silent = true })
set_keymap('x', '<Leader>/', "<Plug>kommentary_visual_default", { silent = true })
set_keymap('o', '<Leader>/', "<Plug>kommentary_motion_default", { silent = true })

keymaps['1'] = 'which_key_ignore'
keymaps['2'] = 'which_key_ignore'
keymaps['3'] = 'which_key_ignore'
keymaps['4'] = 'which_key_ignore'
keymaps['5'] = 'which_key_ignore'
keymaps['6'] = 'which_key_ignore'
keymaps['7'] = 'which_key_ignore'
keymaps['8'] = 'which_key_ignore'
keymaps['9'] = 'which_key_ignore'
keymaps['0'] = 'which_key_ignore'

set_keymap('', '<leader>1', ':lua require"bufferline".go_to_buffer(1)<CR>', {})
set_keymap('', '<leader>2', ':lua require"bufferline".go_to_buffer(2)<CR>', {})
set_keymap('', '<leader>3', ':lua require"bufferline".go_to_buffer(3)<CR>', {})
set_keymap('', '<leader>4', ':lua require"bufferline".go_to_buffer(4)<CR>', {})
set_keymap('', '<leader>5', ':lua require"bufferline".go_to_buffer(5)<CR>', {})
set_keymap('', '<leader>6', ':lua require"bufferline".go_to_buffer(6)<CR>', {})
set_keymap('', '<leader>7', ':lua require"bufferline".go_to_buffer(7)<CR>', {})
set_keymap('', '<leader>8', ':lua require"bufferline".go_to_buffer(8)<CR>', {})
set_keymap('', '<leader>9', ':lua require"bufferline".go_to_buffer(9)<CR>', {})
set_keymap('', '<leader>0', ':lua require"bufferline".go_to_buffer(10)<CR>', {})

wk.register(keymaps, {
    prefix = '<Leader>',
    silent = true,
    noremap = true
})
