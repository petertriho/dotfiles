vim.cmd([[
    function! ToggleGstatus(vertical, ...)
        let fugitive_buffer_name = bufname('.git/*index')
        if buflisted(fugitive_buffer_name)
            execute "bd " . fugitive_buffer_name
        else
            if a:vertical == 0
                Git
            else
                vertical Git
            endif
        endif
    endfunction
]])

local config = {
    ["AndrewRadev/splitjoin.vim"] = function()
        vim.g.splitjoin_split_mapping = ""
        vim.g.splitjoin_join_mapping = ""
    end,
    ["antoinemadec/FixCursorHold.nvim"] = function()
        vim.g.cursorhold_updatetime = 100
    end,
    ["andymass/vim-matchup"] = function()
        require("nvim-treesitter.configs").setup({matchup = {enable = true}})
    end,
    ["chaoren/vim-wordmotion"] = function() vim.g.wordmotion_prefix = "\\" end,
    ["chumakd/scratch.vim"] = function()
        vim.g.scratch_persistence_file = "/tmp/scratch.txt"
    end,
    ["editorconfig/editorconfig-vim"] = function()
        vim.g.EditorConfig_exclude_patterns = {"fugitive://.*"}
    end,
    ["JoosepAlviste/nvim-ts-context-commentstring"] = function()
        require("nvim-treesitter.configs").setup({
            context_commentstring = {enable = true}
        })
    end,
    ["kkoomen/vim-doge"] = function() vim.g.doge_mapping = "<Leader>ad" end,
    ["kyazdani42/nvim-tree.lua"] = function()
        vim.g.nvim_tree_follow = 1
        vim.g.nvim_tree_indent_markers = 1
        vim.g.nvim_tree_git_hl = 1
    end,
    ["folke/todo-comments.nvim"] = function()
        require("todo-comments").setup()
    end,
    ["folke/trouble.nvim"] = function() require("trouble").setup() end,
    ["f-person/git-blame.nvim"] = function() vim.g.gitblame_enabled = 0 end,
    ["glepnir/lspsaga.nvim"] = function()
        require("lspsaga").init_lsp_saga({rename_prompt_prefix = ""})

        local set_keymap = vim.api.nvim_set_keymap
        local options = {noremap = true, silent = true}
        set_keymap("n", "<M-t>", ":Lspsaga open_floaterm<CR>", options)
        set_keymap("t", "<M-t>", "<C-\\><C-n>:Lspsaga close_floaterm<CR>",
                   options)
    end,
    ["hrsh7th/vim-vsnip"] = function()
        vim.g.vsnip_filetypes = {
            javascriptreact = {"javascript"},
            typescript = {"javascript"},
            typescriptreact = {"javascript"}
        }
    end,
    ["lewis6991/gitsigns.nvim"] = function()
        require("gitsigns").setup {
            signs = {
                add = {
                    hl = "GitSignsAdd",
                    text = "│",
                    numhl = "GitSignsAddNr",
                    linehl = "GitSignsAddLn"
                },
                change = {
                    hl = "GitSignsChange",
                    text = "│",
                    numhl = "GitSignsChangeNr",
                    linehl = "GitSignsChangeLn"
                },
                delete = {
                    hl = "GitSignsDelete",
                    text = "│",
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn"
                },
                topdelete = {
                    hl = "GitSignsDelete",
                    text = "│",
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn"
                },
                changedelete = {
                    hl = "GitSignsChange",
                    text = "│",
                    numhl = "GitSignsChangeNr",
                    linehl = "GitSignsChangeLn"
                }
            }
        }
    end,
    ["lukas-reineke/indent-blankline.nvim"] = function()
        vim.g.indent_blankline_use_treesitter = true
        vim.g.indent_blankline_show_first_indent_level = false
        vim.g.indent_blankline_char = "│"
        vim.g.indent_blankline_filetype_exclude = {
            "NvimTree", "lspinfo", "Mundo", "MundoDiff", "packer", "fugitive",
            "fugitiveblame", "javascriptreact", "typescriptreact",
            "NeogitStatus", "DiffViewFiles"
        }
    end,
    ["mg979/vim-visual-multi"] = function()
        vim.g.VM_leader = "\\"
        vim.g.VM_theme = "spacegray"
    end,
    ["norcalli/nvim-colorizer.lua"] = function() require("colorizer").setup() end,
    ["nvim-telescope/telescope.nvim"] = function()
        local actions = require("telescope.actions")
        require("telescope").setup {
            defaults = {
                vimgrep_arguments = {
                    "rg", "--color=never", "--no-heading", "--with-filename",
                    "--line-number", "--column", "--smart-case", "--hidden"
                },
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous
                    },
                    n = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous
                    }
                },
                file_ignore_patterns = {".git"},
                prompt_position = "top",
                sorting_strategy = "ascending",
                layout_defaults = {horizontal = {preview_width = 0.6}}
            },
            extensions = {
                fzy_native = {
                    override_generic_sorter = true,
                    override_file_sorter = true
                }
            }
        }
        require("telescope").load_extension("fzy_native")
    end,
    ["nvim-treesitter/nvim-treesitter"] = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash", "css", "dockerfile", "fish", "go", "graphql", "html",
                "javascript", "json", "jsonc", "lua", "python", "regex", "scss",
                "toml", "tsx", "typescript", "yaml"
            },
            highlight = {enable = true},
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm"
                }
            },
            indentation = {enable = true}
        }
    end,
    ["nvim-treesitter/nvim-treesitter-textobjects"] = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner"
                    }
                }
            }
        })
    end,
    ["onsails/lspkind-nvim"] = function() require("lspkind").init() end,
    ["p00f/nvim-ts-rainbow"] = function()
        local colors = require("tokyonight.colors").setup()
        require("nvim-treesitter.configs").setup({
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = 1000,
                colors = {
                    colors.red, colors.green, colors.yellow, colors.blue,
                    colors.magenta, colors.cyan
                }
            }
        })
    end,
    ["pwntester/octo.nvim"] = function() require("octo").setup() end,
    ["TimUntersberger/neogit"] = function()
        require("neogit").setup({integrations = {diffview = true}})
    end,
    ["windwp/nvim-autopairs"] = function()
        require("nvim-treesitter.configs").setup({autopairs = {enable = true}})
        require("nvim-autopairs").setup({check_ts = true})
    end,
    ["windwp/nvim-ts-autotag"] = function()
        require("nvim-treesitter.configs").setup({autotag = {enable = true}})
    end,
    ["windwp/nvim-spectre"] = function() require("spectre").setup() end,
    ["vimwiki/vimwiki"] = function()
        vim.g.vimwiki_list = {
            {path = os.getenv("VIMWIKI_PATH"), syntax = "markdown", ext = ".md"}
        }
        vim.g.vimwiki_global_ext = 0
    end
}

return config
