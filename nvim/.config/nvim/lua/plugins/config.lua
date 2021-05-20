local config = {}

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
vim.g.EditorConfig_exclude_patterns = {"fugitive://.*"}

-- kyazdani42/nvim-tree.lua
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1

-- f-person/git-blame.nvim
vim.g.gitblame_enabled = 0

-- folke/todo-comments.nvim
config["folke/todo-comments.nvim"] =
    function() require("todo-comments").setup() end

-- lukas-reineke/indent-blankline.nvim
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_filetype_exclude = {
    "NvimTree", "lspinfo", "Mundo", "MundoDiff", "packer", "fugitive",
    "fugitiveblame", "javascriptreact", "typescriptreact"
}

-- monaqa/dial.nvim
set_keymap("n", "<C-a>", "<Plug>(dial-increment)", {silent = true})
set_keymap("n", "<C-x>", "<Plug>(dial-decrement)", {silent = true})
set_keymap("v", "<C-a>", "<Plug>(dial-increment)", {silent = true})
set_keymap("v", "<C-x>", "<Plug>(dial-decrement)", {silent = true})
set_keymap("v", "g<C-a>", "<Plug>(dial-increment-additional)", {silent = true})
set_keymap("v", "g<C-x>", "<Plug>(dial-decrement-additional)", {silent = true})

-- norcalli/nvim-colorizer.lua
require("colorizer").setup()

-- nvim-telescope/telescope.nvim
local actions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg", "--color=never", "--no-heading", "--with-filename",
            "--line-number", "--column", "--smart-case", "--hidden"
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
            }
        },
        file_ignore_patterns = {".git"}
    }
}
require("telescope").load_extension("fzy_native")

-- phaazon/hop.nvim
set_keymap("", "ss", "<CMD>HopChar1<CR>", {silent = true})
set_keymap("", "sl", "<CMD>HopLine<CR>", {silent = true})

-- pwntester/octo.nvim
config["pwntester/octo.nvim"] = function() require("octo").setup() end

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

-- windwp/nvim-autopairs
require("nvim-autopairs").setup()

return config
