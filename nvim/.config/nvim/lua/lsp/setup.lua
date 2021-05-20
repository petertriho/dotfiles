local M = {}

-- Install
function _G.lsp_install_missing()
    local configs = require("lsp/configs")
    local installed_servers = require("lspinstall").installed_servers()
    for server, _ in pairs(configs) do
        if not vim.tbl_contains(installed_servers, server) then
            require("lspinstall").install_server(server)
        end
    end
end

function _G.lsp_update_all()
    local installed_servers = require("lspinstall").installed_servers()
    for _, server in pairs(installed_servers) do
        require("lspinstall").install_server(server)
    end
    _G.lsp_install_missing()
end

vim.cmd [[command! LspInstallMissing call v:lua.lsp_install_missing()]]
vim.cmd [[command! LspUpdateAll call v:lua.lsp_update_all()]]

-- Setup
local wk = require("which-key")
local keymaps = {}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = {noremap = true, silent = true}
    buf_set_keymap("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
                   opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
                   opts)

    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<Leader>f",
                       "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        keymaps["f"] = "format"
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<Leader>f",
                       "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
        keymaps["f"] = "format"
    end

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end

    wk.register(keymaps, {
        prefix = "<Leader>",
        mode = "n",
        silent = true,
        noremap = true
    })
end

local function make_base_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return {capabilities = capabilities, on_attach = on_attach}
end

local function merge_config(first, second)
    for k, v in pairs(second) do first[k] = v end
end

local lsp_config = require("lsp/config")

M.setup = function()
    require("lspinstall").setup()

    local servers = require("lspinstall").installed_servers()

    for _, server in pairs(servers) do
        local config = make_base_config()

        if server == "efm" then
            merge_config(config, lsp_config.efm)
        elseif server == "lua" then
            merge_config(config, lsp_config.lua)
        end

        require("lspconfig")[server].setup(config)
    end
end

return M
