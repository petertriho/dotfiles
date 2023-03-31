require("packer").startup({
    function(use)
        use("wbthomason/packer.nvim")

        local plugins = {
            require("plugins.config.tokyonight"),
            -- ui
            require("plugins.config.bufferline"),
            require("plugins.config.gitsigns"),
            require("plugins.config.nvim-scrollbar"),
            { "feline-nvim/feline.nvim", requires = "nvim-tree/nvim-web-devicons" },
            -- lsp
            "b0o/schemastore.nvim",
            "folke/neodev.nvim",
            "neovim/nvim-lspconfig",
            require("plugins.config.barbecue"),
            require("plugins.config.fidget"),
            require("plugins.config.glance"),
            require("plugins.config.lspactions"),
            require("plugins.config.nvim-navic"),
            require("plugins.config.symbols-outline"),
            require("plugins.config.vim-illuminate"),
            { "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" },
            { "kosayoda/nvim-lightbulb", module = "nvim-lightbulb" },
            { "someone-stole-my-name/yaml-companion.nvim" },
            { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
            -- completion
            require("plugins.config.cmp-git"),
            require("plugins.config.cmp-npm"),
            require("plugins.config.copilot"),
            require("plugins.config.copilot-cmp"),
            require("plugins.config.nvim-cmp"),
            require("plugins.config.vim-vsnip"),
            { "andersevenrud/cmp-tmux", after = "nvim-cmp" },
            { "dmitmel/cmp-cmdline-history", after = "nvim-cmp" },
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
            { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
            { "hrsh7th/cmp-path", after = "nvim-cmp" },
            { "hrsh7th/cmp-vsnip", after = "nvim-cmp" },
            { "kristijanhusak/vim-dadbod-completion", requires = "tpope/vim-dadbod", after = "nvim-cmp" },
            { "onsails/lspkind.nvim", module = "lspkind" },
            { "rafamadriz/friendly-snippets", after = "nvim-cmp" },
            { "tzachar/cmp-fuzzy-buffer", requires = "tzachar/fuzzy.nvim", after = "nvim-cmp" },
            { "tzachar/cmp-fuzzy-path", requires = "tzachar/fuzzy.nvim", after = "nvim-cmp" },
            { "tzachar/cmp-tabnine", run = "./install.sh", after = "nvim-cmp" },
            -- language
            -- "Vimjas/vim-python-pep8-indent",
            require("plugins.config.any-jump"),
            require("plugins.config.indent-blankline"),
            require("plugins.config.nvim-colorizer"),
            require("plugins.config.rainbow"),
            require("plugins.config.todo-comments"),
            require("plugins.config.vim-polyglot"),
            -- treesitter
            require("plugins.config.iswap"),
            require("plugins.config.hlargs"),
            require("plugins.config.neogen"),
            require("plugins.config.nvim-regexplainer"),
            require("plugins.config.nvim-treesitter"),
            -- require("plugins.config.nvim-treesitter-context"),
            require("plugins.config.nvim-treesitter-endwise"),
            require("plugins.config.nvim-treesitter-textobjects"),
            require("plugins.config.nvim-treesitter-textsubjects"),
            require("plugins.config.nvim-trevJ"),
            require("plugins.config.nvim-ts-autotag"),
            require("plugins.config.nvim-ts-context-commentstring"),
            require("plugins.config.nvim-treehopper"),
            require("plugins.config.nvim-ts-rainbow2"),
            require("plugins.config.nvim-yati"),
            require("plugins.config.playground"),
            require("plugins.config.tabout"),
            require("plugins.config.vim-matchup"),
            -- text helpers
            "mattn/emmet-vim",
            "wellle/targets.vim",
            require("plugins.config.Comment"),
            require("plugins.config.dial"),
            require("plugins.config.nvim-autopairs"),
            require("plugins.config.nvim-surround"),
            require("plugins.config.sort"),
            require("plugins.config.splitjoin"),
            require("plugins.config.substitute"),
            require("plugins.config.vim-abolish"),
            require("plugins.config.vim-caser"),
            require("plugins.config.vim-wordmotion"),
            { "junegunn/vim-easy-align", keys = "<Plug>(EasyAlign)" },
            -- telescope
            require("plugins.config.octo"),
            require("plugins.config.refactoring"),
            require("plugins.config.telescope"),
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            -- tools
            require("plugins.config.color-picker"),
            -- require("plugins.config.dirbuf"),
            require("plugins.config.diffview"),
            require("plugins.config.git-conflict"),
            require("plugins.config.github-notifications"),
            require("plugins.config.gitlinker"),
            require("plugins.config.oil"),
            require("plugins.config.neogit"),
            require("plugins.config.nvim-cheat"),
            require("plugins.config.nvim-neotest"),
            require("plugins.config.nvim-pqf"),
            require("plugins.config.nvim-test"),
            require("plugins.config.nvim-tree"),
            require("plugins.config.package-info"),
            require("plugins.config.todotxt"),
            require("plugins.config.twilight"),
            require("plugins.config.venn"),
            require("plugins.config.vim-dadbod-ui"),
            require("plugins.config.vim-flog"),
            require("plugins.config.vim-fugitive"),
            require("plugins.config.vim-mergetool"),
            require("plugins.config.vim-mundo"),
            require("plugins.config.vim-visual-multi"),
            require("plugins.config.vimwiki"),
            require("plugins.config.which-key"),
            require("plugins.config.zen-mode"),
            { "gabrielpoca/replacer.nvim", module = "replacer" },
            {
                "iamcco/markdown-preview.nvim",
                run = ":call mkdp#util#install()",
                ft = { "markdown", "packer", "vimwiki" },
            },
            { "skywind3000/asyncrun.vim", cmd = { "Make", "AsyncRun" } },
            -- motions
            require("plugins.config.eyeliner"),
            require("plugins.config.flit"),
            require("plugins.config.leap-spooky"),
            require("plugins.config.leap"),
            -- misc
            "lewis6991/impatient.nvim",
            "nvim-lua/plenary.nvim",
            "tpope/vim-repeat",
            require("plugins.config.bufjump"),
            require("plugins.config.close-buffers"),
            require("plugins.config.deferred-clipboard"),
            require("plugins.config.FixCursorHold"),
            require("plugins.config.guess-indent"),
            -- require("plugins.config.indent-o-matic"),
            require("plugins.config.marks"),
            require("plugins.config.nvim-hlslens"),
            require("plugins.config.nvim-lastplace"),
            require("plugins.config.qf_helper"),
            require("plugins.config.range-highlight"),
            require("plugins.config.readline"),
            require("plugins.config.scope"),
            require("plugins.config.stickybuf"),
            require("plugins.config.trim"),
            require("plugins.config.vim-unimpaired"),
            require("plugins.config.yanky"),
            require("plugins.config.winshift"),
            { "dstein64/vim-startuptime", cmd = "StartupTime" },
            { "famiu/bufdelete.nvim", cmd = { "Bwipeout", "Bdelete" } },
        }

        for _, plugin in ipairs(plugins) do
            use(plugin)
        end
    end,
    config = {
        max_jobs = 50,
        git = {
            subcommands = {
                update = "pull --progress",
            },
        },
        autoremove = true,
    },
})

require("plugins.config.feline").config()

local function load_deferred_plugins()
    require("packer").loader(
        "nvim-treesitter",
        "gitsigns.nvim",
        "indent-blankline.nvim",
        "eyeliner.nvim",
        "vim-illuminate",
        "rainbow",
        "nvim-colorizer.lua",
        "todo-comments.nvim"
    )
end

vim.api.nvim_create_augroup("deferred_plugins", {})
vim.api.nvim_create_autocmd("User", {
    group = "deferred_plugins",
    pattern = "DeferredPlugins",
    callback = load_deferred_plugins,
    desc = "Load deferred plugins",
})

vim.defer_fn(function()
    vim.api.nvim_exec_autocmds("User", { pattern = "DeferredPlugins" })
end, 80)

vim.cmd("command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>")

local function toggle_buffer(buf, open_cmd)
    return function()
        local bufname = vim.fn.bufname(buf)

        if vim.fn.bufexists(bufname) == 1 then
            vim.cmd("bw " .. bufname)
        else
            vim.cmd(open_cmd)
        end
    end
end

vim.api.nvim_create_user_command("ToggleGitStatus", toggle_buffer("fugitive:///*.git*//$", "Git"), {})
vim.api.nvim_create_user_command("ToggleNeogitStatus", toggle_buffer("NeogitStatus", "Neogit kind=split"), {})
