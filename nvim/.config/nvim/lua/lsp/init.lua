-- Setup
local function on_attach(client, bufnr)
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
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        buf_set_keymap("n", "<Leader>o", "<CMD>TSServerOrganizeImports<CR>")
    end

    buf_set_keymap(
        "n",
        "gh",
        "<CMD>lua vim.diagnostic.open_float(0, { scope = 'line', source = 'always', border = 'rounded' })<CR>"
    )
    buf_set_keymap("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>")
    buf_set_keymap("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>")

    if client.resolved_capabilities.code_action then
        vim.cmd([[
        augroup lsp_code_action
            autocmd! * <buffer>
            autocmd CursorHold,CursorHoldI <buffer> lua require('nvim-lightbulb').update_lightbulb()
        augroup END
        ]])
    end

    if client.resolved_capabilities.declaration then
        buf_set_keymap("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>")
    end

    if client.resolved_capabilities.find_references then
        buf_set_keymap("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>")
    end

    if client.resolved_capabilities.goto_definition then
        buf_set_keymap("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
    end

    if client.resolved_capabilities.hover then
        buf_set_keymap("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>")
    end

    if client.resolved_capabilities.implementation then
        buf_set_keymap("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>")
    end

    if client.resolved_capabilities.rename then
        buf_set_keymap("n", "<Leader>ar", "<CMD>lua vim.lsp.buf.rename()<CR>")
    end

    if client.resolved_capabilities.signature_help then
        buf_set_keymap("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>")
    end

    if client.resolved_capabilities.type_definition then
        buf_set_keymap("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>")
    end

    if client.server_capabilities.colorProvider then
        require("lsp.colors").buf_attach(bufnr, { virtual_text = true })
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
        flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
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

    require("lsp.null-ls").setup(base_config)
end

setup()
