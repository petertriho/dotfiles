local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true } 
keymap('n', '<Space>', '<Nop>', options)
vim.g.mapleader = ' '

-- Buffers
keymap('n', '<S-Tab>', ':BufferPrevious<CR>', options)
keymap('n', '<Tab>', ':BufferNext<CR>', options)

-- Tabs
keymap('n', '<C-p>', ':tabprevious<CR>', options)
keymap('n', '<C-n>', ':tabnext<CR>', options)

-- Windows: Navigation
keymap('', '<C-j>', '<C-w>j', {})
keymap('', '<C-k>', '<C-w>k', {})
keymap('', '<C-h>', '<C-w>h', {})
keymap('', '<C-l>', '<C-w>l' ,{})
keymap('', '<C-\\>', '<C-w>p', {})

-- Windows: Resize
keymap('n', '<M-k>', ':resize -2', options)
keymap('n', '<M-j>', ':resize +2', options)
keymap('n', '<M-h>', ':vertical resize -2', options)
keymap('n', '<M-l>', ':vertical resize +2', options)
keymap('', '<M-=>', '<C-w>=', {})

-- Move lines
keymap('n', '<M-u>', ':m .-2<CR>==', options)
keymap('n', '<M-d>', ':m .+1<CR>==', options)
keymap('v', '<M-u>', ":m '<-2<CR>gv=gv", options)
keymap('v', '<M-d>', ":m '>+1<CR>gv=gv", options)

-- Which Key
local wk = require('which-key')

wk.register({
    [' '] = { ':w<CR>', 'write' }, 
    ['-'] = { '<C-w>s', 'split-below' },
    ['\\'] = { '<C-w>v', 'split-right' },
    ['.'] = { ':BufferCloseAllButCurrent<CR>', 'only-buffer' },
    b = { ':BufferPick<CR>', 'buffer-pick' },
    d = { ':BufferWipeout<CR>', 'delete-buffer' },
    e = { '<CMD>NvimTreeToggle<CR>', 'explorer' },
    h = { ':nohl<CR>', 'no-highlight' },
    ['1'] = 'which_key_ignore',
    ['2'] = 'which_key_ignore',
    ['3'] = 'which_key_ignore',
    ['4'] = 'which_key_ignore',
    ['5'] = 'which_key_ignore',
    ['6'] = 'which_key_ignore',
    ['7'] = 'which_key_ignore',
    ['8'] = 'which_key_ignore',
    ['9'] = 'which_key_ignore',
    ['0'] = 'which_key_ignore',
}, 
{
    prefix = '<leader>',
    silent = true,
    noremap = true
})

keymap('', '<leader>1', ':BufferGoto 1<CR>', {})
keymap('', '<leader>2', ':BufferGoto 2<CR>', {})
keymap('', '<leader>3', ':BufferGoto 3<CR>', {})
keymap('', '<leader>4', ':BufferGoto 4<CR>', {})
keymap('', '<leader>5', ':BufferGoto 5<CR>', {})
keymap('', '<leader>6', ':BufferGoto 6<CR>', {})
keymap('', '<leader>7', ':BufferGoto 7<CR>', {})
keymap('', '<leader>8', ':BufferGoto 8<CR>', {})
keymap('', '<leader>9', ':BufferGoto 9<CR>', {})
keymap('', '<leader>0', ':BufferLast<CR>', {})
