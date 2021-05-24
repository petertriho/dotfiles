-- TODO:
-- coc-git
-- vim-doge
local config = require("plugins/config")

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "nvim-lua/plenary.nvim"

    -- ui
    use "folke/tokyonight.nvim"
    use {
        "akinsho/nvim-bufferline.lua",
        requires = "kyazdani42/nvim-web-devicons"
    }
    use {"Famiu/feline.nvim", requires = "kyazdani42/nvim-web-devicons"}
    use {
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = config["lewis6991/gitsigns.nvim"],
        opt = true
    }

    -- lsp
    use "neovim/nvim-lspconfig"
    use {"folke/lua-dev.nvim", filetype = "lua"}
    use "glepnir/lspsaga.nvim"
    use "hrsh7th/nvim-compe"
    use {"hrsh7th/vim-vsnip", start = config["hrsh7th/vim-vsnip"]}
    use "hrsh7th/vim-vsnip-integ"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "kabouzeid/nvim-lspinstall"
    use "onsails/lspkind-nvim"
    use "rafamadriz/friendly-snippets"
    use {
        "tzachar/compe-tabnine",
        requires = "hrsh7th/nvim-compe",
        run = "chmod +x ./install.sh; ./install.sh"
    }
    use "wellle/tmux-complete.vim"

    -- syntax highlighting
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = config["folke/todo-comments.nvim"],
        opt = true
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
        branch = "lua",
        config = config["lukas-reineke/indent-blankline.nvim"],
        opt = true
    }
    use {
        "norcalli/nvim-colorizer.lua",
        config = config["norcalli/nvim-colorizer.lua"],
        opt = true
    }
    use {"sheerun/vim-polyglot", start = config["sheerun/vim-polyglot"]}

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function() require("plugins/treesitter") end,
        opt = true,
        run = ":TSUpdate"
    }
    use {
        "andymass/vim-matchup",
        require = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter"
    }
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter"
    }
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter"
    }
    use {
        "p00f/nvim-ts-rainbow",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter"
    }
    use {
        "romgrk/nvim-treesitter-context",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter"
    }
    use {
        "windwp/nvim-ts-autotag",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter"
    }

    -- text helpers
    use {
        "AndrewRadev/splitjoin.vim",
        start = config["AndrewRadev/splitjoin.vim"],
        cmd = {"SplitjoinJoin", "SplitjoinSplit"}
    }
    use "b3nj5m1n/kommentary"
    use {"junegunn/vim-easy-align", keys = "<Plug>(EasyAlign)"}

    use "machakann/vim-sandwich"
    use "mattn/emmet-vim"
    use "monaqa/dial.nvim"
    use {"tpope/vim-abolish", cmd = "Subvert", keys = "cr"}
    use {"windwp/nvim-autopairs", config = config["windwp/nvim-autopairs"]}

    -- tools
    use {
        "chumakd/scratch.vim",
        start = config["chumakd/scratch.vim"],
        cmd = "ScratchPreview"
    }
    use {
        "f-person/git-blame.nvim",
        start = config["f-person/git-blame.nvim"],
        cmd = "GitBlameToggle"
    }
    use "folke/which-key.nvim"
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = config["folke/trouble.nvim"],
        cmd = {"Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh"}
    }
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = config["kyazdani42/nvim-tree.lua"],
        cmd = {
            "NvimTreeOpen", "NvimTreeClose", "NvimTreeToggle",
            "NvimTreeRefresh", "NvimTreeFindFile", "NvimTreeClipboard"
        }
    }
    use {"mg979/vim-visual-multi", start = config["mg979/vim-visual-multi"]}
    use {"npxbr/glow.nvim", cmd = "Glow", ft = "markdown"}
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-fzy-native.nvim"
        },
        config = config["nvim-telescope/telescope.nvim"],
        cmd = "Telescope",
        module = "telescope"
    }
    use {
        "pwntester/octo.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons", "nvim-telescope/telescope.nvim"
        },
        config = config["pwntester/octo.nvim"],
        cmd = "Octo"
    }
    use {"simnalamburt/vim-mundo", cmd = "MundoToggle"}
    use {"skywind3000/asyncrun.vim", cmd = "AsyncRun"}
    use {"tpope/vim-fugitive", cmd = {"G", "Git"}}
    use {"vimwiki/vimwiki", config = config["vimwiki/vimwiki"]}
    use {
        "windwp/nvim-spectre",
        requires = {"nvim-lua/plenary.nvim", "nvim-lua/popup.nvim"},
        config = config["windwp/nvim-spectre"],
        module = "spectre"
    }

    -- motions
    use {"chaoren/vim-wordmotion", config = config["chaoren/vim-wordmotion"]}
    use {"phaazon/hop.nvim", cmd = {"HopChar1", "HopLine"}}
    use "wellle/targets.vim"
    use {"unblevable/quick-scope", opt = true}

    -- misc
    use {
        "antoinemadec/FixCursorHold.nvim",
        start = config["antoinemadec/FixCursorHold.nvim"]
    }
    use {
        "editorconfig/editorconfig-vim",
        start = config["editorconfig/editorconfig-vim"]
    }
    use {"moll/vim-bbye", cmd = "Bwipeout"}
    -- use {"numtostr/BufOnly.nvim", cmd = "BufOnly"}
    use {"schickling/vim-bufonly", cmd = "BufOnly"}
    use "roxma/vim-tmux-clipboard"
    use "ryvnf/readline.vim"
    use "tpope/vim-repeat"
    use "tpope/vim-unimpaired"
end)
