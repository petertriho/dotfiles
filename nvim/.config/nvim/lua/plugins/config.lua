local set_keymap = vim.api.nvim_set_keymap

-- AndrewRadev/splitjoin.vim
vim.g.splitjoin_split_mapping = ""
vim.g.splitjoin_join_mapping = ""

-- antoinemadec/FixCursorHold.nvim
vim.g.cursorhold_updatetime = 100

-- chaoren/vim-wordmotion
vim.g.wordmotion_prefix = "\\"

-- chumakd/scratch.vim
vim.g.scratch_persistence_file = "/tmp/scratch.txt"

-- editorconfig/editorconfig-vim
vim.g.EditorConfig_exclude_patterns = { "fugitive://.*" }

-- kyazdani42/nvim-tree.lua
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1

-- f-person/git-blame.nvim
vim.g.gitblame_enabled = 0

-- folke/todo-comments.nvim
require("todo-comments").setup()

-- lukas-reineke/indent-blankline.nvim
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_filetype_exclude = {
    "NvimTree",
    "lspinfo",
    "Mundo",
    "MundoDiff",
    "packer",
    "fugitive",
    "fugitiveblame",
    "javascriptreact",
    "typescriptreact"
}

-- monaqa/dial.nvim
set_keymap("n", "<C-a>", "<Plug>(dial-increment)", { silent = true })
set_keymap("n", "<C-x>", "<Plug>(dial-decrement)", { silent = true })
set_keymap("v", "<C-a>", "<Plug>(dial-increment)", { silent = true })
set_keymap("v", "<C-x>", "<Plug>(dial-decrement)", { silent = true })
set_keymap("v", "g<C-a>", "<Plug>(dial-increment-additional)", { silent = true })
set_keymap("v", "g<C-x>", "<Plug>(dial-decrement-additional)", { silent = true })

-- norcalli/nvim-colorizer.lua
require("colorizer").setup()

-- tpope/vim-fugitive
vim.cmd([[
function! ToggleGstatus(vertical, ...)
    let fugitive_buffer_name = bufname('.git/*index')
    if buflisted(fugitive_buffer_name)
        execute "bd " . fugitive_buffer_name
    else
        if a:vertical == 0
            Git
        else
            vertical Git
        endif
    endif
endfunction
]])

-- phaazon/hop.nvim
set_keymap("", "ss", "<CMD>HopChar1<CR>", { silent = true })
set_keymap("", "sl", "<CMD>HopLine<CR>", { silent = true })

-- simnalamburt/vim-mundo
vim.cmd([[
if has("persistent_undo")
    if !isdirectory($HOME . "/.undodir")
        call mkdir($HOME . "/.undodir")
    endif

    set undodir=$HOME/.undodir
    set undofile
endif
]])

-- windwp/nvim-autopairs
require("nvim-autopairs").setup()
