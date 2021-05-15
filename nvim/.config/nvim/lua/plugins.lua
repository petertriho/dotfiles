-- TODO:
-- neoclide/coc.nvim -> switch to native lsp
-- honzo/vim-snippets
-- might still need polyglot
-- markdown preview  https://github.com/npxbr/glow.nvim and https://github.com/davidgranstrom/nvim-markdown-preview
-- replace fzf with telescope (or have both?)
-- fugitive replacement
-- vim wiki
-- coc-git
-- coc-highlight
-- multiline
-- https://github.com/liuchengxu/vista.vim
-- vim-doge

require('packer').startup(
    function(use)
	use 'wbthomason/packer.nvim'

    -- theme
    use 'folke/tokyonight.nvim'

    -- language/syntax highlighting
    use {
        'folke/todo-comments.nvim',
        requires = "nvim-lua/plenary.nvim"
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'lua'
    }
    use 'norcalli/nvim-colorizer.lua'
    use 'wellle/tmux-complete.vim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        requires = 'nvim-treesitter/nvim-treesitter'
    }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        requires = 'nvim-treesitter/nvim-treesitter'
    }
    use {
        'p00f/nvim-ts-rainbow',
        requires = 'nvim-treesitter/nvim-treesitter'
    }
    use {
        'romgrk/nvim-treesitter-context',
        requires = 'nvim-treesitter/nvim-treesitter'
    }
    use {
        'windwp/nvim-ts-autotag',
        requires = 'nvim-treesitter/nvim-treesitter'
    }

    -- text helpers
    use {
        'AndrewRadev/splitjoin.vim',
        opt = true,
        cmd = { 'SplitjoinJoin', 'SplitjoinSplit' }
    }
    use 'andymass/vim-matchup'
    use 'b3nj5m1n/kommentary'
    use {
        'junegunn/vim-easy-align',
        opt = true,
        cmd = { 'EasyAlign' }
    }
    use 'machakann/vim-sandwich'
    use 'mattn/emmet-vim'
    use 'monaqa/dial.nvim'
    use 'tpope/vim-abolish'
    use 'windwp/nvim-autopairs'

    -- tools
    use {
        'akinsho/nvim-bufferline.lua',
	    requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'chumakd/scratch.vim'
	use 'folke/which-key.nvim'
    use {
        'hoob3rt/lualine.nvim',
	    requires = 'kyazdani42/nvim-web-devicons'
    }
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'simnalamburt/vim-mundo',
        opt = true,
        cmd = { 'MundoToggle' }
    }
    use {
        'skywind3000/asyncrun.vim',
        opt = true,
        cmd = { 'AsyncRun' }
    }

    -- motions
    use 'chaoren/vim-wordmotion'
    use 'phaazon/hop.nvim'
    use 'wellle/targets.vim'
    use 'unblevable/quick-scope'

    -- misc
    use 'antoinemadec/FixCursorHold.nvim'
    use 'editorconfig/editorconfig-vim'
    use {
        'moll/vim-bbye',
        opt = true,
        cmd = { 'Bwipeout' }
    }
    use  {
        'numtostr/BufOnly.nvim',
        opt = true,
        cmd = { 'BufOnly' }
    }
    use 'roxma/vim-tmux-clipboard'
    use 'ryvnf/readline.vim'
    use 'tpope/vim-repeat'
    use 'tpope/vim-unimpaired'

    end
)

local set_keymap = vim.api.nvim_set_keymap

-- AndrewRadev/splitjoin.vim
vim.g.splitjoin_split_mapping = ''
vim.g.splitjoin_join_mapping = ''

-- antoinemadec/FixCursorHold.nvim
vim.g.cursorhold_updatetime = 100

-- chaoren/vim-wordmotion
vim.g.wordmotion_prefix = '\\'

-- chumakd/scratch.vim
vim.g.scratch_persistence_file = '/tmp/scratch.txt'

-- editorconfig/editorconfig-vim
vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*' }

-- kyazdani42/nvim-tree.lua
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1

-- folke/todo-comments.nvim
require('todo-comments').setup()

-- lukas-reineke/indent-blankline.nvim
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_filetype_exclude = {
    'NvimTree',
    'javascriptreact',
    'typescriptreact'
}

-- monaqa/dial.nvim
set_keymap('n', '<C-a>', '<Plug>(dial-increment)', { silent = true })
set_keymap('n', '<C-x>', '<Plug>(dial-decrement)', { silent = true })
set_keymap('v', '<C-a>', '<Plug>(dial-increment)', { silent = true })
set_keymap('v', '<C-x>', '<Plug>(dial-decrement)', { silent = true })
set_keymap('v', 'g<C-a>', '<Plug>(dial-increment-additional)', { silent = true })
set_keymap('v', 'g<C-x>', '<Plug>(dial-decrement-additional)', { silent = true })

-- norcalli/nvim-colorizer.lua
require('colorizer').setup()

-- nvim-treesitter/nvim-treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "bash",
        "comment",
        "css",
        "go",
        "graphql",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "python",
        "regex",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "yaml"
    },
    autotag = {
        enable = true
    },
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true
    },
    indentation = {
        enable = true
    },
    matchup = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1000,
        colors = {
            '#f7768e',
            '#9ece6a',
            '#e0af68',
            '#7aa2f7',
            '#bb9af7',
            '#7dcfff'
        }
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            }
        }
    }
}

-- phaazon/hop.nvim
set_keymap('', 'ss', '<CMD>HopChar1<CR>', { silent = true })
set_keymap('', 'sl', '<CMD>HopLine<CR>', { silent = true })

-- simnalamburt/vim-mundo
vim.cmd([[
if has('persistent_undo')
    if !isdirectory($HOME . '/.undodir')
        call mkdir($HOME . '/.undodir')
    endif

    set undodir=$HOME/.undodir
    set undofile
endif
]])

-- windwp/nvim-autopairs
require('nvim-autopairs').setup()
