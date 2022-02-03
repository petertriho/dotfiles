require("packer").startup({
    function(use)
        use("wbthomason/packer.nvim")

        local plugins = {
            require("plugins.config.tokyonight"),
            -- ui
            require("plugins.config.gitsigns"),
            require("plugins.config.nvim-bufferline"),
            require("plugins.config.nvim-scrollbar"),
            { "feline-nvim/feline.nvim", requires = "kyazdani42/nvim-web-devicons" },
            -- lsp
            "b0o/schemastore.nvim",
            "folke/lua-dev.nvim",
            "neovim/nvim-lspconfig",
            -- require("plugins.config.fidget"),
            require("plugins.config.goto-preview"),
            require("plugins.config.lsp_signature"),
            require("plugins.config.lspactions"),
            require("plugins.config.symbols-outline"),
            { "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" },
            { "kosayoda/nvim-lightbulb", module = "nvim-lightbulb" },
            { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
            -- completion
            require("plugins.config.cmp-git"),
            require("plugins.config.nvim-cmp"),
            require("plugins.config.vim-vsnip"),
            { "andersevenrud/cmp-tmux", after = "nvim-cmp" },
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
            { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
            { "hrsh7th/cmp-path", after = "nvim-cmp" },
            { "hrsh7th/cmp-vsnip", after = "nvim-cmp" },
            { "kristijanhusak/vim-dadbod-completion", requires = "tpope/vim-dadbod", after = "nvim-cmp" },
            { "onsails/lspkind-nvim", module = "lspkind" },
            { "rafamadriz/friendly-snippets", after = "nvim-cmp" },
            { "tzachar/cmp-fuzzy-buffer", requires = "tzachar/fuzzy.nvim", after = "nvim-cmp" },
            { "tzachar/cmp-fuzzy-path", requires = "tzachar/fuzzy.nvim", after = "nvim-cmp" },
            { "tzachar/cmp-tabnine", run = "./install.sh", after = "nvim-cmp" },
            -- language
            "Vimjas/vim-python-pep8-indent",
            require("plugins.config.copilot"),
            require("plugins.config.filetype"),
            require("plugins.config.indent-blankline"),
            require("plugins.config.nvim-markdown"),
            require("plugins.config.rainbow"),
            require("plugins.config.todo-comments"),
            require("plugins.config.vim-polyglot"),
            require("plugins.config.vim-ultest"),
            { "pantharshit00/vim-prisma", ft = "prisma" },
            { "rrethy/vim-hexokinase", run = "make hexokinase", opt = true },
            -- treesitter
            require("plugins.config.iswap"),
            require("plugins.config.neogen"),
            require("plugins.config.nvim-autopairs"),
            require("plugins.config.nvim-gps"),
            require("plugins.config.nvim-treesitter"),
            require("plugins.config.nvim-treesitter-context"),
            require("plugins.config.nvim-treesitter-textobjects"),
            require("plugins.config.nvim-treesitter-textsubjects"),
            require("plugins.config.nvim-ts-autotag"),
            require("plugins.config.nvim-ts-context-commentstring"),
            require("plugins.config.nvim-ts-rainbow"),
            require("plugins.config.playground"),
            require("plugins.config.tabout"),
            require("plugins.config.vim-matchup"),
            -- text helpers
            "mattn/emmet-vim",
            "wellle/targets.vim",
            require("plugins.config.Comment"),
            require("plugins.config.sort"),
            require("plugins.config.splitjoin"),
            require("plugins.config.substitute"),
            require("plugins.config.vim-abolish"),
            require("plugins.config.vim-caser"),
            require("plugins.config.vim-sandwich"),
            require("plugins.config.vim-wordmotion"),
            { "junegunn/vim-easy-align", keys = "<Plug>(EasyAlign)" },
            {
                "monaqa/dial.nvim",
                keys = {
                    "<Plug>(dial-increment)",
                    "<Plug>(dial-decrement)",
                    "<Plug>(dial-increment-additional)",
                    "<Plug>(dial-decrement-additional)",
                },
            },
            { "tommcdo/vim-exchange", keys = { { "n", "cx" }, { "v", "X" } } },
            -- telescope
            require("plugins.config.octo"),
            require("plugins.config.refactoring"),
            require("plugins.config.telescope"),
            require("plugins.config.telescope-zoxide"),
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            {
                "nvim-telescope/telescope-project.nvim",
                after = "telescope.nvim",
                module = "telescope.extensions.project",
            },
            -- tools
            "folke/which-key.nvim",
            require("plugins.config.diffview"),
            require("plugins.config.neogit"),
            require("plugins.config.nvim-cheat"),
            require("plugins.config.nvim-pqf"),
            require("plugins.config.nvim-tree"),
            require("plugins.config.package-info"),
            require("plugins.config.twilight"),
            require("plugins.config.vim-dadbod-ui"),
            require("plugins.config.vim-fugitive"),
            require("plugins.config.vim-visual-multi"),
            require("plugins.config.vimwiki"),
            require("plugins.config.zen-mode"),
            { "gabrielpoca/replacer.nvim", module = "replacer" },
            {
                "iamcco/markdown-preview.nvim",
                run = ":call mkdp#util#install()",
                ft = { "markdown", "packer", "vimwiki" },
            },
            { "simnalamburt/vim-mundo", cmd = "MundoToggle" },
            { "skywind3000/asyncrun.vim", cmd = { "Make", "AsyncRun" } },
            -- motions
            require("plugins.config.lightspeed"),
            { "unblevable/quick-scope", opt = true },
            -- misc
            "lewis6991/impatient.nvim",
            "nvim-lua/plenary.nvim",
            "tpope/vim-repeat",
            "tpope/vim-unimpaired",
            require("plugins.config.bufjump"),
            require("plugins.config.close-buffers"),
            require("plugins.config.editorconfig-vim"),
            require("plugins.config.FixCursorHold"),
            require("plugins.config.marks"),
            require("plugins.config.nvim-hlslens"),
            require("plugins.config.nvim-lastplace"),
            require("plugins.config.qf_helper"),
            require("plugins.config.range-highlight"),
            require("plugins.config.stickybuf"),
            require("plugins.config.vim-yoink"),
            require("plugins.config.winshift"),
            { "dstein64/vim-startuptime", cmd = "StartupTime" },
            { "famiu/bufdelete.nvim", cmd = { "Bwipeout", "Bdelete" } },
            { "ryvnf/readline.vim", event = "CmdlineEnter" },
        }

        for _, plugin in ipairs(plugins) do
            use(plugin)
        end
    end,
    config = {
        max_jobs = 50,
    },
})

require("plugins.config.feline").config()

local function load_deferred_plugins()
    require("packer").loader(
        "nvim-treesitter",
        "gitsigns.nvim",
        "indent-blankline.nvim",
        "todo-comments.nvim",
        "vim-hexokinase",
        "quick-scope",
        "rainbow"
    )
end

vim.api.nvim_add_user_command("LoadDeferredPlugins", load_deferred_plugins, {})

vim.cmd([[
    augroup deferred_plugins
        autocmd User LoadDeferredPlugins LoadDeferredPlugins
    augroup END
]])

vim.defer_fn(function()
    vim.cmd([[doautocmd User LoadDeferredPlugins]])
end, 80)

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
