local set_keymap = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}
set_keymap("n", "<Space>", "<Nop>", options)
vim.g.mapleader = " "

-- Buffers
set_keymap("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", options)
set_keymap("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", options)

-- Tabs
set_keymap("n", "<C-p>", ":tabprevious<CR>", options)
set_keymap("n", "<C-n>", ":tabnext<CR>", options)

-- Windows: Navigation
set_keymap("", "<C-j>", "<C-w>j", {})
set_keymap("", "<C-k>", "<C-w>k", {})
set_keymap("", "<C-h>", "<C-w>h", {})
set_keymap("", "<C-l>", "<C-w>l", {})
set_keymap("", "<C-\\>", "<C-w>p", {})

-- Windows: Resize
set_keymap("n", "<M-k>", ":resize -2<CR>", options)
set_keymap("n", "<M-j>", ":resize +2<CR>", options)
set_keymap("n", "<M-h>", ":vertical resize -2<CR>", options)
set_keymap("n", "<M-l>", ":vertical resize +2<CR>", options)
set_keymap("", "<M-=>", "<C-w>=", {})

-- Move lines
set_keymap("n", "<M-u>", ":m .-2<CR>==", options)
set_keymap("n", "<M-d>", ":m .+1<CR>==", options)
set_keymap("v", "<M-u>", ':m "<-2<CR>gv=gv', options)
set_keymap("v", "<M-d>", ':m ">+1<CR>gv=gv', options)

-- Which Key
local keymaps = {
    [" "] = {":w<CR>", "write"},
    ["-"] = {"<C-w>s", "split-below"},
    ["\\"] = {"<C-w>v", "split-right"},
    [","] = {"<CMD>ScratchPreview<CR>", "scratch-preview"},
    ["."] = {"<CMD>BufOnly<CR>", "only-buffer"},
    [";"] = {"<CMD>Telescope find_files hidden=true<CR>", "find-files"},
    b = {"<CMD>BufferLinePick<CR>", "buffer-pick"},
    d = {"<CMD>Bwipeout<CR>", "delete-buffer"},
    e = {"<CMD>NvimTreeToggle<CR>", "explorer"},
    h = {":nohl<CR>", "no-highlight"},
    j = {":call ToggleGstatus(0)<CR>", "git-status"},
    J = {":call ToggleGstatus(0)<CR>", "git-status-vertical"},
    s = {"<CMD>Telescope live_grep<CR>", "search-text"},
    u = {"<CMD>MundoToggle<CR>", "undotree"}
}

keymaps["/"] = "commentary"
set_keymap("n", "<Leader>/", "<Plug>kommentary_line_default", {silent = true})
set_keymap("x", "<Leader>/", "<Plug>kommentary_visual_default", {silent = true})
set_keymap("o", "<Leader>/", "<Plug>kommentary_motion_default", {silent = true})

keymaps["1"] = "which_key_ignore"
keymaps["2"] = "which_key_ignore"
keymaps["3"] = "which_key_ignore"
keymaps["4"] = "which_key_ignore"
keymaps["5"] = "which_key_ignore"
keymaps["6"] = "which_key_ignore"
keymaps["7"] = "which_key_ignore"
keymaps["8"] = "which_key_ignore"
keymaps["9"] = "which_key_ignore"
keymaps["0"] = "which_key_ignore"

set_keymap("", "<Leader>1", "<CMD>lua require'bufferline'.go_to_buffer(1)<CR>",
           {})
set_keymap("", "<Leader>2", "<CMD>lua require'bufferline'.go_to_buffer(2)<CR>",
           {})
set_keymap("", "<Leader>3", "<CMD>lua require'bufferline'.go_to_buffer(3)<CR>",
           {})
set_keymap("", "<Leader>4", "<CMD>lua require'bufferline'.go_to_buffer(4)<CR>",
           {})
set_keymap("", "<Leader>5", "<CMD>lua require'bufferline'.go_to_buffer(5)<CR>",
           {})
set_keymap("", "<Leader>6", "<CMD>lua require'bufferline'.go_to_buffer(6)<CR>",
           {})
set_keymap("", "<Leader>7", "<CMD>lua require'bufferline'.go_to_buffer(7)<CR>",
           {})
set_keymap("", "<Leader>8", "<CMD>lua require'bufferline'.go_to_buffer(8)<CR>",
           {})
set_keymap("", "<Leader>9", "<CMD>lua require'bufferline'.go_to_buffer(9)<CR>",
           {})
set_keymap("", "<Leader>0", "<CMD>lua require'bufferline'.go_to_buffer(10)<CR>",
           {})

keymaps["a"] = {
    name = "+action",
    j = {"<CMD>SplitjoinJoin<CR>", "join-lines"},
    r = {"<CMD>lua vim.lsp.buf.rename()<CR>", "rename"},
    p = {'ggVG"+p', 'paste-file'},
    x = {"<CMD>SplitjoinSplit<CR>", "split-lines"},
    y = {"<CMD>%y+<CR>", "yank-file"}
}

keymaps["a"]["a"] = "align"
set_keymap("", "<Leader>aa", "<Plug>(EasyAlign)", {})

keymaps["a"]["s"] = "sort"
set_keymap("x", "<Leader>as", "<CMD>sort i<CR>", {})

keymaps["g"] = {
    name = "+git",
    b = {"<CMD>GitBlameToggle<CR>", "blame"},
    g = {":diffget //2<CR>", "diff-left"},
    h = {":diffget //3<CR>", "diff-right"},
    i = {":Octo issue list<CR>", "gh-issues"},
    l = {":Telescope git_commits<CR>", "logs"},
    p = {":Octo pr list<CR>", "gh-issues"}
}

keymaps["l"] = {
    name = "+lsp",
    d = {
        "<CMD>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
        "line-diagnostics"
    },
    l = {"<CMD>lua vim.lsp.diagnostic.set_loclist()<CR>", "loclist"}
}

require("which-key").register(keymaps, {
    prefix = "<Leader>",
    mode = "n",
    silent = true,
    noremap = true
})
