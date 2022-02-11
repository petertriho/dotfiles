local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Windows: Navigation
set_keymap("", "<C-j>", "<C-w>j", {})
set_keymap("", "<C-k>", "<C-w>k", {})
set_keymap("", "<C-h>", "<C-w>h", {})
set_keymap("", "<C-l>", "<C-w>l", {})
set_keymap("", "<C-\\>", "<C-w>p", {})

-- Windows: Resize
set_keymap("n", "<M-j>", ":resize +2<CR>", opts)
set_keymap("n", "<M-k>", ":resize -2<CR>", opts)
set_keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
set_keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)
set_keymap("", "<M-=>", "<C-w>=", {})

-- Move lines
set_keymap("n", "<M-d>", ":m .+1<CR>==", opts)
set_keymap("n", "<M-u>", ":m .-2<CR>==", opts)
set_keymap("v", "<M-d>", ":m '>+1<CR>gv=gv", opts)
set_keymap("v", "<M-u>", ":m '<-2<CR>gv=gv", opts)

-- Line Text Objects
set_keymap("v", "al", ":<C-u>norm!0v$h<CR>", opts)
set_keymap("v", "il", ":<C-u>norm!^vg_<CR>", opts)
set_keymap("o", "al", ":norm val<CR>", opts)
set_keymap("o", "il", ":norm vil<CR>", opts)
