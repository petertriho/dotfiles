return {
    "hrsh7th/nvim-cmp",
    event = { "CmdlineEnter", "InsertEnter" },
    config = function()
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
                elseif
                    packer_plugins["neogen"]
                    and packer_plugins["neogen"].loaded
                    and require("neogen").jumpable(-1)
                then
                    require("neogen").jump_prev()
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
                elseif
                    packer_plugins["neogen"]
                    and packer_plugins["neogen"].loaded
                    and require("neogen").jumpable()
                then
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
                elseif
                    packer_plugins["neogen"]
                    and packer_plugins["neogen"].loaded
                    and require("neogen").jumpable(-1)
                then
                    require("neogen").jump_prev()
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
                elseif
                    packer_plugins["neogen"]
                    and packer_plugins["neogen"].loaded
                    and require("neogen").jumpable()
                then
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
            window = {
                documentation = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                },
            },
            formatting = {
                format = require("lspkind").cmp_format({
                    mode = "symbol_text",
                    menu = {
                        buffer = "[BUFFER]",
                        cmdline = "[CMD]",
                        cmdline_history = "[CMD_HISTORY]",
                        npm = "[NPM]",
                        git = "[GIT]",
                        cmp_tabnine = "[TABNINE]",
                        copilot = "[COPILOT]",
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
                { name = "nvim_lsp_signature_help" },
                { name = "nvim_lsp" },
                { name = "npm" },
                { name = "git" },
                { name = "cmp_tabnine" },
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
                { name = "fuzzy_buffer" },
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            sources = {
                { name = "cmdline_history" },
                { name = "cmdline" },
                {
                    name = "fuzzy_path",
                    options = {
                        fd_cmd = {
                            "fd",
                            "--max-depth",
                            "20",
                            "--full-path",
                            "--hidden",
                            "--ignore-case",
                            "--exclude",
                            ".git",
                        },
                    },
                },
                { name = "path" },
                { name = "fuzzy_buffer" },
                { name = "buffer" },
            },
        })
    end,
}
