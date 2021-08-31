-- TODO:
-- coc-git: gh issues autocomplete
local config = require("plugins.config")

require("packer").init({ max_jobs = 50 })
require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"lewis6991/impatient.nvim",
		rocks = "mpack",
	})
	use("nvim-lua/plenary.nvim")

	-- ui
	use("folke/tokyonight.nvim")
	use({
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({ "Famiu/feline.nvim", requires = "kyazdani42/nvim-web-devicons" })
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
	use("nvim-lua/lsp-status.nvim")
	use({
		"RishabhRD/nvim-lsputils",
		requires = "RishabhRD/popfix",
		config = config["RishabhRD/nvim-lsputils"],
	})

	-- completion
	use({
		"hrsh7th/nvim-cmp",
		config = config["hrsh7th/nvim-cmp"],
		opt = true,
	})
	use("hrsh7th/cmp-nvim-lsp")
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
		config = config["onsails/lspkind-nvim"],
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
	use("pantharshit00/vim-prisma")
	use({
		"lukas-reineke/indent-blankline.nvim",
		setup = config["lukas-reineke/indent-blankline.nvim"],
		opt = true,
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
		opt = true,
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
		"AckslD/nvim-anywise-reg.lua",
		config = config["AckslD/nvim-anywise-reg.lua"],
	})
	use({
		"AndrewRadev/splitjoin.vim",
		setup = config["AndrewRadev/splitjoin.vim"],
		cmd = { "SplitjoinJoin", "SplitjoinSplit" },
	})
	use({ "b3nj5m1n/kommentary", config = config["b3nj5m1n/kommentary"] })
	use({ "chaoren/vim-wordmotion", setup = config["chaoren/vim-wordmotion"] })
	use({ "junegunn/vim-easy-align", keys = "<Plug>(EasyAlign)" })
	use("machakann/vim-sandwich")
	use("mattn/emmet-vim")
	use("monaqa/dial.nvim")
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
	use({ "ellisonleao/glow.nvim", run = "GlowInstall", cmd = "Glow" })
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
		setup = config["kyazdani42/nvim-tree.lua"],
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
	use({ "vimwiki/vimwiki", setup = config["vimwiki/vimwiki"], opt = true })
	use({
		"windwp/nvim-spectre",
		requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
		config = config["windwp/nvim-spectre"],
		module = "spectre",
	})

	-- motions
	use({ "phaazon/hop.nvim", cmd = { "HopChar1", "HopLine" } })
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
		"kkoomen/vim-doge",
		config = config["kkoomen/vim-doge"],
		run = ":call doge#install({ 'headless': 1 })",
	})
	use("ryvnf/readline.vim")
	use({
		"stevearc/qf_helper.nvim",
		config = config["stevearc/qf_helper.nvim"],
		cmd = { "QNext", "QPrev", "LLToggle", "QFToggle" },
	})
	use("tpope/vim-repeat")
	use({ "tpope/vim-unimpaired", opt = true })
	use({
		"winston0410/range-highlight.nvim",
		requires = "winston0410/cmd-parser.nvim",
		config = config["winston0410/range-highlight.nvim"],
	})
end)

require("plugins.deferred")
