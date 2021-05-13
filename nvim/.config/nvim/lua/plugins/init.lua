-- TODO:
-- honzo/vim-snippets
-- neoclide/coc.nvim -> switch to native lsp
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

require('packer').startup(
    function(use)
	use 'wbthomason/packer.nvim'

    -- theme
    use 'sainnhe/edge'

    -- language/syntax highlighting
    use {
        'kkoomen/vim-doge',
        run = function() vim.fn['doge#install']({ headless = 1 }) end
    }
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
        'romgrk/barbar.nvim',
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
    use 'roxma/vim-tmux-clipboard'
    use 'ryvnf/readline.vim'
    use 'tpope/vim-repeat'
    use 'tpope/vim-unimpaired'
    use 'unblevable/quick-scope'

    end
)

require('plugins/config')
