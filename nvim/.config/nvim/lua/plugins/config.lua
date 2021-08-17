vim.cmd([[
function! ToggleGitStatus() abort
    let buffer_name = bufname('.git/*index')
    if buflisted(buffer_name)
        execute "bd " . buffer_name
    else
        Git
    endif
endfunction

function! ToggleNeogitStatus() abort
    let buffer_name = bufname('NeogitStatus')
    if buflisted(buffer_name)
        execute "bd " . buffer_name
    else
        Neogit kind=split
    endif
endfunction
]])

-- AndrewRadev/splitjoin.vim
vim.g.splitjoin_split_mapping = ""
vim.g.splitjoin_join_mapping = ""

-- antoinemadec/FixCursorHold.nvim
vim.g.cursorhold_updatetime = 100

-- chaoren/vim-wordmotion
vim.g.wordmotion_prefix = "\\"

-- chumakd/scratch.vim
vim.g.scratch_persistence_file = "/tmp/scratch.txt"

-- editorconfig/editorconfig-vim
vim.g.EditorConfig_exclude_patterns = { "fugitive://.*" }

-- hrsh7th/vim-vsnip
vim.g.vsnip_filetypes = {
	javascriptreact = { "javascript" },
	typescript = { "javascript" },
	typescriptreact = { "javascript" },
}

-- kristijanhusak/vim-dadbod-ui
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_use_nerd_fonts = 1

-- kyazdani42/nvim-tree.lua
vim.g.nvim_tree_ignore = { ".git" }
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_hijack_cursor = 0

-- lukas-reineke/indent-blankline.nvim
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_filetype_exclude = {
	"",
	"NvimTree",
	"lspinfo",
	"Mundo",
	"MundoDiff",
	"packer",
	"fugitive",
	"fugitiveblame",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"NeogitStatus",
	"DiffViewFiles",
}
-- mg979/vim-visual-multi
vim.g.VM_leader = "\\"
vim.g.VM_maps = { ["Find Under"] = "gb", ["Find Subword Under"] = "gb" }
vim.g.VM_mouse_mappings = 1
vim.g.VM_Mono_hl = "DiffText"
vim.g.VM_Extend_hl = "DiffAdd"
vim.g.VM_Cursor_hl = "Visual"
vim.g.VM_Insert_hl = "DiffChange"

-- RishabhRD/nvim-cheat.sh
vim.g.cheat_default_window_layout = "vertical_split"

-- sheerun/vim-polyglot
vim.g.polyglot_disabled = {
	"sensible",
	"css",
	"dockerfile",
	"fish.plugin",
	"go",
	"graphql",
	"html5",
	"javascript",
	"javascriptreact",
	"json",
	"jsonc",
	"jsx",
	"python",
	"scss",
	"toml",
	"typescript",
	"typescriptreact",
	"yaml",
}

-- vimwiki/vimwiki
vim.g.vimwiki_list = {
	{ path = os.getenv("VIMWIKI_PATH"), syntax = "markdown", ext = ".md" },
}
vim.g.vimwiki_conceallevel = 0
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_key_mappings = { table_mappings = 0, lists = 0, mouse = 0 }

local config = {
	["abecodes/tabout.nvim"] = function()
		require("tabout").setup()
	end,
	["AckslD/nvim-anywise-reg.lua"] = function()
		require("anywise_reg").setup({
			operators = { "c", "d", "y" },
			textobjects = { { "i", "a" }, { "c", "f", "p", "w", "W" } },
			paste_keys = { ["\\p"] = "p", ["\\P"] = "P" },
			register_print_cmd = false,
		})
	end,
	["AckslD/nvim-neoclip.lua"] = function()
		require("neoclip").setup()
	end,
	["andymass/vim-matchup"] = function()
		require("nvim-treesitter.configs").setup({ matchup = { enable = true } })
	end,
	["JoosepAlviste/nvim-ts-context-commentstring"] = function()
		require("nvim-treesitter.configs").setup({
			context_commentstring = { enable = true, enable_autocmd = false },
		})
	end,
	["kazhala/close-buffers.nvim"] = function()
		require("close_buffers").setup()
	end,
	["kkoomen/vim-doge"] = function()
		vim.g.doge_mapping = "<Leader>ad"
	end,
	["folke/todo-comments.nvim"] = function()
		require("todo-comments").setup()
	end,
	["folke/trouble.nvim"] = function()
		require("trouble").setup()
	end,
	["folke/twilight.nvim"] = function()
		require("twilight").setup()
	end,
	["folke/zenmode.nvim"] = function()
		require("zen-mode").setup()
	end,
	["hrsh7th/nvim-compe"] = function()
		require("compe").setup({
			enabled = true,
			autocomplete = true,
			debug = false,
			min_length = 1,
			preselect = "disable",
			throttle_time = 80,
			source_timeout = 200,
			incomplete_delay = 400,
			max_abbr_width = 100,
			max_kind_width = 100,
			max_menu_width = 100,
			documentation = true,

			source = {
				buffer = true,
				calc = false,
				nvim_lsp = true,
				nvim_lua = false,
				path = true,
				tabnine = {
					priority = 0,
					max_num_results = 4,
					show_prediction_strength = true,
				},
				tmux = { all_panes = true },
				vim_dadbod_completion = true,
				vsnip = true,
			},
		})

		local t = function(str)
			return vim.api.nvim_replace_termcodes(str, true, true, true)
		end

		local check_back_space = function()
			local col = vim.fn.col(".") - 1
			if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
				return true
			else
				return false
			end
		end

		_G.complete_next = function(key)
			if vim.fn.pumvisible() == 1 then
				return t("<C-n>")
			elseif vim.fn["vsnip#available"](1) == 1 then
				return t("<Plug>(vsnip-expand-or-jump)")
			elseif check_back_space() then
				return t(key)
			else
				return vim.fn["compe#complete"]()
			end
		end

		_G.complete_prev = function(key)
			if vim.fn.pumvisible() == 1 then
				return t("<C-p>")
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				return t("<Plug>(vsnip-jump-prev)")
			else
				return t(key)
			end
		end

		local set_keymap = vim.api.nvim_set_keymap
		local options = { expr = true }
		set_keymap("i", "<C-j>", "v:lua.complete_next('<C-j>')", options)
		set_keymap("s", "<C-j>", "v:lua.complete_next('<C-j>')", options)
		set_keymap("i", "<C-k>", "v:lua.complete_prev('<C-k>')", options)
		set_keymap("s", "<C-k>", "v:lua.complete_prev('<C-k>')", options)

		set_keymap("i", "<Tab>", "v:lua.complete_next('<Tab>')", options)
		set_keymap("s", "<Tab>", "v:lua.complete_next('<Tab>')", options)
		set_keymap("i", "<S-Tab>", "v:lua.complete_prev('<S-Tab>')", options)
		set_keymap("s", "<S-Tab>", "v:lua.complete_prev('<S-Tab>')", options)

		options = { silent = true, expr = true, noremap = true }
		set_keymap("i", "<C-Space>", "compe#complete()", options)
		set_keymap("i", "<CR>", "compe#confirm('<CR>')", options)
		set_keymap("i", "<C-c>", "compe#close()", options)
		set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", options)
		set_keymap("i", "<C-b>", "compe#scroll({ 'delta': -4 })", options)
	end,
	["lewis6991/gitsigns.nvim"] = function()
		require("gitsigns").setup({
			signs = {
				add = {
					hl = "GitSignsAdd",
					text = "│",
					numhl = "GitSignsAddNr",
					linehl = "GitSignsAddLn",
				},
				change = {
					hl = "GitSignsChange",
					text = "│",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				delete = {
					hl = "GitSignsDelete",
					text = "│",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				topdelete = {
					hl = "GitSignsDelete",
					text = "│",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "│",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
			},
		})
	end,
	["norcalli/nvim-colorizer.lua"] = function()
		require("colorizer").setup()
	end,
	["nvim-telescope/telescope.nvim"] = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
				file_ignore_patterns = { ".git" },
				sorting_strategy = "ascending",
				layout_strategy = "flex",
				layout_config = {
					horizontal = { preview_width = 0.6, prompt_position = "top" },
					vertical = { mirror = true },
				},
			},
			extensions = {
				fzy_native = {
					override_generic_sorter = false,
					override_file_sorter = true,
				},
			},
		})
		require("telescope").load_extension("fzy_native")
	end,
	["nvim-treesitter/nvim-treesitter"] = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"fish",
				"go",
				"graphql",
				"html",
				"javascript",
				"json",
				"jsonc",
				"lua",
				"python",
				"regex",
				"rust",
				"scss",
				"toml",
				"tsx",
				"typescript",
				"yaml",
			},
			highlight = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			indent = { enable = false },
		})
	end,
	["nvim-treesitter/nvim-treesitter-refactor"] = function()
		require("nvim-treesitter.configs").setup({
			refactor = {
				highlight_current_scope = { enable = false },
				highlight_definitions = { enable = true },
				navigation = { enable = false },
				smart_rename = {
					enable = true,
					keymaps = { smart_rename = "<Leader>aR" },
				},
			},
		})
	end,
	["nvim-treesitter/nvim-treesitter-textobjects"] = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
			},
		})
	end,
	["onsails/lspkind-nvim"] = function()
		require("lspkind").init()
	end,
	["p00f/nvim-ts-rainbow"] = function()
		local colors = require("tokyonight.colors").setup()
		require("nvim-treesitter.configs").setup({
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = 1000,
				colors = {
					colors.red,
					colors.green,
					colors.yellow,
					colors.blue,
					colors.magenta,
					colors.cyan,
				},
			},
		})
	end,
	["pwntester/octo.nvim"] = function()
		require("octo").setup()
	end,
	["RRethy/nvim-treesitter-textsubjects"] = function()
		require("nvim-treesitter.configs").setup({
			textsubjects = {
				enable = true,
				keymaps = {
					["."] = "textsubjects-smart",
					[";"] = "textsubjects-container-outer",
				},
			},
		})
	end,
	["stevearc/qf_helper.nvim"] = function()
		require("qf_helper").setup()
	end,
	["TimUntersberger/neogit"] = function()
		require("neogit").setup({ integrations = { diffview = true } })
	end,
	["windwp/nvim-autopairs"] = function()
		require("nvim-treesitter.configs").setup({ autopairs = { enable = true } })
		require("nvim-autopairs").setup({ check_ts = true })
	end,
	["windwp/nvim-ts-autotag"] = function()
		require("nvim-treesitter.configs").setup({ autotag = { enable = true } })
	end,
	["windwp/nvim-spectre"] = function()
		require("spectre").setup()
	end,
	["winston0410/range-highlight.nvim"] = function()
		require("range-highlight").setup()
	end,
}

return config
