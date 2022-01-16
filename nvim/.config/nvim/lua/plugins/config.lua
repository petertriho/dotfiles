vim.cmd("command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>")

local function toggle_buffer(buf, open_cmd)
    return function()
        local bufname = vim.fn.bufname(buf)

        if vim.fn.buflisted(bufname) == 1 then
            vim.cmd("bd " .. bufname)
        else
            vim.cmd(open_cmd)
        end
    end
end

vim.api.nvim_add_user_command("ToggleGitStatus", toggle_buffer(".git/*index", "Git"), {})
vim.api.nvim_add_user_command("ToggleNeogitStatus", toggle_buffer("NeogitStatus", "Neogit kind=split"), {})

return {
    ["abecodes/tabout.nvim"] = function()
        require("tabout").setup({
            tabkey = "<C-l>",
            backwards_tabkey = "<C-h>",
        })
    end,
    ["AndrewRadev/splitjoin.vim"] = function()
        vim.g.splitjoin_split_mapping = ""
        vim.g.splitjoin_join_mapping = ""
    end,
    ["andymass/vim-matchup"] = function()
        require("nvim-treesitter.configs").setup({
            matchup = { enable = true },
        })
        vim.g.matchup_matchparen_offscreen = {
            method = "popup",
        }
        vim.g.matchup_matchparen_deferred = 1
        vim.api.nvim_del_keymap("", "z%")
    end,
    ["antoinemadec/FixCursorHold.nvim"] = function()
        vim.g.cursorhold_updatetime = 100
    end,
    ["arthurxavierx/vim-caser"] = function()
        vim.g.caser_prefix = "gw"

        require("which-key").register({
            name = "caser",
            [" "] = "space case",
            ["-"] = "dash-case",
            ["."] = "dot.case",
            ["_"] = "snake_case",
            c = "camelCase",
            k = "kebab-case",
            K = "Title-Kebab-Case",
            m = "MixedCase",
            p = "PascalCase",
            s = "Sentence case",
            t = "Title Case",
            u = "SNAKE_UPPERCASE",
            U = "SNAKE_UPPERCASE",
        }, {
            prefix = "gw",
            mode = "n",
        })
    end,
    ["chaoren/vim-wordmotion"] = function()
        vim.g.wordmotion_prefix = "\\"
    end,
    ["chentau/marks.nvim"] = function()
        require("marks").setup({})
    end,
    ["danymat/neogen"] = function()
        require("neogen").setup({
            enabled = true,
        })
    end,
    ["editorconfig/editorconfig-vim"] = function()
        vim.g.EditorConfig_exclude_patterns = {
            "dbui",
            "DiffViewFiles",
            "fugitive",
            "fugitiveblame",
            "lspinfo",
            "Mundo",
            "MundoDiff",
            "NeogitStatus",
            "NvimTree",
            "Outline",
            "packer",
        }
    end,
    ["ethanholz/nvim-lastplace"] = function()
        require("nvim-lastplace").setup({})
    end,
    ["folke/todo-comments.nvim"] = function()
        require("todo-comments").setup()
    end,
    ["folke/twilight.nvim"] = function()
        require("twilight").setup()
    end,
    ["folke/zenmode.nvim"] = function()
        require("zen-mode").setup()
    end,
    ["ggandor/lightspeed.nvim"] = function()
        require("lightspeed").setup({
            exit_after_idle_msecs = { unlabeled = nil, labeled = nil },
            substitute_chars = {
                [" "] = "␣",
                ["\r"] = "¬",
                ["\t"] = "»",
            },
        })
    end,
    ["JoosepAlviste/nvim-ts-context-commentstring"] = function()
        require("nvim-treesitter.configs").setup({
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
        })
    end,
    ["jvgrootveld/telescope-zoxide"] = function()
        local function browse_files(selection)
            require("telescope").extensions.file_browser.file_browser({ cwd = selection.path })
        end

        local builtin = require("telescope.builtin")

        local function find_files(selection)
            builtin.find_files({ cwd = selection.path, hidden = true })
        end

        local function search_files(selection)
            builtin.live_grep({ cwd = selection.path })
        end

        local z_utils = require("telescope._extensions.zoxide.utils")
        require("telescope._extensions.zoxide.config").setup({
            mappings = {
                default = {
                    keepinsert = true,
                    action = find_files,
                    after_action = function() end,
                },
                ["<C-b>"] = {
                    keepinsert = true,
                    action = browse_files,
                },
                ["<C-f>"] = {
                    keepinsert = true,
                    action = find_files,
                },
                ["<C-s>"] = {
                    keepinsert = true,
                    action = search_files,
                },
                ["<C-w>"] = {
                    action = function(selection)
                        vim.cmd("cd " .. selection.path)
                    end,
                    after_action = function(selection)
                        print("Directory changed to " .. selection.path)
                    end,
                },
                ["<C-x>"] = { action = z_utils.create_basic_command("split") },
                ["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
            },
        })
    end,
    ["kazhala/close-buffers.nvim"] = function()
        require("close_buffers").setup()
    end,
    ["kristijanhusak/vim-dadbod-ui"] = function()
        vim.g.db_ui_show_database_icon = 1
        vim.g.db_ui_use_nerd_fonts = 1
    end,
    ["kyazdani42/nvim-tree.lua"] = function()
        vim.g.nvim_tree_git_hl = 1
        require("nvim-tree").setup({
            update_focused_file = {
                enable = true,
            },
            filters = {
                custom = { ".git", "node_modules", ".venv" },
            },
            view = {
                signcolumn = "no",
            },
        })
        require("nvim-tree.lib").toggle_ignored()
    end,
    ["kwkarlwang/bufjump.nvim"] = function()
        require("bufjump").setup({
            forward = "<M-i>",
            backward = "<M-o>",
        })
    end,
    ["gbprod/substitute.nvim"] = function()
        require("substitute").setup({
            on_substitute = function(_)
                vim.fn["yoink#startUndoRepeatSwap"]()
            end,
        })

        local set_keymap = vim.api.nvim_set_keymap

        set_keymap("n", "<Leader>s", "<CMD>lua require('substitute').operator()<CR>", { noremap = true })
        set_keymap("n", "<Leader>ss", "<CMD>lua require('substitute').line()<CR>", { noremap = true })
        set_keymap("n", "<Leader>S", "<CMD>lua require('substitute').eol()<CR>", { noremap = true })
        set_keymap("x", "<Leader>s", "<CMD>lua require('substitute').visual()<CR>", { noremap = true })

        set_keymap("n", "\\s", "<CMD>lua require('substitute.range').operator()<CR>", { noremap = true })
        set_keymap("x", "\\s", "<CMD>lua require('substitute.range').visual()<CR>", {})
        set_keymap("n", "\\ss", "<CMD>lua require('substitute.range').word()<CR>", {})

        set_keymap(
            "n",
            "\\S",
            "<CMD>lua require('substitute.range').operator({ prefix = 'S' })<CR>",
            { noremap = true }
        )
        set_keymap("x", "\\S", "<CMD>lua require('substitute.range').visual({ prefix = 'S' })<CR>", {})
        set_keymap("n", "\\SS", "<CMD>lua require('substitute.range').word({ prefix = 'S' })<CR>", {})

        set_keymap("x", "p", "<CMD>lua require('substitute').visual()<CR>", {})
        set_keymap("x", "P", "<CMD>lua require('substitute').visual()<CR>", {})
    end,
    ["github/copilot.vim"] = function()
        vim.g.copilot_filetypes = {
            TelescopePrompt = false,
        }
        vim.g.copilot_no_tab_map = true
        vim.cmd("highlight CopilotSuggestion guifg=#565f89")
        vim.api.nvim_set_keymap(
            "i",
            "<C-c>",
            "copilot#Accept('<C-c>')",
            { script = true, silent = true, nowait = true, expr = true }
        )
    end,
    ["hrsh7th/nvim-cmp"] = function()
        --[[ local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end ]]

        local function feedkeys(key)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "m", true)
        end

        local cmp = require("cmp")

        local select_prev_snippet = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkeys("<Plug>(vsnip-jump-prev)")
                    --[[ elseif has_words_before() then
				cmp.complete() ]]
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkeys("<Plug>(vsnip-jump-prev)")
                else
                    fallback()
                end
            end,
        })

        local select_next_snippet = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if vim.fn["vsnip#available"](1) == 1 then
                    feedkeys("<Plug>(vsnip-expand-or-jump)")
                    --[[ elseif has_words_before() then
				cmp.complete() ]]
                elseif package.loaded["neogen"] ~= nil and require("neogen").jumpable() then
                    require("neogen").jump_next()
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if vim.fn["vsnip#available"](1) == 1 then
                    feedkeys("<Plug>(vsnip-expand-or-jump)")
                else
                    fallback()
                end
            end,
        })

        local select_prev_item = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkeys("<Plug>(vsnip-jump-prev)")
                    --[[ elseif has_words_before() then
				cmp.complete() ]]
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkeys("<Plug>(vsnip-jump-prev)")
                else
                    fallback()
                end
            end,
        })

        local select_next_item = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif vim.fn["vsnip#available"](1) == 1 then
                    feedkeys("<Plug>(vsnip-expand-or-jump)")
                    --[[ elseif has_words_before() then
				cmp.complete() ]]
                elseif package.loaded["neogen"] ~= nil and require("neogen").jumpable() then
                    require("neogen").jump_next()
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if vim.fn["vsnip#available"](1) == 1 then
                    feedkeys("<Plug>(vsnip-expand-or-jump)")
                else
                    fallback()
                end
            end,
        })

        cmp.setup({
            documentation = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
            formatting = {
                format = require("lspkind").cmp_format({
                    with_text = true,
                    menu = {
                        buffer = "[BUFFER]",
                        cmp_git = "[GIT]",
                        fuzzy_path = "[FZ-PATH]",
                        fuzzy_buffer = "[FZ-BUFFER]",
                        nvim_lsp = "[LSP]",
                        path = "[PATH]",
                        tmux = "[TMUX]",
                        vsnip = "[SNIPPET]",
                        ["vim-dadbod-completion"] = "[DB]",
                    },
                }),
            },
            mapping = {
                ["<C-j>"] = select_next_item,
                ["<C-k>"] = select_prev_item,
                ["<Tab>"] = select_next_item,
                ["<S-Tab>"] = select_prev_item,
                ["<C-n>"] = select_next_snippet,
                ["<C-p>"] = select_prev_snippet,
                ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "c", "i" }),
                ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "c", "i" }),
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "c", "i" }),
                ["<C-c>"] = cmp.mapping(cmp.mapping.close(), { "c", "i" }),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
            },
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "cmp_git" },
                { name = "path" },
                {
                    name = "buffer",
                    option = {
                        get_bufnrs = function()
                            -- visible buffers
                            local bufs = {}
                            for _, win in ipairs(vim.api.nvim_list_wins()) do
                                bufs[vim.api.nvim_win_get_buf(win)] = true
                            end
                            return vim.tbl_keys(bufs)
                        end,
                    },
                },
                {
                    name = "tmux",
                    option = {
                        all_panes = true,
                        trigger_characters = {},
                    },
                },
                { name = "vsnip" },
            },
        })

        cmp.setup.cmdline("/", {
            sources = {
                { name = "buffer" },
                { name = "fuzzy_buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            sources = {
                { name = "cmdline" },
                { name = "path" },
                {
                    name = "fuzzy_path",
                    options = { fd_cmd = { "fd", "--max-depth", "20", "--hidden", "--exclude", ".git" } },
                },
                { name = "buffer" },
                { name = "fuzzy_buffer" },
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
    ["ixru/nvim-markdown"] = function()
        vim.g.vim_markdown_no_default_key_mappings = 1
    end,
    ["kevinhwang91/nvim-hlslens"] = function()
        require("scrollbar.handlers.search").setup()
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
        local colors = require("colors")

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
                markdown = 0,
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
            filetype_exclude = {
                "",
                "dbui",
                "DiffViewFiles",
                "fugitive",
                "fugitiveblame",
                "lspinfo",
                "Mundo",
                "MundoDiff",
                "NeogitStatus",
                "NvimTree",
                "Outline",
                "packer",
            },
        })
    end,
    ["machakann/vim-sandwich"] = function()
        vim.cmd("runtime macros/sandwich/keymap/surround.vim")
        local set_keymap = vim.api.nvim_set_keymap

        set_keymap("x", "is", "<Plug>(textobj-sandwich-query-i)", {})
        set_keymap("x", "as", "<Plug>(textobj-sandwich-query-a)", {})
        set_keymap("o", "is", "<Plug>(textobj-sandwich-query-i)", {})
        set_keymap("o", "as", "<Plug>(textobj-sandwich-query-a)", {})

        set_keymap("x", "iss", "<Plug>(textobj-sandwich-auto-i)", {})
        set_keymap("x", "ass", "<Plug>(textobj-sandwich-auto-a)", {})
        set_keymap("o", "iss", "<Plug>(textobj-sandwich-auto-i)", {})
        set_keymap("o", "ass", "<Plug>(textobj-sandwich-auto-a)", {})

        set_keymap("x", "im", "<Plug>(textobj-sandwich-literal-query-i)", {})
        set_keymap("x", "am", "<Plug>(textobj-sandwich-literal-query-a)", {})
        set_keymap("o", "im", "<Plug>(textobj-sandwich-literal-query-i)", {})
        set_keymap("o", "am", "<Plug>(textobj-sandwich-literal-query-a)", {})
    end,
    ["mtth/scratch.vim"] = function()
        vim.g.scratch_autohide = 0
        vim.g.scratch_persistence_file = "~/.scratch"
    end,
    ["mg979/vim-visual-multi"] = function()
        vim.g.VM_leader = "\\"
        vim.g.VM_maps = { ["Find Under"] = "\\f", ["Find Subword Under"] = "\\f" }
        vim.g.VM_mouse_mappings = 1
        vim.g.VM_Mono_hl = "DiffText"
        vim.g.VM_Extend_hl = "DiffAdd"
        vim.g.VM_Cursor_hl = "Visual"
        vim.g.VM_Insert_hl = "DiffChange"

        local config
        local lens_backup

        local function override_lens(render, plist, nearest, idx, r_idx)
            local _ = r_idx
            local lnum, col = unpack(plist[idx])

            local text, chunks
            if nearest then
                text = ("[%d/%d]"):format(idx, #plist)
                chunks = { { " ", "Ignore" }, { text, "VM_Extend" } }
            else
                text = ("[%d]"):format(idx)
                chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
            end
            render.set_virt(0, lnum - 1, col - 1, chunks, nearest)
        end

        local function vm_lens_start()
            local hlslens = require("hlslens")
            if hlslens then
                config = require("hlslens.config")
                lens_backup = config.override_lens
                config.override_lens = override_lens
                hlslens.start()
            end
        end

        vim.api.nvim_add_user_command("VMLensStart", vm_lens_start, {})

        local function vm_lens_exit()
            local hlslens = require("hlslens")
            if hlslens then
                config.override_lens = lens_backup
                hlslens.start()
            end
        end

        vim.api.nvim_add_user_command("VMLensExit", vm_lens_exit, {})

        vim.cmd([[
        augroup vmlens
            autocmd!
            autocmd User visual_multi_start VMLensStart
            autocmd User visual_multi_exit VMLensExit
        augroup END
        ]])
    end,
    ["mizlan/iswap.nvim"] = function()
        require("iswap").setup({
            hl_snipe = "ErrorMsg",
        })
    end,
    ["nathom/filetype.nvim"] = function()
        require("filetype").setup({
            overrides = {
                extension = {
                    dockerfile = "dockerfile",
                    prisma = "prisma",
                },
                literal = {
                    [".env"] = "conf",
                    [".prettierrc"] = "jsonc",
                },
                complex = {
                    [".*%.env.*"] = "conf",
                },
                shebang = {
                    bash = "sh",
                },
            },
        })
    end,
    ["numToStr/Comment.nvim"] = function()
        require("Comment").setup({
            ignore = "^$",
            pre_hook = function(ctx)
                local U = require("Comment.utils")

                local location = nil
                if ctx.ctype == U.ctype.block then
                    location = require("ts_context_commentstring.utils").get_cursor_location()
                elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                    location = require("ts_context_commentstring.utils").get_visual_start_location()
                end

                return require("ts_context_commentstring.internal").calculate_commentstring({
                    key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
                    location = location,
                })
            end,
        })

        vim.api.nvim_set_keymap("n", "<Leader>/", "gcc", {})
        vim.api.nvim_set_keymap("v", "<Leader>/", "gc", {})
    end,
    ["nvim-telescope/telescope.nvim"] = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
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
                history = false,
                file_ignore_patterns = { "%.git/*" },
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
                project = {
                    hidden_files = true,
                },
            },
            pickers = {
                file_browser = {
                    hidden = true,
                },
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
        telescope.load_extension("file_browser")
    end,
    ["nvim-treesitter/nvim-treesitter"] = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "comment",
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
                "markdown",
                "python",
                "regex",
                "rust",
                "scss",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
            sync_install = true,
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            incremental_selection = {
                enable = false,
            },
            indent = {
                enable = true,
                disable = { "python" },
            },
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
                end,
                detach = function() end,
                is_supported = function()
                    return true
                end,
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
                        ["a/"] = "@comment.outer",
                        ["ac"] = "@conditional.outer",
                        ["ic"] = "@conditional.inner",
                        ["aC"] = "@class.outer",
                        ["iC"] = "@class.inner",
                        ["ae"] = "@block.outer",
                        ["ie"] = "@block.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["aL"] = "@loop.outer",
                        ["iL"] = "@loop.inner",
                        ["aP"] = "@parameter.outer",
                        ["iP"] = "@parameter.inner",
                        ["ar"] = "@call.outer",
                        ["ir"] = "@call.inner",
                        ["aS"] = "@statement.outer",
                        ["iS"] = "@statement.inner",
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
    ["nvim-treesitter/playground"] = function()
        require("nvim-treesitter.configs").setup({
            playground = {
                enable = true,
            },
        })
    end,
    ["petertriho/cmp-git"] = function()
        require("cmp_git").setup()
    end,
    ["p00f/nvim-ts-rainbow"] = function()
        local colors = require("colors")

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
    ["RishabhRD/lspactions"] = function()
        vim.cmd([[runtime plugin/astronauta.vim]])

        vim.ui.select = require("lspactions").select
        vim.ui.input = require("lspactions").input

        vim.lsp.handlers["textDocument/codeAction"] = require("lspactions").codeaction
        vim.lsp.handlers["textDocument/references"] = require("lspactions").references
        vim.lsp.handlers["textDocument/definition"] = require("lspactions").definition
        vim.lsp.handlers["textDocument/declaration"] = require("lspactions").declaration
        vim.lsp.handlers["textDocument/implementation"] = require("lspactions").implementation
    end,
    ["RishabhRD/nvim-cheat.sh"] = function()
        vim.g.cheat_default_window_layout = "vertical_split"
    end,
    ["rmagatti/goto-preview"] = function()
        require("goto-preview").setup({
            width = 120,
            height = 30,
            default_mappings = true,
            border = { "↖", "─", "╮", "│", "╯", "─", "╰", "│" },
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
                    ["<CR>"] = "textsubjects-container-outer",
                },
            },
        })
    end,
    ["sheerun/vim-polyglot"] = function()
        vim.g.polyglot_disabled = {
            "ftdetect",
            "sensible",
            "css",
            "dockerfile",
            "fish",
            "go",
            "graphql",
            "html5",
            "javascript",
            "javascriptreact",
            "json",
            "jsonc",
            "jsx",
            "lua",
            "markdown",
            "python",
            "rust",
            "scss",
            "sh",
            "toml",
            "typescript",
            "typescriptreact",
            "yaml",
        }
    end,
    ["simrat39/symbols-outline.nvim"] = function()
        vim.g.symbols_outline = {
            auto_preview = false,
            position = "left",
        }
    end,
    ["sindrets/diffview.nvim"] = function()
        require("diffview").setup()
    end,
    ["sindrets/winshift.nvim"] = function()
        require("winshift").setup({
            window_picker_ignore = {
                filetype = {
                    "dbui",
                    "DiffViewFiles",
                    "Mundo",
                    "MundoDiff",
                    "NvimTree",
                },
            },
        })
    end,
    ["SmiteshP/nvim-gps"] = function()
        require("nvim-gps").setup()
    end,
    ["stevearc/qf_helper.nvim"] = function()
        require("qf_helper").setup({
            quickfix = {
                default_bindings = false,
                min_height = 10,
            },
            loclist = {
                default_bindings = false,
                min_height = 10,
            },
        })
    end,
    ["stevearc/stickybuf.nvim"] = function()
        require("stickybuf").setup({
            filetype = {
                dbui = "filetype",
                fugitive = "filetype",
                Outline = "filetype",
            },
        })
    end,
    ["sQVe/sort.nvim"] = function()
        require("sort").setup({})
    end,
    ["svermeulen/vim-yoink"] = function()
        local set_keymap = vim.api.nvim_set_keymap

        set_keymap("n", "<M-n>", "<Plug>(YoinkPostPasteSwapBack)", {})
        set_keymap("n", "<M-p>", "<Plug>(YoinkPostPasteSwapForward)", {})

        set_keymap("n", "<C-M-n>", "<Plug>(YoinkRotateBack)", {})
        set_keymap("n", "<C-M-p>", "<Plug>(YoinkRotateForward)", {})

        set_keymap("n", "p", "<Plug>(YoinkPaste_p)", {})
        set_keymap("n", "P", "<Plug>(YoinkPaste_P)", {})
    end,
    ["ThePrimeagen/refactoring.nvim"] = function()
        require("refactoring").setup({})
        require("telescope").load_extension("refactoring")
    end,
    ["TimUntersberger/neogit"] = function()
        require("neogit").setup({
            disable_commit_confirmation = true,
            integrations = { diffview = true },
        })
    end,
    ["tpope/vim-abolish"] = function()
        require("which-key").register({
            name = "coerce",
            [" "] = "space case",
            ["-"] = "dash-case",
            ["."] = "dot.case",
            ["_"] = "snake_case",
            c = "camelCase",
            k = "kebab-case",
            m = "MixedCase",
            s = "snake_case",
            t = "Title Case",
            u = "SNAKE_UPPERCASE",
            U = "SNAKE_UPPERCASE",
        }, {
            prefix = "cr",
            mode = "n",
        })
    end,
    ["tpope/vim-fugitive"] = function()
        vim.api.nvim_set_keymap("n", "g[", "<CMD>diffget //2<CR>", { silent = true, noremap = true })
        vim.api.nvim_set_keymap("n", "g]", "<CMD>diffget //3<CR>", { silent = true, noremap = true })
    end,
    ["vimwiki/vimwiki"] = function()
        vim.g.vimwiki_list = {
            { path = os.getenv("VIMWIKI_PATH"), syntax = "markdown", ext = ".md" },
        }
        vim.g.vimwiki_conceallevel = 0
        vim.g.vimwiki_global_ext = 0
        vim.g.vimwiki_key_mappings = { table_mappings = 0, links = 0, mouse = 0 }
    end,
    ["vuki656/package-info.nvim"] = function()
        require("package-info").setup()
    end,
    ["windwp/nvim-autopairs"] = function()
        require("nvim-treesitter.configs").setup({ autopairs = { enable = true } })

        local autopairs = require("nvim-autopairs")
        autopairs.setup()

        local Rule = require("nvim-autopairs.rule")
        autopairs.add_rules({
            Rule("%(.*%)%s*%=$", "> {}", { "typescript", "typescriptreact", "javascript", "javascriptreact" })
                :use_regex(true)
                :set_end_pair_length(1),
        })
    end,
    ["windwp/nvim-ts-autotag"] = function()
        require("nvim-treesitter.configs").setup({ autotag = { enable = true } })
    end,
    ["winston0410/range-highlight.nvim"] = function()
        require("range-highlight").setup()
    end,
    ["yorickpeterse/nvim-pqf"] = function()
        require("pqf").setup()
    end,
}
