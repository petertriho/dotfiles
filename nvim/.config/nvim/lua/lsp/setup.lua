local M = {}

-- Install
function _G.lsp_install_missing()
    local configs = require("lsp/config")
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
local keymaps = {a = {}, l = {}}

local on_attach = function(client, bufnr)
    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = {noremap = true, silent = true}

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
        autocmd CursorHold <buffer> lua require'lspsaga.diagnostic'.show_cursor_diagnostics()
        autocmd CursorHoldI * silent! lua require'lspsaga.signaturehelp'.signature_help()
        augroup END
        ]], false)
    end

    if client.resolved_capabilities.find_references then
        buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    end

    if client.resolved_capabilities.goto_definition then
        buf_set_keymap("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap("n", "<Leader>ld", "<CMD>Lspsaga preview_definition<CR>",
                       opts)
        keymaps["l"]["d"] = "definition-preview"
        buf_set_keymap("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
        buf_set_keymap("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>",
                       opts)
    end

    if client.resolved_capabilities.hover then
        --[[ buf_set_keymap("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
        buf_set_keymap("n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>", opts) ]]
        buf_set_keymap("n", "K", "<CMD>Lspsaga hover_doc<CR>", opts)
    end

    if client.resolved_capabilities.rename then
        buf_set_keymap("n", "<Leader>ar",
                       "<CMD>lua require'lsp.rename'.rename()<CR>", opts)
        keymaps["a"]["r"] = "rename"
    end

    buf_set_keymap("n", "gh", "<CMD>Lspsaga lsp_finder<CR>", opts)
    -- buf_set_keymap("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "gs", "<CMD>Lspsaga signature_help<CR>", opts)
    buf_set_keymap("n", "[d", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>",
                   opts)
    buf_set_keymap("n", "]d", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>",
                   opts)

    buf_set_keymap("n", "<Leader>c", "<CMD>Lspsaga code_action<CR>", opts)
    buf_set_keymap("v", "<Leader>c", "<CMD>Lspsaga code_action<CR>", opts)
    keymaps["c"] = "code-action"

    buf_set_keymap("n", "<Leader>aq", "<CMD>lua vim.lsp.buf.code_action()<CR>",
                   opts)
    keymaps["a"]["q"] = "quickfix"

    wk.register(keymaps, {
        prefix = "<Leader>",
        mode = "n",
        silent = true,
        noremap = true
    })
end

local on_attach_ts = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false

    on_attach(client, bufnr)

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup {eslint_bin = "eslint_d"}
    ts_utils.setup_client(client)

    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>o", ":TSLspOrganize<CR>",
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>q", ":TSLspFixCurrent<CR>",
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>r", ":TSLspRenameFile<CR>",
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>i", ":TSLspImportAll<CR>",
                                opts)

    wk.register({
        o = "organize-imports",
        q = "quickfix",
        r = "rename",
        i = "import-all"
    }, {prefix = "<Leader>", mode = "n", silent = true, noremap = true})
end

local function make_base_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {"documentation", "detail", "additionalTextEdits"}
    }
    return {capabilities = capabilities, on_attach = on_attach}
end

local function merge_config(first, second)
    for k, v in pairs(second) do first[k] = v end
end

local lsp_config = require("lsp/config")

M.setup = function()
    require("lspinstall").setup()
    require("lspsaga").init_lsp_saga()

    local servers = require("lspinstall").installed_servers()

    for _, server in pairs(servers) do
        local config = make_base_config()

        if server == "efm" then
            merge_config(config, lsp_config.efm)
        elseif server == "json" then
            merge_config(config, lsp_config.json)
        elseif server == "html" then
            merge_config(config, lsp_config.html)
        elseif server == "lua" then
            -- merge_config(config, lsp_config.lua)
            config = require("lua-dev").setup()
        elseif server == "tailwindcss" then
            merge_config(config, lsp_config.tailwindcss)
        elseif server == "typescript" then
            merge_config(config, lsp_config.typescript)
            merge_config(config, {on_attach = on_attach_ts})
        end

        require("lspconfig")[server].setup(config)
    end
end

return M
