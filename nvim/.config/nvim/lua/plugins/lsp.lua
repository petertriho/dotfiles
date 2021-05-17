-- Install
local required_servers = {
    'bash',
    'css',
    'dockerfile',
    'efm',
    'go',
    'graphql',
    'html',
    'json',
    'lua',
    'python',
    'tailwindcss',
    'terraform',
    'typescript',
    'yaml'
}
local installed_servers = require('lspinstall').installed_servers()
for _, server in pairs(required_servers) do
    if not vim.tbl_contains(installed_servers, server) then
        require'lspinstall'.install_server(server)
    end
end

-- Completion
require('compe').setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'always';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        tabnine = {
            priority = 5000
        };
        tmux = true;
        vnip = true;
    };
}

-- Keymaps
local wk = require('which-key')
local keymaps = {
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function(key)
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
    elseif vim.fn.call('vsnip#available', {1}) == 1 then
        return t '<Plug>(vsnip-expand-or-jump)'
    elseif check_back_space() then
        return t(key)
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function(key)
    if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
    elseif vim.fn.call('vsnip#jumpable', {-1}) == 1 then
        return t '<Plug>(vsnip-jump-prev)'
    else
        return t(key)
    end
end

local set_keymap = vim.api.nvim_set_keymap
local complete_opts = { expr = true }
set_keymap('i', '<C-j>', 'v:lua.tab_complete("<C-j>")', complete_opts)
set_keymap('s', '<C-j>', 'v:lua.tab_complete("<C-j>")', complete_opts)
set_keymap('i', '<C-k>', 'v:lua.s_tab_complete("<C-k>")', complete_opts)
set_keymap('s', '<C-k>', 'v:lua.s_tab_complete("<C-k>")', complete_opts)

set_keymap('i', '<Tab>', 'v:lua.tab_complete("<Tab>")', complete_opts)
set_keymap('s', '<Tab>', 'v:lua.tab_complete("<Tab>")', complete_opts)
set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete("<S-Tab>")', complete_opts)
set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete("<S-Tab>")', complete_opts)

local compe_opts = { silent = true, expr = true, noremap = true }
set_keymap('i', '<C-Space>', 'compe#complete()', compe_opts)
set_keymap('i', '<CR>', 'compe#confirm("<CR>")', compe_opts)
set_keymap('i', '<C-e>', 'compe#close()', compe_opts)
set_keymap('i', '<C-d>', 'compe#scroll({ "delta": -4 })', compe_opts)
set_keymap('i', '<C-f>', 'compe#scroll({ "delta": +4 })', compe_opts)

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gh', '<CMD>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gs', '<CMD>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    if client.resolved_capabilities.document_formatting then
        buf_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        keymaps['f'] = 'format'
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
        keymaps['f'] = 'format'
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
        prefix = '<Leader>',
        mode = 'n',
        silent = true,
        noremap = true
    })
end

local lua_settings = {
    Lua = {
        runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
        },
        diagnostics = {
            globals = {'vim'},
        },
        workspace = {
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
        },
    }
}

local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return {
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

-- Setup
local function setup_servers()
    require('lspinstall').setup()

    local servers = require('lspinstall').installed_servers()

    for _, server in pairs(servers) do
        local config = make_config()

        if server == "lua" then
            config.settings = lua_settings
        end

        require('lspconfig')[server].setup(config)
    end
end

setup_servers()
