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
    ["chaoren/vim-wordmotion"] = function() vim.g.wordmotion_prefix = "\\" end,
    ["chumakd/scratch.vim"] = function()
        vim.g.scratch_persistence_file = "/tmp/scratch.txt"
    end,
    ["editorconfig/editorconfig-vim"] = function()
        vim.g.EditorConfig_exclude_patterns = {"fugitive://.*"}
    end,
    ["kyazdani42/nvim-tree.lua"] = function()
        require("nvim-tree.events").on_nvim_tree_ready(function()
            vim.cmd("NvimTreeRefresh")
        end)
        vim.g.nvim_tree_follow = 1
        vim.g.nvim_tree_indent_markers = 1
        vim.g.nvim_tree_git_hl = 1
        vim.g.nvim_tree_lsp_diagnostics = 0
    end,
    ["folke/todo-comments.nvim"] = function()
        require("todo-comments").setup()
    end,
    ["folke/trouble.nvim"] = function() require("trouble").setup() end,
    ["f-person/git-blame.nvim"] = function() vim.g.gitblame_enabled = 0 end,
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
            "fugitiveblame", "javascriptreact", "typescriptreact"
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
    ["onsails/lspkind-nvim"] = function() require("lspkind").init() end,
    ["pwntester/octo.nvim"] = function() require("octo").setup() end,
    ["sheerun/vim-polyglot"] = function()
        vim.g.polyglot_disabled = {
            "autoindent", "sensible", "css", "dockerfile", "fish", "go",
            "graphql", "html5", "javascript", "json", "jsonc", "jsx", "python",
            "scss", "toml", "typescript", "yaml"
        }
    end,
    ["windwp/nvim-autopairs"] = function()
        require("nvim-autopairs").setup({check_ts = true})
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
