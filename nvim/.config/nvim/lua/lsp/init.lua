local lspinstall = require("lspinstall")
local lsp_config = require("lsp.config")

-- Install
function _G.lsp_install_missing()
    local installed_servers = lspinstall.installed_servers()
    for server, _ in pairs(lsp_config) do
        if not vim.tbl_contains(installed_servers, server) then
            lspinstall.install_server(server)
        end
    end
end

function _G.lsp_update_all()
    local installed_servers = lspinstall.installed_servers()
    for _, server in pairs(installed_servers) do
        lspinstall.install_server(server)
    end
    _G.lsp_install_missing()
end

vim.cmd([[command! LspInstallMissing call v:lua.lsp_install_missing()]])
vim.cmd([[command! LspUpdateAll call v:lua.lsp_update_all()]])

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

    buf_set_keymap(
        "n",
        "gl",
        "<CMD>lua vim.diagnostic.show_line_diagnostics({ source = 'always', border = 'rounded' })<CR>",
        opts
    )
    buf_set_keymap("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)

    if client.resolved_capabilities.code_action and client.name ~= "null-ls" then
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
        buf_set_keymap("n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
    end

    if client.resolved_capabilities.signature_help then
        buf_set_keymap("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)
    end

    if client.resolved_capabilities.type_definition then
        buf_set_keymap("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", opts)
    end
end

local on_attach_ts = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    on_attach(client, bufnr)

    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>o", ":TSServerOrganizeImports<CR>", opts)
end

local on_attach_py = function(client, bufnr)
    on_attach(client, bufnr)

    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>o", ":PyrightOrganizeImports<CR>", opts)
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

    lspinstall.setup()

    local servers = lspinstall.installed_servers()
    local base_config = make_base_config()

    for _, server in pairs(servers) do
        local config = base_config

        if server == "lua" then
            config = require("lua-dev").setup({
                library = { vimruntime = true, types = true, plugins = true },
                lspconfig = config,
            })
        else
            config = vim.tbl_extend("force", config, lsp_config[server] or {})
        end

        lspconfig[server].setup(config)
    end

    local additional_servers = require("lsp.servers")
    for server, _ in pairs(additional_servers) do
        local config = base_config

        config = vim.tbl_extend("force", config, additional_servers[server] or {})

        if server == "pyright" then
            config.on_attach = on_attach_py
        elseif server == "tsserver" then
            config.on_attach = on_attach_ts
        end

        lspconfig[server].setup(config)
    end
end

setup()
