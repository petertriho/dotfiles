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
set_keymap("v", "<M-u>", ":m '<-2<CR>gv=gv", options)
set_keymap("v", "<M-d>", ":m '>+1<CR>gv=gv", options)

set_keymap("", "ss", "<CMD>HopChar1<CR>", options)
set_keymap("", "sl", "<CMD>HopLine<CR>", options)

set_keymap("n", "<C-a>", "<Plug>(dial-increment)", options)
set_keymap("n", "<C-x>", "<Plug>(dial-decrement)", options)
set_keymap("v", "<C-a>", "<Plug>(dial-increment)", options)
set_keymap("v", "<C-x>", "<Plug>(dial-decrement)", options)
set_keymap("v", "g<C-a>", "<Plug>(dial-increment-additional)", options)
set_keymap("v", "g<C-x>", "<Plug>(dial-decrement-additional)", options)

-- Which Key
local keymaps = {
    [" "] = {":w<CR>", "write"},
    [","] = {"<CMD>ScratchPreview<CR>", "scratch-preview"},
    ["-"] = {"<C-w>s", "split-below"},
    ["."] = {"<CMD>BufOnly<CR>", "only-buffer"},
    ["/"] = {"<Plug>kommentary_line_default", "commentary"},
    [";"] = {"<CMD>Telescope find_files hidden=true<CR>", "find-files"},
    [":"] = {"<CMD>Telescope find_files find_command=fd,-HIL<CR>", "find-files"},
    ["\\"] = {"<C-w>v", "split-right"},
    b = {"<CMD>BufferLinePick<CR>", "buffer-pick"},
    d = {"<CMD>Bwipeout<CR>", "delete-buffer"},
    e = {"<CMD>NvimTreeToggle<CR>", "explorer"},
    h = {":nohl<CR>", "no-highlight"},
    j = {":call ToggleGstatus(0)<CR>", "git-status"},
    J = {":Neogit kind=split<CR>", "neo-git-status"},
    p = {"<CMD>Glow<CR>", "preview"},
    r = {":lua require('spectre').open()<CR>", "find-replace"},
    s = {"<CMD>Telescope live_grep<CR>", "search-text"},
    t = {"<CMD>TroubleToggle<CR>", "trouble"},
    u = {"<CMD>MundoToggle<CR>", "undotree"}
}

local visual_keymaps = {
    ["/"] = {"<Plug>kommentary_visual_default", "commentary"},
    x = {"<Plug>(vsnip-select-text)", "snippet-select"},
    X = {"<Plug>(vsnip-cut-text)", "snippet-cut"}
}

local operator_keymaps = {
    ["/"] = {"<Plug>kommentary_motion_default", "commentary"},
    x = {"<Plug>(vsnip-select-text)", "snippet-select"},
    X = {"<Plug>(vsnip-cut-text)", "snippet-cut"}
}

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

visual_keymaps["1"] = "which_key_ignore"
visual_keymaps["2"] = "which_key_ignore"
visual_keymaps["3"] = "which_key_ignore"
visual_keymaps["4"] = "which_key_ignore"
visual_keymaps["5"] = "which_key_ignore"
visual_keymaps["6"] = "which_key_ignore"
visual_keymaps["7"] = "which_key_ignore"
visual_keymaps["8"] = "which_key_ignore"
visual_keymaps["9"] = "which_key_ignore"
visual_keymaps["0"] = "which_key_ignore"

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
    a = {"<Plug>(EasyAlign)", "align"},
    j = {"<CMD>SplitjoinJoin<CR>", "join-lines"},
    p = {"ggVG\"+p", "paste-file"},
    x = {"<CMD>SplitjoinSplit<CR>", "split-lines"},
    y = {"<CMD>%y+<CR>", "yank-file"}
}

visual_keymaps["a"] = {
    name = "+action",
    a = {"<Plug>(EasyAlign)", "align"},
    s = {":sort i<CR>", "sort"}
}

keymaps["g"] = {
    name = "+git",
    b = {"<CMD>lua require('telescope.builtin').git_branches()<CR>", "branches"},
    g = {":diffget //2<CR>", "diff-left"},
    h = {":diffget //3<CR>", "diff-right"},
    i = {"<CMD>Octo issue list<CR>", "gh-issues"},
    l = {"<CMD>lua require('telescope.builtin').git_commits()<CR>", "logs"},
    p = {"<CMD>Octo pr list<CR>", "gh-pr"},
    s = {"<CMD>lua require('telescope.builtin').git_stashes()<CR>", "stashes"},
    t = {"<CMD>GitBlameToggle<CR>", "toggle-blame"}
}

keymaps["w"] = {name = "+wiki"}

keymaps["S"] = {
    "<CMD>lua require('telescope.builtin').live_grep({search_dirs = {os.getenv('VIMWIKI_PATH')}})<CR>",
    "search-wiki"
}
keymaps["W"] = {
    "<CMD>lua require('telescope.builtin').find_files({search_dirs = {os.getenv('VIMWIKI_PATH')}})<CR>",
    "find-wiki"
}

require("which-key").register(keymaps, {
    prefix = "<Leader>",
    mode = "n",
    silent = true,
    noremap = true
})

require("which-key").register(visual_keymaps, {
    prefix = "<Leader>",
    mode = "x",
    silent = true,
    noremap = true
})

require("which-key").register(operator_keymaps, {
    prefix = "<Leader>",
    mode = "o",
    silent = true,
    noremap = true
})
