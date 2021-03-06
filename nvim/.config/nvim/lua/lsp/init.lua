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

vim.cmd [[command! LspInstallMissing call v:lua.lsp_install_missing()]]
vim.cmd [[command! LspUpdateAll call v:lua.lsp_update_all()]]

-- Setup
local register = require("which-key").register
local keymaps = {a = {name = "+action"}, l = {name = "+lsp"}}
local visual_keymaps = {a = {name = "+action"}, l = {name = "+lsp"}}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local options = {noremap = true, silent = true}

    keymaps["l"]["e"] = {
        name = "+errors",
        d = {
            "<CMD>lua require('telescope.builtin').lsp_document_diagnostics()<CR>",
            "document"
        },
        w = {
            "<CMD>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>",
            "workspace"
        }
    }

    buf_set_keymap("n", "gl",
                   "<CMD>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
                   options)
    buf_set_keymap("n", "[l", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>",
                   options)
    buf_set_keymap("n", "]l", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>",
                   options)

    keymaps["l"]["l"] = {
        "<CMD>lua vim.lsp.diagnostic.set_loclist()<CR>", "loclist-diagnostic"
    }

    if client.resolved_capabilities.code_action then
        keymaps["q"] = {"<CMD>lua vim.lsp.buf.code_action()<CR>", "quickfix"}

        keymaps["k"] = {
            "<CMD>lua require('telescope.builtin').lsp_code_actions()<CR>",
            "code-actions"
        }
        visual_keymaps["k"] = {
            "<CMD>lua require('telescope.builtin').lsp_range_code_actions()",
            "code-actions"
        }

        keymaps["l"]["c"] = {
            "<CMD>lua require('telescope.builtin').lsp_code_actions()<CR>",
            "code-actions"
        }
        visual_keymaps["l"]["c"] = {
            "<CMD>lua require('telescope.builtin').lsp_range_code_actions()",
            "code-actions"
        }
    end

    if client.resolved_capabilities.document_formatting then
        keymaps["f"] = {
            "<CMD>lua vim.lsp.buf.formatting_seq_sync()<CR>", "format"
        }
    end

    if client.resolved_capabilities.document_range_formatting then
        visual_keymaps["f"] = {
            "<CMD>lua vim.lsp.buf.range_formatting()<CR>", "format"
        }
    end

    if client.resolved_capabilities.document_symbol or
        client.resolved_capabilities.workspace_symbol then
        keymaps["l"]["s"] = {name = "+symbols"}

        if client.resolved_capabilities.document_symbol then
            keymaps["l"]["s"]["d"] = {
                "<CMD>lua require('telescope.builtin').lsp_document_symbols()<CR>",
                "document"
            }
        end

        if client.resolved_capabilities.workspace_symbol then
            keymaps["l"]["s"]["w"] = {
                "<CMD>lua require('telescope.builtin').lsp_workspace_symbols()<CR>",
                "workspace"
            }
            keymaps["l"]["s"]["W"] = {
                "<CMD>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
                "dynamic-workspace"
            }
        end
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
        buf_set_keymap("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>",
                       options)
        keymaps["l"]["r"] = {
            "<CMD>lua require('telescope.builtin').lsp_references()<CR>",
            "references"
        }
    end

    if client.resolved_capabilities.goto_definition then
        buf_set_keymap("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>",
                       options)
        keymaps["l"]["d"] = {
            "<CMD>lua require('telescope.builtin').lsp_definitions()<CR>",
            "definitions"
        }

        buf_set_keymap("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>",
                       options)
        buf_set_keymap("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>",
                       options)
        keymaps["l"]["i"] = {
            "<CMD>lua require('telescope.builtin').lsp_implementations()<CR>",
            "implementations"
        }
    end

    if client.resolved_capabilities.hover then
        buf_set_keymap("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", options)
        buf_set_keymap("n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>", options)
    end

    if client.resolved_capabilities.rename then
        keymaps["a"]["r"] = {"<CMD>lua vim.lsp.buf.rename()<CR>", "rename"}
    end

    if client.resolved_capabilities.signature_help then
        buf_set_keymap("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>",
                       options)
    end

    if client.resolved_capabilities.type_definition then
        buf_set_keymap("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>",
                       options)
    end

    register(keymaps, {
        prefix = "<Leader>",
        mode = "n",
        buffer = bufnr,
        silent = true,
        noremap = true
    })

    register(keymaps, {
        prefix = "<Leader>",
        mode = "v",
        buffer = bufnr,
        silent = true,
        noremap = true
    })
end

local on_attach_ts = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false

    on_attach(client, bufnr)

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({eslint_bin = "eslint_d"})
    ts_utils.setup_client(client)

    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>o", ":TSLspOrganize<CR>",
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>q", ":TSLspFixCurrent<CR>",
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ar",
                                ":TSLspRenameFile<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>i", ":TSLspImportAll<CR>",
                                opts)

    register({
        o = "organize-imports",
        q = "quickfix",
        a = {r = "rename"},
        i = "import-all"
    }, {
        prefix = "<Leader>",
        mode = "n",
        buffer = bufnr,
        silent = true,
        noremap = true
    })
end

local function make_base_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {"documentation", "detail", "additionalTextEdits"}
    }
    return {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {allow_incremental_sync = true, debounce_text_changes = 500}
    }
end

local function setup()
    local lspconfig = require("lspconfig")

    require("null-ls").config {}
    lspconfig["null-ls"].setup {}

    lspinstall.setup()

    local servers = lspinstall.installed_servers()

    for _, server in pairs(servers) do
        local config = make_base_config()

        if server == "lua" then
            config = require("lua-dev").setup({
                library = {vimruntime = true, types = true, plugins = true},
                lspconfig = config
            })
        elseif server == "typescript" then
            config =
                vim.tbl_extend("force", config, lsp_config.typescript or {})
            config.on_attach = on_attach_ts
        else
            config = vim.tbl_extend("force", config, lsp_config[server] or {})
        end

        lspconfig[server].setup(config)
    end

    local additional_servers = require("lsp.servers")
    for server, _ in pairs(additional_servers) do
        local config = make_base_config()

        config = vim.tbl_extend("force", config,
                                additional_servers[server] or {})

        lspconfig[server].setup(config)
    end
end

setup()
