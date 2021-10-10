-- TODO:
-- coc-git: gh issues autocomplete
local config = require("plugins.config")

require("packer").init({ max_jobs = 50 })
require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use("lewis6991/impatient.nvim")
    use("nvim-lua/plenary.nvim")

    -- ui
    use("folke/tokyonight.nvim")
    use({
        "akinsho/nvim-bufferline.lua",
        requires = "kyazdani42/nvim-web-devicons",
    })
    use({
        "Famiu/feline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    })
    use({
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = config["lewis6991/gitsigns.nvim"],
        opt = true,
    })

    -- lsp
    use("neovim/nvim-lspconfig")
    use({ "brymer-meneses/grammar-guard.nvim", run = ":GrammarInstall" })
    use({ "folke/lua-dev.nvim", filetype = "lua" })
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils", module = "nvim-lsp-ts-utils" })
    use("kabouzeid/nvim-lspinstall")
    use({ "kosayoda/nvim-lightbulb", opt = true })
    use("nvim-lua/lsp-status.nvim")
    use({
        "ray-x/lsp_signature.nvim",
        config = config["ray-x/lsp_signature.nvim"],
    })
    use({
        "RishabhRD/nvim-lsputils",
        config = config["RishabhRD/nvim-lsputils"],
        requires = "RishabhRD/popfix",
    })
    use({
        "rmagatti/goto-preview",
        config = config["rmagatti/goto-preview"],
        keys = { "gpd", "gpi", "gpr", "gP" },
    })
    use({
        "simrat39/symbols-outline.nvim",
        cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    })
    use({
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    })

    -- completion
    use({
        "hrsh7th/nvim-cmp",
        config = config["hrsh7th/nvim-cmp"],
        event = "InsertEnter",
    })
    use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-vsnip", after = "nvim-cmp" })
    use({
        "hrsh7th/vim-vsnip",
        setup = config["hrsh7th/vim-vsnip"],
        after = "nvim-cmp",
    })
    use({
        "andersevenrud/compe-tmux",
        branch = "cmp",
        after = "nvim-cmp",
    })
    use({
        "kristijanhusak/vim-dadbod-completion",
        requires = "tpope/vim-dadbod",
        after = "nvim-cmp",
    })
    use({
        "onsails/lspkind-nvim",
        module = "lspkind",
    })
    use({
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        after = "nvim-cmp",
    })
    use({ "rafamadriz/friendly-snippets", after = "nvim-cmp" })

    -- syntax highlighting
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = config["folke/todo-comments.nvim"],
        opt = true,
    })
    use({ "pantharshit00/vim-prisma", ft = "prisma" })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = config["lukas-reineke/indent-blankline.nvim"],
        opt = true,
    })
    use({
        "luochen1990/rainbow",
        setup = config["luochen1990/rainbow"],
        opt = true,
    })
    use({
        "plasticboy/vim-markdown",
        requires = "godlygeek/tabular",
        setup = config["plasticboy/vim-markdown"],
        opt = true,
        ft = { "markdown", "vimwiki" },
    })
    use({
        "norcalli/nvim-colorizer.lua",
        config = config["norcalli/nvim-colorizer.lua"],
        opt = true,
    })
    use({ "sheerun/vim-polyglot", setup = config["sheerun/vim-polyglot"] })

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        config = config["nvim-treesitter/nvim-treesitter"],
        opt = true,
        run = ":TSUpdateSync",
    })
    use({
        "abecodes/tabout.nvim",
        requires = "nvim-treesitter",
        config = config["abecodes/tabout.nvim"],
        after = { "nvim-cmp", "nvim-treesitter" },
    })
    use({
        "andymass/vim-matchup",
        require = "nvim-treesitter/nvim-treesitter",
        config = config["andymass/vim-matchup"],
        after = "nvim-treesitter",
    })
    use({
        "danymat/neogen",
        config = config["danymat/neogen"],
        requires = "nvim-treesitter/nvim-treesitter",
        module = "neogen",
    })
    use({
        "JoosepAlviste/nvim-ts-context-commentstring",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["JoosepAlviste/nvim-ts-context-commentstring"],
        after = "nvim-treesitter",
    })
    use({
        "mizlan/iswap.nvim",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
        cmd = "ISwap",
    })
    use({
        "nvim-treesitter/nvim-treesitter-refactor",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["nvim-treesitter/nvim-treesitter-refactor"],
        after = "nvim-treesitter",
    })
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["nvim-treesitter/nvim-treesitter-textobjects"],
        after = "nvim-treesitter",
    })
    use({
        "p00f/nvim-ts-rainbow",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["p00f/nvim-ts-rainbow"],
        after = "nvim-treesitter",
    })
    use({
        "RRethy/nvim-treesitter-textsubjects",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["RRethy/nvim-treesitter-textsubjects"],
        after = "nvim-treesitter",
    })
    use({
        "romgrk/nvim-treesitter-context",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["romgrk/nvim-treesitter-context"],
        after = "nvim-treesitter",
    })
    use({
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["SmiteshP/nvim-gps"],
        after = "nvim-treesitter",
        module = "nvim-gps",
    })
    use({
        "windwp/nvim-autopairs",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["windwp/nvim-autopairs"],
        after = { "nvim-treesitter", "nvim-cmp" },
    })
    use({
        "windwp/nvim-ts-autotag",
        requires = "nvim-treesitter/nvim-treesitter",
        config = config["windwp/nvim-ts-autotag"],
        after = "nvim-treesitter",
    })

    -- text helpers
    use({
        "AndrewRadev/splitjoin.vim",
        setup = config["AndrewRadev/splitjoin.vim"],
        cmd = { "SplitjoinJoin", "SplitjoinSplit" },
    })
    use({ "chaoren/vim-wordmotion", setup = config["chaoren/vim-wordmotion"] })
    use({ "junegunn/vim-easy-align", keys = "<Plug>(EasyAlign)" })
    use({
        "machakann/vim-sandwich",
        config = config["machakann/vim-sandwich"],
    })
    use("mattn/emmet-vim")
    use("monaqa/dial.nvim")
    use({
        "numToStr/Comment.nvim",
        config = config["numToStr/Comment.nvim"],
    })
    use({ "tommcdo/vim-exchange", keys = { "cx", "X" } })
    use({ "tpope/vim-abolish", cmd = "Subvert", keys = "cr" })
    use("wellle/targets.vim")

    -- telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
        config = config["nvim-telescope/telescope.nvim"],
        cmd = "Telescope",
        module = "telescope",
    })
    use({
        "AckslD/nvim-neoclip.lua",
        config = config["AckslD/nvim-neoclip.lua"],
    })
    use({
        "pwntester/octo.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            "nvim-telescope/telescope.nvim",
        },
        config = config["pwntester/octo.nvim"],
        cmd = "Octo",
    })

    -- tools
    use({
        "chumakd/scratch.vim",
        setup = config["chumakd/scratch.vim"],
        cmd = "ScratchPreview",
    })
    use({
        "ellisonleao/glow.nvim",
        run = "GlowInstall",
        cmd = { "Glow", "GlowInstall" },
    })
    use("folke/which-key.nvim")
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = config["folke/trouble.nvim"],
        cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
    })
    use({
        "folke/twilight.nvim",
        config = config["folke/twilight.nvim"],
        cmd = { "Twilight", "TwilghtEnable", "TwilightDisable" },
        module = "zen-mode",
    })
    use({
        "folke/zen-mode.nvim",
        config = config["folke/zen-mode-nvim"],
        cmd = "ZenMode",
    })
    use({
        "kristijanhusak/vim-dadbod-ui",
        requires = "tpope/vim-dadbod",
        setup = config["kristijanhusak/vim-dadbod-ui"],
        cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection" },
    })
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = config["kyazdani42/nvim-tree.lua"],
        cmd = {
            "NvimTreeOpen",
            "NvimTreeClose",
            "NvimTreeToggle",
            "NvimTreeRefresh",
            "NvimTreeFindFile",
            "NvimTreeClipboard",
        },
    })
    use({ "mg979/vim-visual-multi", setup = config["mg979/vim-visual-multi"] })
    use({
        "RishabhRD/nvim-cheat.sh",
        requires = "RishabhRD/popfix",
        setup = config["RishabhRD/nvim-cheat.sh"],
        cmd = {
            "Cheat",
            "CheatWithoutComments",
            "CheatList",
            "CheatListWithoutComments",
        },
    })
    use({ "simnalamburt/vim-mundo", cmd = "MundoToggle" })
    use({ "skywind3000/asyncrun.vim", cmd = "AsyncRun" })
    use({
        "TimUntersberger/neogit",
        requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
        config = config["TimUntersberger/neogit"],
        cmd = "Neogit",
        module = "neogit",
    })
    use({ "tpope/vim-fugitive", cmd = { "G", "Git" } })
    use({
        "vimwiki/vimwiki",
        setup = config["vimwiki/vimwiki"],
        keys = { "<leader>w" },
    })
    use({
        "vuki656/package-info.nvim",
        requires = "MunifTanjim/nui.nvim",
        config = config["vuki656/package-info.nvim"],
        module = "package-info",
    })
    use({
        "windwp/nvim-spectre",
        requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
        config = config["windwp/nvim-spectre"],
        module = "spectre",
    })

    -- motions
    use({
        "ggandor/lightspeed.nvim",
        config = config["ggandor/lightspeed.nvim"],
        keys = {
            "<Plug>Lightspeed_s",
            "<Plug>Lightspeed_S",
            "<Plug>Lightspeed_x",
            "<Plug>Lightspeed_X",
            "<Plug>Lightspeed_f",
            "<Plug>Lightspeed_F",
            "<Plug>Lightspeed_t",
            "<Plug>Lightspeed_T",
        },
    })
    use({ "unblevable/quick-scope", opt = true })

    -- misc
    use({
        "antoinemadec/FixCursorHold.nvim",
        setup = config["antoinemadec/FixCursorHold.nvim"],
    })
    use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
    use({
        "editorconfig/editorconfig-vim",
        setup = config["editorconfig/editorconfig-vim"],
    })
    use({ "famiu/bufdelete.nvim", cmd = { "Bwipeout", "Bdelete" } })
    use({
        "kazhala/close-buffers.nvim",
        config = config["kazhala/close-buffers.nvim"],
        cmd = { "BDelete", "BWipeout" },
    })
    use({
        "kwkarlwang/bufjump.nvim",
        config = config["kwkarlwang/bufjump.nvim"],
    })
    use("ryvnf/readline.vim")
    use({
        "sindrets/winshift.nvim",
        config = config["sindrets/winshift.nvim"],
        cmd = "WinShift",
    })
    use({
        "stevearc/qf_helper.nvim",
        config = config["stevearc/qf_helper.nvim"],
        cmd = { "QNext", "QPrev", "LLToggle", "QFToggle" },
    })
    use("tpope/vim-repeat")
    use({
        "wesQ3/vim-windowswap",
        setup = config["wesQ3/vim-windowswap"],
    })
    use({
        "winston0410/range-highlight.nvim",
        requires = "winston0410/cmd-parser.nvim",
        config = config["winston0410/range-highlight.nvim"],
    })
end)

require("plugins.deferred")
