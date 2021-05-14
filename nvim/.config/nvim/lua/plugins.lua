-- TODO:
-- neoclide/coc.nvim -> switch to native lsp
-- honzo/vim-snippets
-- might still need polyglot
-- install hop to replace sneak https://github.com/phaazon/hop.nvim
-- markdown preview  https://github.com/npxbr/glow.nvim and https://github.com/davidgranstrom/nvim-markdown-preview
-- replace fzf with telescope (or have both?)
-- find replacements for texthelpers
-- undotree
-- fugitive replacement
-- vim wiki
-- coc-git
-- coc-highlight
-- multiline
-- https://github.com/liuchengxu/vista.vim
-- https://github.com/folke/too-comments.nvim
--

require('packer').startup(
    function(use)
	use 'wbthomason/packer.nvim'

    -- theme
    use 'folke/tokyonight.nvim'

    -- language/syntax highlighting
    use {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'lua'
    }
    use 'wellle/tmux-complete.vim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    use {
        'p00f/nvim-ts-rainbow',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    use {
        'romgrk/nvim-treesitter-context',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    use {
        'theHamsta/nvim-treesitter-pairs',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }

    -- text helpers
    use 'alvan/vim-closetag'
    use {
        'AndrewRadev/splitjoin.vim',
        opt = true,
        cmd = { 'SplitjoinJoin', 'SplitjoinSplit' }
    }
    use 'AndrewRadev/tagalong.vim'
    use 'b3nj5m1n/kommentary'
    use 'chaoren/vim-wordmotion'
    use {
        'junegunn/vim-easy-align',
        opt = true,
        cmd = { 'EasyAlign' }
    }
    use 'machakann/vim-sandwich'
    use 'mattn/emmet-vim'
    use {
        'rmagatti/alternate-toggler',
        opt = true,
        cmd = { 'ToggleAlternate' }
    }
    use 'tpope/vim-abolish'
    use 'tpope/vim-characterize'
    use 'tpope/vim-speeddating'
    use 'wellle/targets.vim'

    -- tools
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
        'hoob3rt/lualine.nvim',
	    requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
        'akinsho/nvim-bufferline.lua',
	    requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use 'chumakd/scratch.vim'
	use 'folke/which-key.nvim'
    use {
        'skywind3000/asyncrun.vim',
        opt = true,
        cmd = { 'AsyncRun' }
    }

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
    use 'unblevable/quick-scope'

    end
)
-- alvan/vim-closetag
vim.g.closetag_filenames = '*.html,*.jsx,*.tsx'

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

-- lukas-reineke/indent-blankline.nvim
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_filetype_exclude = {
    'NvimTree',
    'javascriptreact',
    'typescriptreact'
}

-- nvim-treesitter/nvim-treesitter
require 'nvim-treesitter.configs'.setup {
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
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1000
    },
    textobjects = {
        enable = true
    }
}

