local config = require("plugins.config")

require("packer").startup({
    function(use)
        use("wbthomason/packer.nvim")

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
        use({
            "pechorin/any-jump.vim",
            setup = config["pechorin/any-jump.vim"],
            cmd = {
                "AnyJump",
                "AnyJumpVisual",
                "AnyJumpBack",
                "AnyJumpLastResults",
            },
        })
        use("b0o/schemastore.nvim")
        use({ "brymer-meneses/grammar-guard.nvim", run = ":GrammarInstall" })
        use({
            "filipdutescu/renamer.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = config["filipdutescu/renamer.nvim"],
            module = "renamer",
        })
        use("folke/lua-dev.nvim")
        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
        use({ "kosayoda/nvim-lightbulb", module = "nvim-lightbulb" })
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
            event = { "CmdlineEnter", "InsertEnter" },
        })
        use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
        use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
        use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
        use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
        use({ "hrsh7th/cmp-vsnip", after = "nvim-cmp" })
        use({
            "hrsh7th/vim-vsnip",
            setup = config["hrsh7th/vim-vsnip"],
            after = "nvim-cmp",
        })
        use({ "andersevenrud/compe-tmux", branch = "cmp", after = "nvim-cmp" })
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
            "petertriho/cmp-git",
            config = config["petertriho/cmp-git"],
            after = "nvim-cmp",
        })
        use({ "tzachar/cmp-tabnine", run = "./install.sh", after = "nvim-cmp" })
        use({
            "tzachar/cmp-fuzzy-buffer",
            requires = "tzachar/fuzzy.nvim",
            after = "nvim-cmp",
        })
        use({
            "tzachar/cmp-fuzzy-path",
            requires = "tzachar/fuzzy.nvim",
            after = { "nvim-cmp", "cmp-path" },
        })
        use({ "rafamadriz/friendly-snippets", after = "nvim-cmp" })

        -- language
        use({
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = config["folke/todo-comments.nvim"],
            opt = true,
        })
        use({
            "github/copilot.vim",
            setup = config["github/copilot.vim"],
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
        use({ "nathom/filetype.nvim", config = config["nathom/filetype.nvim"] })
        use({ "rrethy/vim-hexokinase", run = "make hexokinase", opt = true })
        use({ "sheerun/vim-polyglot", setup = config["sheerun/vim-polyglot"] })

        -- treesitter
        use({
            "nvim-treesitter/nvim-treesitter",
            config = config["nvim-treesitter/nvim-treesitter"],
            opt = true,
            run = ":TSUpdateSync",
        })
        use({
            "nvim-treesitter/playground",
            config = config["nvim-treesitter/playground"],
            cmd = "TSPlaygroundToggle",
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
            cmd = "ISwap",
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
            "ThePrimeagen/refactoring.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter",
            },
            config = config["ThePrimeagen/refactoring.nvim"],
            module = "refactoring",
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
        use({
            "arthurxavierx/vim-caser",
            setup = config["arthurxavierx/vim-caser"],
            keys = "gw",
        })
        use({ "chaoren/vim-wordmotion", setup = config["chaoren/vim-wordmotion"] })
        use({ "junegunn/vim-easy-align", keys = "<Plug>(EasyAlign)" })
        use({
            "machakann/vim-sandwich",
            config = config["machakann/vim-sandwich"],
        })
        use("mattn/emmet-vim")
        use({
            "monaqa/dial.nvim",
            keys = {
                "<Plug>(dial-increment)",
                "<Plug>(dial-decrement)",
                "<Plug>(dial-increment-additional)",
                "<Plug>(dial-decrement-additional)",
            },
        })
        use({
            "numToStr/Comment.nvim",
            config = config["numToStr/Comment.nvim"],
        })
        use({
            "tommcdo/vim-exchange",
            keys = {
                { "n", "cx" },
                { "v", "X" },
            },
        })
        use({
            "tpope/vim-abolish",
            setup = config["tpope/vim-abolish"],
            cmd = { "Subvert", "S" },
            keys = { { "n", "cr" } },
        })
        use("wellle/targets.vim")

        -- telescope
        use({
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
            },
            config = config["nvim-telescope/telescope.nvim"],
            cmd = "Telescope",
            module = "telescope",
        })
        use({
            "nvim-telescope/telescope-project.nvim",
            after = "telescope.nvim",
            module = "telescope.extensions.project",
        })
        use({
            "jvgrootveld/telescope-zoxide",
            config = config["jvgrootveld/telescope-zoxide"],
            after = "telescope.nvim",
            module = "telescope.extensions.zoxide",
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
        use({ "gabrielpoca/replacer.nvim", module = "replacer" })
        use({
            "iamcco/markdown-preview.nvim",
            run = ":call mkdp#util#install()",
            ft = { "markdown", "packer", "vimwiki" },
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
                "NvimTreeFindFileToggle",
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
        use({ "romainl/vim-devdocs", cmd = "DD" })
        use({ "simnalamburt/vim-mundo", cmd = "MundoToggle" })
        use({
            "sindrets/diffview.nvim",
            config = config["sindrets/diffview.nvim"],
            cmd = {
                "DiffviewOpen",
                "DiffviewClose",
                "DiffviewToggleFiles",
                "DiffviewFocusFiles",
                "DiffviewRefresh",
                "DiffviewFileHistory",
            },
            module = "diffview",
        })
        use({ "skywind3000/asyncrun.vim", cmd = { "Make", "AsyncRun" } })
        use({
            "TimUntersberger/neogit",
            requires = {
                "nvim-lua/plenary.nvim",
            },
            config = config["TimUntersberger/neogit"],
            cmd = "Neogit",
            module = "neogit",
        })
        use({ "tpope/vim-fugitive", cmd = { "G", "Git" } })
        use({
            "https://gitlab.com/yorickpeterse/nvim-pqf",
            config = config["yorickpeterse/nvim-pqf"],
        })
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
        use({
            "chentau/marks.nvim",
            config = config["chentau/marks.nvim"],
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
            "kevinhwang91/nvim-hlslens",
            module = "hlslens",
            keys = { "/" },
        })
        use({
            "kwkarlwang/bufjump.nvim",
            config = config["kwkarlwang/bufjump.nvim"],
            keys = {
                "<M-i>",
                "<M-o>",
            },
        })
        use("lewis6991/impatient.nvim")
        use("nvim-lua/plenary.nvim")
        use({
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
        })
        use({ "ryvnf/readline.vim", event = { "CmdlineEnter" } })
        use({
            "sindrets/winshift.nvim",
            config = config["sindrets/winshift.nvim"],
            cmd = "WinShift",
        })
        use({
            "stevearc/qf_helper.nvim",
            config = config["stevearc/qf_helper.nvim"],
            cmd = { "QNext", "QPrev", "LLToggle", "QFToggle" },
            module = "qf_helper",
        })
        use("tpope/vim-repeat")
        use("tpope/vim-unimpaired")
        use({
            "winston0410/range-highlight.nvim",
            requires = "winston0410/cmd-parser.nvim",
            config = config["winston0410/range-highlight.nvim"],
            event = { "CmdlineEnter" },
        })
    end,
    config = {
        max_jobs = 50,
    },
})

require("plugins.deferred")
