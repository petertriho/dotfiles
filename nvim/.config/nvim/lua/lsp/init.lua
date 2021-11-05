-- Setup
local lsp_status = require("lsp-status")

local on_attach = function(client, bufnr)
    lsp_status.on_attach(client)

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, silent = true }

    if client.name == "null-ls" then
        client.resolved_capabilities.code_action = false
    elseif client.name == "pyright" then
        buf_set_keymap("n", "<Leader>o", ":PyrightOrganizeImports<CR>", opts)
    elseif client.name == "tsserver" then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        buf_set_keymap("n", "<Leader>o", ":TSServerOrganizeImports<CR>", opts)
    end

    buf_set_keymap(
        "n",
        "gh",
        "<CMD>lua vim.diagnostic.open_float(0, { scope = 'line', source = 'always', border = 'rounded' })<CR>",
        opts
    )
    buf_set_keymap("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)

    if client.resolved_capabilities.code_action then
        vim.cmd([[
        augroup lsp_code_action
            autocmd! * <buffer>
            autocmd CursorHold,CursorHoldI <buffer> lua require('nvim-lightbulb').update_lightbulb()
        augroup END
        ]])
    end

    if client.resolved_capabilities.document_highlight then
        vim.cmd([[
        augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]])
    end

    if client.resolved_capabilities.find_references then
        buf_set_keymap("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", opts)
    end

    if client.resolved_capabilities.goto_definition then
        buf_set_keymap("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)

        buf_set_keymap("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
        buf_set_keymap("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
    end

    if client.resolved_capabilities.hover then
        buf_set_keymap("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
    end

    if client.resolved_capabilities.signature_help then
        buf_set_keymap("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)
    end

    if client.resolved_capabilities.type_definition then
        buf_set_keymap("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", opts)
    end

    if client.server_capabilities.colorProvider then
        require("lsp.colors").buf_attach(bufnr, { virtual_text = true })
    end
end

local function make_base_config()
    local capabilities = lsp_status.capabilities
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
        flags = { allow_incremental_sync = true, debounce_text_changes = 300 },
    }
end

local function setup()
    vim.diagnostic.config({
        severity_sort = true,
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = "rounded" }
    )
    -- vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
    vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
    vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
    vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
    vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
    vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
    vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
    vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler

    lsp_status.register_progress()

    local lspconfig = require("lspconfig")
    local overrides = require("lsp.config")

    local base_config = make_base_config()

    for server, override in pairs(overrides) do
        local config = vim.tbl_extend("force", base_config, override or {})

        if server == "sumneko_lua" then
            config = require("lua-dev").setup({
                library = { vimruntime = true, types = true, plugins = true },
                lspconfig = config,
            })
        end

        lspconfig[server].setup(config)
    end
end

setup()
