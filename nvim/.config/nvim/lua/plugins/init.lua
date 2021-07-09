-- TODO:
-- coc-git: gh issues autocomplete
local config = require("plugins/config")

require("packer").init({max_jobs = 50})
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
    use {"glepnir/lspsaga.nvim", config = config["glepnir/lspsaga.nvim"]}
    use {"jose-elias-alvarez/null-ls.nvim", module = "null-ls"}
    use {"jose-elias-alvarez/nvim-lsp-ts-utils", module = "nvim-lsp-ts-utils"}
    use "kabouzeid/nvim-lspinstall"

    -- completion
    use {
        "hrsh7th/nvim-compe",
        config = config["hrsh7th/nvim-compe"],
        opt = true
    }
    use {"andersevenrud/compe-tmux", after = "nvim-compe"}
    use {
        "hrsh7th/vim-vsnip",
        config = config["hrsh7th/vim-vsnip"],
        after = "nvim-compe"
    }
    use {
        "kristijanhusak/vim-dadbod-completion",
        requires = "tpope/vim-dadbod",
        after = "nvim-compe"
    }
    use {
        "onsails/lspkind-nvim",
        config = config["onsails/lspkind-nvim"],
        after = "nvim-compe"
    }
    use {"rafamadriz/friendly-snippets", after = "nvim-compe"}
    use {
        "tzachar/compe-tabnine",
        requires = "hrsh7th/nvim-compe",
        run = "chmod +x ./install.sh; ./install.sh",
        after = "nvim-compe"
    }

    -- syntax highlighting
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = config["folke/todo-comments.nvim"],
        opt = true
    }
    use {"pantharshit00/vim-prisma", filetype = "prisma"}
    use {"lukas-reineke/indent-blankline.nvim", opt = true}
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
        "mizlan/iswap.nvim",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
        cmd = "ISwap"
    }
    use {
        "nvim-treesitter/nvim-treesitter-refactor",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["nvim-treesitter/nvim-treesitter-refactor"],
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
        "RRethy/nvim-treesitter-textsubjects",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["RRethy/nvim-treesitter-textsubjects"],
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
        "AckslD/nvim-anywise-reg.lua",
        config = config["AckslD/nvim-anywise-reg.lua"]
    }
    use {"AndrewRadev/splitjoin.vim", cmd = {"SplitjoinJoin", "SplitjoinSplit"}}
    use "chaoren/vim-wordmotion"
    use "b3nj5m1n/kommentary"
    use {"junegunn/vim-easy-align", keys = "<Plug>(EasyAlign)"}
    use "machakann/vim-sandwich"
    use "mattn/emmet-vim"
    use "monaqa/dial.nvim"
    use {"tpope/vim-abolish", cmd = "Subvert", keys = "cr"}
    use "wellle/targets.vim"

    -- tools
    use {"chumakd/scratch.vim", cmd = "ScratchPreview"}
    use "folke/which-key.nvim"
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = config["folke/trouble.nvim"],
        cmd = {"Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh"}
    }
    use {
        "kristijanhusak/vim-dadbod-ui",
        requires = "tpope/vim-dadbod",
        cmd = {"DBUI", "DBUIToggle", "DBUIAddConnection"}
    }
    use {
        "folke/zen-mode.nvim",
        config = config["folke/zen-mode-nvim"],
        cmd = "ZenMode"
    }
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        cmd = {
            "NvimTreeOpen", "NvimTreeClose", "NvimTreeToggle",
            "NvimTreeRefresh", "NvimTreeFindFile", "NvimTreeClipboard"
        }
    }
    use "mg979/vim-visual-multi"
    use {"npxbr/glow.nvim", cmd = "Glow"}
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
    use {
        "RishabhRD/nvim-cheat.sh",
        requires = "RishabhRD/popfix",
        cmd = {
            "Cheat", "CheatWithoutComments", "CheatList",
            "CheatListWithoutComments"
        }
    }
    use {"stevearc/qf_helper.nvim", config = config["stevearc/qf_helper.nvim"]}
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
    use "antoinemadec/FixCursorHold.nvim"
    use {"dstein64/vim-startuptime", cmd = "StartupTime"}
    use "editorconfig/editorconfig-vim"

    use {"famiu/bufdelete.nvim", cmd = {"Bwipeout", "Bdelete"}}
    use {
        "kkoomen/vim-doge",
        config = config["kkoomen/vim-doge"],
        run = ":call doge#install({ 'headless': 1 })"
    }
    use "ryvnf/readline.vim"
    use {"schickling/vim-bufonly", cmd = "BufOnly"}
    use "tpope/vim-repeat"
    use {"tpope/vim-unimpaired", opt = true}
    use {
        "winston0410/range-highlight.nvim",
        requires = "winston0410/cmd-parser.nvim",
        config = config["winston0410/range-highlight.nvim"]
    }
end)

require("plugins/lazyload")
