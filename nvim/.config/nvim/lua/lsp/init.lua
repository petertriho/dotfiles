-- Setup
local function on_attach(client, bufnr)
    require("lsp.format").on_attach(client, bufnr)

    local opts = { noremap = true, silent = true }

    local function buf_set_keymap(mode, lhs, rhs)
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    if client.name == "pyright" then
        buf_set_keymap("n", "<Leader>o", "<CMD>PyrightOrganizeImports<CR>")
    elseif client.name == "tsserver" then
        buf_set_keymap("n", "<Leader>o", "<CMD>TSServerOrganizeImports<CR>")
    end

    buf_set_keymap(
        "n",
        "gh",
        "<CMD>lua vim.diagnostic.open_float(0, { scope = 'line', source = 'always', border = 'rounded' })<CR>"
    )
    buf_set_keymap("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>")
    buf_set_keymap("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>")

    if client.server_capabilities.codeActionProvider then
        vim.api.nvim_create_augroup("lsp_code_action", {})
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = "lsp_code_action",
            callback = function()
                require("nvim-lightbulb").update_lightbulb()
            end,
            buffer = bufnr,
            desc = "LSP code action lightbulb",
        })
    end

    if client.server_capabilities.definitionProvider then
        buf_set_keymap("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
    end

    if client.server_capabilities.declarationProvider then
        buf_set_keymap("n", "gl", "<CMD>lua vim.lsp.buf.declaration()<CR>")
    end

    if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
    end

    if client.server_capabilities.hoverProvider then
        buf_set_keymap("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>")
    end

    if client.server_capabilities.implementationProvider then
        buf_set_keymap("n", "gm", "<CMD>lua vim.lsp.buf.implementation()<CR>")
    end

    if client.server_capabilities.renameProvider then
        buf_set_keymap("n", "<Leader>ar", "<CMD>lua vim.lsp.buf.rename()<CR>")
    end

    if client.server_capabilities.referencesProvider then
        buf_set_keymap("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>")
    end

    if client.server_capabilities.signatureHelpProvider then
        buf_set_keymap("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>")
    end

    if client.server_capabilities.typeDefinitionProvider then
        buf_set_keymap("n", "gy", "<CMD>lua vim.lsp.buf.type_definition()<CR>")
    end
end

local function make_base_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local completionItem = capabilities.textDocument.completion.completionItem
    completionItem.snippetSupport = true
    completionItem.preselectSupport = true
    completionItem.insertReplaceSupport = true
    completionItem.labelDetailsSupport = true
    completionItem.deprecatedSupport = true
    completionItem.commitCharactersSupport = true
    completionItem.tagSupport = { valueSet = { 1 } }
    completionItem.resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    }
    capabilities.textDocument.colorProvider = { dynamicRegistration = false }
    return {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = { allow_incremental_sync = true, debounce_text_changes = 150 },
    }
end

local function setup()
    vim.diagnostic.config({
        severity_sort = true,
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            vim.bo[args.buf].formatexpr = nil
        end,
    })

    local configs = require("lspconfig.configs")
    if not configs.ruff_lsp then
        configs.ruff_lsp = {
            default_config = {
                cmd = { "ruff-lsp" },
                filetypes = { "python" },
                root_dir = require("lspconfig").util.find_git_ancestor,
                settings = {
                    ruff_lsp = {
                        args = {},
                    },
                },
            },
        }
    end

    local lspconfig = require("lspconfig")
    local overrides = require("lsp.config")

    local base_config = make_base_config()

    for server, override in pairs(overrides) do
        local config = vim.tbl_extend("force", base_config, override or {})

        if server == "sumneko_lua" then
            require("neodev").setup()
        elseif server == "yamlls" then
            config = require("yaml-companion").setup({ lspconfig = config })
        end

        lspconfig[server].setup(config)
    end

    require("lsp.null-ls").setup(base_config)
end

setup()
