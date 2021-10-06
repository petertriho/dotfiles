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

return {
	["abecodes/tabout.nvim"] = function()
		require("tabout").setup()
	end,
	["AckslD/nvim-neoclip.lua"] = function()
		require("neoclip").setup()
	end,
	["AndrewRadev/splitjoin.vim"] = function()
		vim.g.splitjoin_split_mapping = ""
		vim.g.splitjoin_join_mapping = ""
	end,
	["andymass/vim-matchup"] = function()
		require("nvim-treesitter.configs").setup({ matchup = { enable = true } })
		vim.g.matchup_matchparen_offscreen = {
			method = "popup",
		}
		vim.g.matchup_matchparen_deferred = 1
		vim.api.nvim_del_keymap("", "z%")
	end,
	["antoinemadec/FixCursorHold.nvim"] = function()
		vim.g.cursorhold_updatetime = 100
	end,
	["b3nj5m1n/kommentary"] = function()
		require("kommentary.config").configure_language("typescriptreact", {
			single_line_comment_string = "auto",
			multi_line_comment_strings = "auto",
			hook_function = function()
				require("ts_context_commentstring.internal").update_commentstring()
			end,
		})
	end,
	["chaoren/vim-wordmotion"] = function()
		vim.g.wordmotion_prefix = "\\"
	end,
	["chumakd/scratch.vim"] = function()
		vim.g.scratch_persistence_file = "/tmp/scratch.txt"
	end,
	["editorconfig/editorconfig-vim"] = function()
		vim.g.EditorConfig_exclude_patterns = { "fugitive://.*" }
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
	["ggandor/lightspeed.nvim"] = function()
		require("lightspeed").setup({
			substitute_chars = {
				[" "] = "␣",
				["\t"] = "»",
			},
		})
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
	["kristijanhusak/vim-dadbod-ui"] = function()
		vim.g.db_ui_show_database_icon = 1
		vim.g.db_ui_use_nerd_fonts = 1
	end,
	["kyazdani42/nvim-tree.lua"] = function()
		vim.g.nvim_tree_ignore = { ".git", "node_modules", ".venv" }
		vim.g.nvim_tree_indent_markers = 0
		vim.g.nvim_tree_git_hl = 1

		require("nvim-tree").setup({
			update_focused_file = {
				enable = true,
			},
		})
	end,
	["kwkarlwang/bufjump.nvim"] = function()
		require("bufjump").setup({
			forward = "<M-o>",
			backward = "<M-i>",
		})
	end,
	["hrsh7th/nvim-cmp"] = function()
		--[[ local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end ]]

		local feedkey = function(key, mode)
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
		end

		local cmp = require("cmp")

		local select_prev_item = cmp.mapping(function(fallback)
			if vim.fn.pumvisible() == 1 then
				feedkey("<C-p>", "n")
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
				--[[ elseif has_words_before() then
				cmp.complete() ]]
			else
				fallback()
			end
		end, {
			"i",
			"s",
		})

		local select_next_item = cmp.mapping(function(fallback)
			if vim.fn.pumvisible() == 1 then
				feedkey("<C-n>", "n")
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
				--[[ elseif has_words_before() then
				cmp.complete() ]]
			else
				fallback()
			end
		end, {
			"i",
			"s",
		})

		cmp.setup({
			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
					vim_item.menu = ({
						buffer = "[BUFFER]",
						cmp_tabnine = "[TABNINE]",
						nvim_lsp = "[LSP]",
						path = "[PATH]",
						tmux = "[TMUX]",
						vsnip = "[SNIPPET]",
						["vim-dadbod-completion"] = "[DB]",
					})[entry.source.name]
					return vim_item
				end,
			},
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-c>"] = cmp.mapping.close(),
				--[[ ["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}), ]]
				["<C-k>"] = select_prev_item,
				["<C-j>"] = select_next_item,
				["<S-Tab>"] = select_prev_item,
				["<Tab>"] = select_next_item,
			},
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "cmp_tabnine" },
				{ name = "path" },
				{ name = "buffer" },
				{ name = "tmux", opts = {
					all_panes = true,
					trigger_characters = {},
				} },
				{ name = "vsnip" },
			},
		})
	end,
	["hrsh7th/vim-vsnip"] = function()
		vim.g.vsnip_filetypes = {
			javascriptreact = { "javascript" },
			typescript = { "javascript" },
			typescriptreact = { "javascript" },
		}
	end,
	["lewis6991/gitsigns.nvim"] = function()
		require("gitsigns").setup({
			signs = {
				add = {
					text = "│",
				},
				change = {
					text = "│",
				},
				delete = {
					text = "│",
				},
				topdelete = {
					text = "│",
				},
				changedelete = {
					text = "│",
				},
			},
		})
	end,
	["luochen1990/rainbow"] = function()
		local colors = require("tokyonight.colors").setup()

		vim.g.rainbow_active = 1

		vim.g.rainbow_conf = {
			guifgs = {
				colors.red,
				colors.green,
				colors.yellow,
				colors.blue,
				colors.magenta,
				colors.cyan,
			},
			separately = {
				css = 0,
				dockerfile = 0,
				fish = 0,
				go = 0,
				graphql = 0,
				html5 = 0,
				javascript = 0,
				javascriptreact = 0,
				json = 0,
				jsonc = 0,
				jsx = 0,
				lua = 0,
				python = 0,
				rust = 0,
				scss = 0,
				sh = 0,
				toml = 0,
				typescript = 0,
				typescriptreact = 0,
				yaml = 0,
				dbui = 0,
				NvimTree = 0,
				lspinfo = 0,
				Mundo = 0,
				MundoDiff = 0,
				packer = 0,
				fugitive = 0,
				fugitiveblame = 0,
				NeogitStatus = 0,
				DiffViewFiles = 0,
			},
		}
	end,
	["lukas-reineke/indent-blankline.nvim"] = function()
		require("indent_blankline").setup({
			use_treesitter = true,
			show_first_indent_level = false,
			char = "│",
			show_current_context = true,
			show_end_of_line = true,
			space_char_blankline = " ",
			filetype_exclude = {
				"",
				"dbui",
				"NvimTree",
				"lspinfo",
				"Mundo",
				"MundoDiff",
				"packer",
				"fugitive",
				"fugitiveblame",
				"NeogitStatus",
				"DiffViewFiles",
			},
		})
	end,
	["machakann/vim-sandwich"] = function()
		vim.cmd("runtime macros/sandwich/keymap/surround.vim")
		local set_keymap = vim.api.nvim_set_keymap

		set_keymap("x", "iS", "<Plug>(textobj-sandwich-query-i)", {})
		set_keymap("x", "aS", "<Plug>(textobj-sandwich-query-a)", {})
		set_keymap("o", "iS", "<Plug>(textobj-sandwich-query-i)", {})
		set_keymap("o", "aS", "<Plug>(textobj-sandwich-query-a)", {})

		set_keymap("x", "iSS", "<Plug>(textobj-sandwich-auto-i)", {})
		set_keymap("x", "aSS", "<Plug>(textobj-sandwich-auto-a)", {})
		set_keymap("o", "iSS", "<Plug>(textobj-sandwich-auto-i)", {})
		set_keymap("o", "aSS", "<Plug>(textobj-sandwich-auto-a)", {})

		set_keymap("x", "im", "<Plug>(textobj-sandwich-literal-query-i)", {})
		set_keymap("x", "am", "<Plug>(textobj-sandwich-literal-query-a)", {})
		set_keymap("o", "im", "<Plug>(textobj-sandwich-literal-query-i)", {})
		set_keymap("o", "am", "<Plug>(textobj-sandwich-literal-query-a)", {})
	end,
	["mg979/vim-visual-multi"] = function()
		vim.g.VM_leader = "\\"
		vim.g.VM_maps = { ["Find Under"] = "gb", ["Find Subword Under"] = "gb" }
		vim.g.VM_mouse_mappings = 1
		vim.g.VM_Mono_hl = "DiffText"
		vim.g.VM_Extend_hl = "DiffAdd"
		vim.g.VM_Cursor_hl = "Visual"
		vim.g.VM_Insert_hl = "DiffChange"
	end,
	["norcalli/nvim-colorizer.lua"] = function()
		require("colorizer").setup()
	end,
	["nvim-telescope/telescope.nvim"] = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
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
				fzf = {
					fuzzy = true,
					override_generic_sorter = false,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					attach_mappings = function()
						require("telescope.actions.set").select:enhance({
							post = function()
								vim.cmd(":normal! zx")
							end,
						})
						return true
					end,
				},
			},
		})
		telescope.load_extension("fzf")
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
			indent = { enable = true },
			fold = { enable = true },
		})
		require("nvim-treesitter").define_modules({
			fold = {
				attach = function()
					vim.cmd([[
					setlocal foldmethod=expr
					setlocal foldexpr=nvim_treesitter#foldexpr()
					setlocal foldminlines=1
					setlocal foldnestmax=3
					setlocal foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)).'\ ('.(v:foldend-v:foldstart+1).'\ lines)'
					setlocal foldlevel=3
                    ]])
					vim.opt.list = true
				end,
				detach = function() end,
				is_supported = function()
					return true
				end,
			},
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
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
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
	["ray-x/lsp_signature.nvim"] = function()
		require("lsp_signature").setup({
			floating_window = false,
			hint_prefix = "",
		})
	end,
	["RishabhRD/nvim-cheat.sh"] = function()
		vim.g.cheat_default_window_layout = "vertical_split"
	end,
	["rmagatti/goto-preview"] = function()
		require("goto-preview").setup({
			width = 120,
			height = 30,
			default_mappings = true,
		})
	end,
	["romgrk/nvim-treesitter-context"] = function()
		require("treesitter-context").setup({
			enable = true,
			throttle = true,
		})
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
	["sheerun/vim-polyglot"] = function()
		vim.g.polyglot_disabled = {
			"autoindent",
			"sensible",
			"css.plugin",
			"dockerfile.plugin",
			"fish.plugin",
			"go.plugin",
			"graphql.plugin",
			"html5.plugin",
			"javascript.plugin",
			"javascriptreact.plugin",
			"json.plugin",
			"jsonc.plugin",
			"jsx.plugin",
			"lua.plugin",
			"python.plugin",
			"rust.plugin",
			"scss.plugin",
			"sh.plugin",
			"toml.plugin",
			"typescript.plugin",
			"typescriptreact.plugin",
			"yaml.plugin",
		}
	end,
	["sindrets/winshift.nvim"] = function()
		require("winshift").setup()
	end,
	["SmiteshP/nvim-gps"] = function()
		require("nvim-gps").setup()
	end,
	["stevearc/qf_helper.nvim"] = function()
		require("qf_helper").setup({
			quickfix = {
				min_height = 10,
			},
			loclist = {
				min_height = 10,
			},
		})
	end,
	["TimUntersberger/neogit"] = function()
		require("neogit").setup({ integrations = { diffview = true } })
	end,
	["tzachar/cmp-tabnine"] = function()
		require("cmp_tabnine.config").setup({
			max_lines = 1000,
			max_num_results = 10,
			sort = true,
		})
	end,
	["vimwiki/vimwiki"] = function()
		vim.g.vimwiki_list = {
			{ path = os.getenv("VIMWIKI_PATH"), syntax = "markdown", ext = ".md" },
		}
		vim.g.vimwiki_conceallevel = 0
		vim.g.vimwiki_global_ext = 0
		vim.g.vimwiki_key_mappings = { table_mappings = 0, lists = 0, mouse = 0 }
	end,
	["vuki656/package-info.nvim"] = function()
		require("package-info").setup()
	end,
	["wesQ3/vim-windowswap"] = function()
		vim.g.windowswap_map_keys = 0
	end,
	["windwp/nvim-autopairs"] = function()
		require("nvim-treesitter.configs").setup({ autopairs = { enable = true } })
		require("nvim-autopairs").setup({ check_ts = true })
		require("nvim-autopairs.completion.cmp").setup({
			map_cr = true,
			map_complete = false,
			auto_select = false,
			insert = false,
		})
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
