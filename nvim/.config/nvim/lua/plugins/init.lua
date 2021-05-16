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

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use {
        'tzachar/compe-tabnine',
        requires = 'hrsh7th/nvim-compe',
        run = 'chmod +x ./install.sh; ./install.sh'
    }

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
    use 'junegunn/vim-easy-align'

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
        cmd = 'MundoToggle'
    }
    use {
        'skywind3000/asyncrun.vim',
        opt = true,
        cmd = 'AsyncRun'
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
        cmd = 'Bwipeout'
    }
    use  {
        'numtostr/BufOnly.nvim',
        opt = true,
        cmd = 'BufOnly'
    }
    use 'roxma/vim-tmux-clipboard'
    use 'ryvnf/readline.vim'
    use 'tpope/vim-repeat'
    use 'tpope/vim-unimpaired'

    end
)

require('plugins/config')
require('plugins/treesitter')
require('plugins/lsp')