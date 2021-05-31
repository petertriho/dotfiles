-- TODO:
-- coc-git
local config = require("plugins/config")

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

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
    use {"glepnir/lspsaga.nvim", config = config["glepnir/lspsaga.nvim"]}
    use "hrsh7th/nvim-compe"
    use {"hrsh7th/vim-vsnip", start = config["hrsh7th/vim-vsnip"]}
    use "hrsh7th/vim-vsnip-integ"
    use {"jose-elias-alvarez/nvim-lsp-ts-utils", module = "nvim-lsp-ts-utils"}
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
    use "sheerun/vim-polyglot"

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = config["nvim-treesitter/nvim-treesitter"],
        opt = true,
        run = ":TSUpdate"
    }
    use {
        "andymass/vim-matchup",
        require = "nvim-treesitter/nvim-treesitter",
        config = config["andymass/vim-matchup"],
        opt = true
    }
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["JoosepAlviste/nvim-ts-context-commentstring"],
        after = "nvim-treesitter"
    }
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["nvim-treesitter/nvim-treesitter-textobjects"],
        after = "nvim-treesitter"
    }
    use {
        "p00f/nvim-ts-rainbow",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["p00f/nvim-ts-rainbow"],
        after = "nvim-treesitter"
    }
    use {
        "romgrk/nvim-treesitter-context",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter"
    }
    use {
        "windwp/nvim-autopairs",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["windwp/nvim-autopairs"],
        after = "nvim-treesitter"
    }
    use {
        "windwp/nvim-ts-autotag",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["windwp/nvim-ts-autotag"],
        after = "nvim-treesitter"
    }

    -- text helpers
    use {
        "AndrewRadev/splitjoin.vim",
        start = config["AndrewRadev/splitjoin.vim"],
        cmd = {"SplitjoinJoin", "SplitjoinSplit"}
    }
    use {"chaoren/vim-wordmotion", config = config["chaoren/vim-wordmotion"]}
    use "b3nj5m1n/kommentary"
    use {"junegunn/vim-easy-align", keys = "<Plug>(EasyAlign)"}

    use "machakann/vim-sandwich"
    use "mattn/emmet-vim"
    use "monaqa/dial.nvim"
    use {"tpope/vim-abolish", cmd = "Subvert", keys = "cr"}
    use "wellle/targets.vim"

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
        "folke/zen-mode.nvim",
        config = config["folke/zen-mode-nvim"],
        cmd = {"ZenMode"}
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
    use {"mg979/vim-visual-multi", config = config["mg979/vim-visual-multi"]}
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
    use {
        "TimUntersberger/neogit",
        requires = {"nvim-lua/plenary.nvim", "sindrets/diffview.nvim"},
        config = config["TimUntersberger/neogit"],
        cmd = "Neogit",
        module = "neogit"
    }
    use {"tpope/vim-fugitive", cmd = {"G", "Git"}}
    use {"vimwiki/vimwiki", opt = true}
    use {
        "windwp/nvim-spectre",
        requires = {"nvim-lua/plenary.nvim", "nvim-lua/popup.nvim"},
        config = config["windwp/nvim-spectre"],
        module = "spectre"
    }

    -- motions
    use {"phaazon/hop.nvim", cmd = {"HopChar1", "HopLine"}}
    use {"unblevable/quick-scope", opt = true}

    -- misc
    use {
        "antoinemadec/FixCursorHold.nvim",
        start = config["antoinemadec/FixCursorHold.nvim"]
    }
    use {"dstein64/vim-startuptime", cmd = "StartupTime"}
    use {
        "editorconfig/editorconfig-vim",
        start = config["editorconfig/editorconfig-vim"]
    }
    use {"famiu/bufdelete.nvim", cmd = "Bwipeout"}
    use {
        "kkoomen/vim-doge",
        config = config["kkoomen/vim-doge"],
        run = ":call doge#install({ 'headless': 1 })"
    }
    use "ryvnf/readline.vim"
    use {"schickling/vim-bufonly", cmd = "BufOnly"}
    use "tpope/vim-repeat"
    use {"tpope/vim-unimpaired", opt = true}
end)

require("plugins/lazyload")
