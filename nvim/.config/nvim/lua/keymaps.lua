local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

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
set_keymap("n", "<C-W><C-M>", "<CMD>WinShift<CR>", opts)
set_keymap("n", "<C-W>m", "<CMD>WinShift<CR>", opts)
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
set_keymap("n", "sf", "<Plug>Lightspeed_s", {})
set_keymap("n", "sb", "<Plug>Lightspeed_S", {})
set_keymap("n", ";", "<Plug>Lightspeed_s<CR>", {})
set_keymap("n", ",", "<Plug>Lightspeed_S<CR>", {})

set_keymap("x", "sf", "<Plug>Lightspeed_x", {})
set_keymap("x", "sb", "<Plug>Lightspeed_X", {})
set_keymap("x", ";", "<Plug>Lightspeed_x<CR>", {})
set_keymap("x", ",", "<Plug>Lightspeed_X<CR>", {})

set_keymap("", "f", "<Plug>Lightspeed_f", {})
set_keymap("", "F", "<Plug>Lightspeed_F", {})
set_keymap("", "t", "<Plug>Lightspeed_t", {})
set_keymap("", "T", "<Plug>Lightspeed_T", {})

-- Which Key
local keymaps = {
	[" "] = { ":w<CR>", "write" },
	["'"] = { "<CMD>DBUIToggle<CR>", "db" },
	[","] = { "<CMD>ScratchPreview<CR>", "scratch-preview" },
	["-"] = { "<C-w>s", "split-below" },
	["."] = { "<CMD>BWipeout other<CR>", "only-buffer" },
	[">"] = { "<CMD>BWipeout hidden<CR>", "hidden-buffers" },
	["/"] = { "<Plug>kommentary_line_default", "comment" },
	[":"] = {
		"<CMD>Telescope find_files find_command=fd,-HIL<CR>",
		"find-files-all",
	},
	[";"] = { "<CMD>Telescope find_files hidden=true<CR>", "find-files" },
	["\\"] = { "<C-w>v", "split-right" },
	["["] = { "<CMD>LLToggle<CR>", "loc-list-toggle" },
	["]"] = { "<CMD>QFToggle<CR>", "qf-list-toggle" },
	b = { "<CMD>Telescope buffers<CR>", "buffers" },
	c = { "<CMD>Cheat<CR>", "cheat" },
	C = { "<CMD>CheatList<CR>", "cheat-list" },
	d = { "<CMD>Bwipeout<CR>", "delete-buffer" },
	D = { "<CMD>BWipeout all<CR>", "delete-all-buffers" },
	e = { "<CMD>NvimTreeToggle<CR>", "explorer" },
	j = { ":call ToggleGitStatus()<CR>", "git-status" },
	J = { ":call ToggleNeogitStatus()<CR>", "git-status" },
	m = { "<CMD>Glow<CR>", "markdown-preview" },
	n = { ":nohl<CR>", "no-highlight" },
	r = { "<CMD>lua require('spectre').open()<CR>", "find-replace" },
	s = { "<CMD>Telescope live_grep<CR>", "search-text" },
	t = { "<CMD>TroubleToggle<CR>", "trouble" },
	u = { "<CMD>MundoToggle<CR>", "undotree" },
	y = { "<CMD>lua require('telescope').extensions.neoclip.default()<CR>", "yank-history" },
	z = { "<CMD>ZenMode<CR>", "zenmode" },
}

local visual_keymaps = {
	["/"] = { "<Plug>kommentary_visual_default", "comment" },
	s = { "<Plug>(vsnip-select-text)", "snippet-select" },
	S = { "<Plug>(vsnip-cut-text)", "snippet-cut" },
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

set_keymap("", "<Leader>1", "<CMD>lua require'bufferline'.go_to_buffer(1)<CR>", {})
set_keymap("", "<Leader>2", "<CMD>lua require'bufferline'.go_to_buffer(2)<CR>", {})
set_keymap("", "<Leader>3", "<CMD>lua require'bufferline'.go_to_buffer(3)<CR>", {})
set_keymap("", "<Leader>4", "<CMD>lua require'bufferline'.go_to_buffer(4)<CR>", {})
set_keymap("", "<Leader>5", "<CMD>lua require'bufferline'.go_to_buffer(5)<CR>", {})
set_keymap("", "<Leader>6", "<CMD>lua require'bufferline'.go_to_buffer(6)<CR>", {})
set_keymap("", "<Leader>7", "<CMD>lua require'bufferline'.go_to_buffer(7)<CR>", {})
set_keymap("", "<Leader>8", "<CMD>lua require'bufferline'.go_to_buffer(8)<CR>", {})
set_keymap("", "<Leader>9", "<CMD>lua require'bufferline'.go_to_buffer(9)<CR>", {})
set_keymap("", "<Leader>0", "<CMD>lua require'bufferline'.go_to_buffer(10)<CR>", {})

keymaps["a"] = {
	name = "+action",
	a = { "<Plug>(EasyAlign)", "align" },
	d = "doc-gen",
	e = { ":!chmod +x %<CR>", "executable" },
	j = { "<CMD>SplitjoinJoin<CR>", "join-lines" },
	p = { 'ggVG"+p', "paste-file" },
	s = { "<CMD>ISwap<CR>", "swap" },
	x = { "<CMD>SplitjoinSplit<CR>", "split-lines" },
	y = { "<CMD>%y+<CR>", "yank-file" },
}

visual_keymaps["a"] = {
	name = "+action",
	a = { "<Plug>(EasyAlign)", "align" },
	s = { ":sort i<CR>", "sort" },
}

keymaps["g"] = {
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

keymaps["h"] = {
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

keymaps["p"] = {
	name = "+package-info",
	c = { "<CMD>lua require('package-info').change_version()<CR>", "change-version" },
	d = { "<CMD>lua require('package-info').delete()<CR>", "delete" },
	h = { "<CMD>lua require('package-info').hide()<CR>", "hide" },
	i = { "<CMD>lua require('package-info').install()<CR>", "install" },
	r = { "<CMD>lua require('package-info').reinstall()<CR>", "reinstall" },
	s = { "<CMD>lua require('package-info').show()<CR>", "show" },
	u = { "<CMD>lua require('package-info').update()<CR>", "update" },
}

keymaps["w"] = { name = "+wiki" }

keymaps["S"] = {
	"<CMD>lua require('telescope.builtin').live_grep({search_dirs = {os.getenv('VIMWIKI_PATH')}})<CR>",
	"search-wiki",
}
keymaps["W"] = {
	"<CMD>lua require('telescope.builtin').find_files({search_dirs = {os.getenv('VIMWIKI_PATH')}})<CR>",
	"find-wiki",
}

require("which-key").setup()

local register = require("which-key").register
register(keymaps, {
	prefix = "<Leader>",
	mode = "n",
	silent = true,
	noremap = true,
})

register(visual_keymaps, {
	prefix = "<Leader>",
	mode = "x",
	silent = true,
	noremap = true,
})
