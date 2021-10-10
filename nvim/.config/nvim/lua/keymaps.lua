local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Buffers
set_keymap("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", opts)
set_keymap("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", opts)

-- Tabs
set_keymap("n", "<M-p>", ":tabprevious<CR>", opts)
set_keymap("n", "<M-n>", ":tabnext<CR>", opts)

-- Windows: Navigation
set_keymap("", "<C-j>", "<C-w>j", {})
set_keymap("", "<C-k>", "<C-w>k", {})
set_keymap("", "<C-h>", "<C-w>h", {})
set_keymap("", "<C-l>", "<C-w>l", {})
set_keymap("", "<C-\\>", "<C-w>p", {})

-- Windows: Resize
set_keymap("n", "<M-k>", ":resize -2<CR>", opts)
set_keymap("n", "<M-j>", ":resize +2<CR>", opts)
set_keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
set_keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)
set_keymap("", "<M-=>", "<C-w>=", {})

-- Window: Move
set_keymap("n", "<C-W><C-m>", ":call WindowSwap#EasyWindowSwap()<CR>", opts)
set_keymap("n", "<C-W>m", ":call WindowSwap#EasyWindowSwap()<CR>", opts)
set_keymap("n", "<C-W><C-e>", "<CMD>WinShift<CR>", opts)
set_keymap("n", "<C-W>e", "<CMD>WinShift<CR>", opts)
set_keymap("n", "<C-M-h>", "<CMD>WinShift left<CR>", opts)
set_keymap("n", "<C-M-j>", "<CMD>WinShift down<CR>", opts)
set_keymap("n", "<C-M-k>", "<CMD>WinShift up<CR>", opts)
set_keymap("n", "<C-M-l>", "<CMD>WinShift right<CR>", opts)

-- Move lines
set_keymap("n", "<M-u>", ":m .-2<CR>==", opts)
set_keymap("n", "<M-d>", ":m .+1<CR>==", opts)
set_keymap("v", "<M-u>", ":m '<-2<CR>gv=gv", opts)
set_keymap("v", "<M-d>", ":m '>+1<CR>gv=gv", opts)

set_keymap("n", "<C-a>", "<Plug>(dial-increment)", {})
set_keymap("n", "<C-x>", "<Plug>(dial-decrement)", {})
set_keymap("v", "<C-a>", "<Plug>(dial-increment)", {})
set_keymap("v", "<C-x>", "<Plug>(dial-decrement)", {})
set_keymap("v", "g<C-a>", "<Plug>(dial-increment-additional)", {})
set_keymap("v", "g<C-x>", "<Plug>(dial-decrement-additional)", {})

-- Text Objects
set_keymap("v", "al", ":<C-u>norm!0v$h<CR>", opts)
set_keymap("v", "il", ":<C-u>norm!^vg_<CR>", opts)
set_keymap("o", "al", ":norm val<CR>", opts)
set_keymap("o", "il", ":norm vil<CR>", opts)

-- Quickfix/Location List
set_keymap("n", "<C-n>", "<CMD>QNext<CR>", opts)
set_keymap("n", "<C-p>", "<CMD>QPrev<CR>", opts)

-- Lightspeed
set_keymap("n", "s", "<Plug>Lightspeed_s", {})
set_keymap("n", "S", "<Plug>Lightspeed_S", {})

set_keymap("x", "z", "<Plug>Lightspeed_x", {})
set_keymap("x", "Z", "<Plug>Lightspeed_X", {})

set_keymap("", "f", "<Plug>Lightspeed_f", {})
set_keymap("", "F", "<Plug>Lightspeed_F", {})
set_keymap("", "t", "<Plug>Lightspeed_t", {})
set_keymap("", "T", "<Plug>Lightspeed_T", {})

-- <space> keymaps
vim.g.mapleader = " "

set_keymap("n", "<Leader>/", "gcc", {})
set_keymap("v", "<Leader>/", "gc", {})

local leader_keymaps = {
    [" "] = { ":w<CR>", "write" },
    ["-"] = { "<C-w>s", "split-below" },
    ["."] = { "<CMD>BWipeout other<CR>", "only-buffer" },
    [","] = { "<CMD>BWipeout hidden<CR>", "hidden-buffers" },
    ["/"] = { "comment" },
    ["\\"] = { "<C-w>v", "split-right" },
    c = { "cheat" },
    d = { "<CMD>Bwipeout<CR>", "delete-buffer" },
    e = { "<CMD>NvimTreeToggle<CR>", "explorer" },
    f = { "<CMD>lua vim.lsp.buf.formatting_seq_sync()<CR>", "format" },
    i = "import-all",
    j = { ":call ToggleNeogitStatus()<CR>", "git-status" },
    k = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "code-actions" },
    n = { ":nohl<CR>", "no-highlight" },
    o = "organize-imports",
    q = { "<CMD>CodeActionMenu<CR>", "quickfix" },
    s = { "<CMD>ScratchPreview<CR>", "scratch-preview" },
    u = { "<CMD>MundoToggle<CR>", "undotree" },
    x = { "<CMD>BWipeout all<CR>", "delete-all-buffers" },
    z = { "<CMD>ZenMode<CR>", "zenmode" },
}

local leader_visual_keymaps = {
    ["/"] = { "comment" },
    f = { "<CMD>lua vim.lsp.buf.range_formatting()<CR>", "format" },
    k = { "<CMD>lua vim.lsp.buf.range_code_action()<CR>", "code-actions" },
    q = { "<CMD>CodeActionMenu<CR>", "quickfix" },
    s = { "<Plug>(vsnip-select-text)", "snippet-select" },
    S = { "<Plug>(vsnip-cut-text)", "snippet-cut" },
}

leader_keymaps["1"] = "which_key_ignore"
leader_keymaps["2"] = "which_key_ignore"
leader_keymaps["3"] = "which_key_ignore"
leader_keymaps["4"] = "which_key_ignore"
leader_keymaps["5"] = "which_key_ignore"
leader_keymaps["6"] = "which_key_ignore"
leader_keymaps["7"] = "which_key_ignore"
leader_keymaps["8"] = "which_key_ignore"
leader_keymaps["9"] = "which_key_ignore"
leader_keymaps["0"] = "which_key_ignore"

set_keymap("n", "<Leader>1", "<CMD>lua require'bufferline'.go_to_buffer(1)<CR>", {})
set_keymap("n", "<Leader>2", "<CMD>lua require'bufferline'.go_to_buffer(2)<CR>", {})
set_keymap("n", "<Leader>3", "<CMD>lua require'bufferline'.go_to_buffer(3)<CR>", {})
set_keymap("n", "<Leader>4", "<CMD>lua require'bufferline'.go_to_buffer(4)<CR>", {})
set_keymap("n", "<Leader>5", "<CMD>lua require'bufferline'.go_to_buffer(5)<CR>", {})
set_keymap("n", "<Leader>6", "<CMD>lua require'bufferline'.go_to_buffer(6)<CR>", {})
set_keymap("n", "<Leader>7", "<CMD>lua require'bufferline'.go_to_buffer(7)<CR>", {})
set_keymap("n", "<Leader>8", "<CMD>lua require'bufferline'.go_to_buffer(8)<CR>", {})
set_keymap("n", "<Leader>9", "<CMD>lua require'bufferline'.go_to_buffer(9)<CR>", {})
set_keymap("n", "<Leader>0", "<CMD>lua require'bufferline'.go_to_buffer(10)<CR>", {})

leader_keymaps["a"] = {
    name = "+action",
    a = { "<Plug>(EasyAlign)", "align" },
    d = { "<CMD>lua require('neogen').generate()<CR>", "doc-gen" },
    e = { ":!chmod +x %<CR>", "executable" },
    f = "file-rename",
    j = { "<CMD>SplitjoinJoin<CR>", "join-lines" },
    r = { "rename", "<CMD>lua vim.lsp.buf.rename()<CR>" },
    R = "rename-treesitter",
    p = { 'ggVG"+p', "paste-file" },
    s = { "<CMD>ISwap<CR>", "swap" },
    x = { "<CMD>SplitjoinSplit<CR>", "split-lines" },
    y = { "<CMD>%y+<CR>", "yank-file" },
}

leader_visual_keymaps["a"] = {
    name = "+action",
    a = { "<Plug>(EasyAlign)", "align" },
    s = { ":sort i<CR>", "sort" },
}

leader_keymaps["g"] = {
    name = "+git",
    b = { "<CMD>lua require('telescope.builtin').git_branches()<CR>", "branches" },
    g = { ":diffget //2<CR>", "diff-left" },
    h = { ":diffget //3<CR>", "diff-right" },
    i = { "<CMD>Octo issue list<CR>", "gh-issues" },
    l = { "<CMD>lua require('telescope.builtin').git_commits()<CR>", "logs" },
    p = { "<CMD>Octo pr list<CR>", "gh-pr" },
    s = { "<CMD>lua require('telescope.builtin').git_stashes()<CR>", "stashes" },
    t = { "<CMD>Gitsigns toggle_current_line_blame<CR>", "toggle-blame" },
}

leader_keymaps["h"] = {
    name = "+hunks",
    b = "blame",
    p = "preview",
    R = "reset-buffer",
    r = "reset-hunk",
    S = "stage-buffer",
    s = "stage",
    U = "undo-stage-buffer",
    u = "undo-stage",
}

leader_keymaps["p"] = {
    name = "+package-info",
    c = { "<CMD>lua require('package-info').change_version()<CR>", "change-version" },
    d = { "<CMD>lua require('package-info').delete()<CR>", "delete" },
    h = { "<CMD>lua require('package-info').hide()<CR>", "hide" },
    i = { "<CMD>lua require('package-info').install()<CR>", "install" },
    r = { "<CMD>lua require('package-info').reinstall()<CR>", "reinstall" },
    s = { "<CMD>lua require('package-info').show()<CR>", "show" },
    u = { "<CMD>lua require('package-info').update()<CR>", "update" },
}

leader_keymaps["w"] = { name = "+wiki" }

require("which-key").setup({
    layout = {
        align = "center",
    },
})

local register = require("which-key").register
register(leader_keymaps, {
    prefix = "<Leader>",
    mode = "n",
    silent = true,
    noremap = true,
})

register(leader_visual_keymaps, {
    prefix = "<Leader>",
    mode = "x",
    silent = true,
    noremap = true,
})

-- semicolon keymaps
local semicolon_keymaps = {
    [";"] = { "<CMD>Telescope find_files hidden=true<CR>", "find-files" },
    b = { "<CMD>Telescope buffers<CR>", "buffers" },
    c = { "<CMD>CheatList<CR>", "cheat-list" },
    d = { "<CMD>DBUIToggle<CR>", "db" },
    e = { "<CMD>Telescope file_browser hidden=true<CR>", "telescope-explorer" },
    f = { "<CMD>Telescope find_files find_command=fd,-HIL<CR>", "find-files-all" },
    g = { ":call ToggleGitStatus()<CR>", "git-status" },
    l = { "<CMD>LLToggle<CR>", "loc-list-toggle" },
    m = { "<CMD>Glow<CR>", "markdown-preview" },
    o = { "<CMD>SymbolsOutline<CR>", "symbols-outline" },
    q = { "<CMD>QFToggle<CR>", "qf-list-toggle" },
    r = { "<CMD>lua require('spectre').open()<CR>", "find-replace" },
    s = { "<CMD>Telescope live_grep<CR>", "search-text" },
    t = { "<CMD>TroubleToggle<CR>", "trouble" },
    w = {
        "<CMD>lua require('telescope.builtin').find_files({search_dirs = {os.getenv('VIMWIKI_PATH')}})<CR>",
        "find-wiki",
    },
    W = {
        "<CMD>lua require('telescope.builtin').live_grep({search_dirs = {os.getenv('VIMWIKI_PATH')}})<CR>",
        "search-wiki",
    },
    y = { "<CMD>lua require('telescope').extensions.neoclip.default()<CR>", "yank-history" },
}

register(semicolon_keymaps, {
    prefix = ";",
    mode = "n",
    silent = true,
    noremap = true,
})

-- semicolon keymaps
local comma_keymaps = {
    c = { "<CMD>lua require('telescope.builtin').lsp_code_actions()<CR>", "code-actions" },
    d = { "<CMD>lua require('telescope.builtin').lsp_definitions()<CR>", "definitions" },
    e = {
        name = "+errors",
        d = { "<CMD>lua require('telescope.builtin').lsp_document_diagnostics()<CR>", "document" },
        w = { "<CMD>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>", "workspace" },
    },
    i = { "<CMD>lua require('telescope.builtin').lsp_implementations()<CR>", "implementations" },
    l = { "<CMD>lua vim.diagnostic.setloclist()<CR>", "loclist-diagnostics" },
    q = { "<CMD>lua vim.diagnostic.setqflist()<CR>", "qflist-diagnostics" },
    r = { "<CMD>lua require('telescope.builtin').lsp_references()<CR>", "references" },
    s = {
        name = "+symbols",
        d = { "<CMD>lua require('telescope.builtin').lsp_document_symbols()<CR>", "documents" },
        w = { "<CMD>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "workspace" },
        W = { "<CMD>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", "dynamic-workspace" },
    },
}

local comma_visual_keymaps = {
    c = { "<CMD>lua require('telescope.builtin').lsp_range_code_actions()", "code-actions" },
}

register(comma_keymaps, {
    prefix = ",",
    mode = "n",
    silent = true,
    noremap = true,
})

register(comma_visual_keymaps, {
    prefix = ",",
    mode = "x",
    silent = true,
    noremap = true,
})
