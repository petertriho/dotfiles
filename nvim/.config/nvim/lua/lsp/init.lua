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
local register = require("which-key").register
local lsp_status = require("lsp-status")

register({
	a = {
		name = "+action",
		f = "file-rename",
		r = "rename",
	},
	f = "format",
	i = "import-all",
	k = "code-actions",
	l = {
		name = "+lsp",
		c = "code-actions",
		d = "definitions",
		e = {
			name = "+errors",
			d = "document",
			w = "workspace",
		},
		i = "implementations",
		l = "loclist-diagnostic",
		r = "references",
		s = {
			name = "+symbols",
			d = "documents",
			w = "workspace",
			W = "dynamic-workspace",
		},
	},
	o = "organize-imports",
	q = "quickfix",
}, {
	prefix = "<Leader>",
	mode = "n",
	silent = true,
	noremap = true,
})

register({
	f = "format",
	k = "code-actions",
	l = {
		name = "+lsp",
		c = "code-actions",
	},
	q = "quickfix",
}, {
	prefix = "<Leader>",
	mode = "v",
	silent = true,
	noremap = true,
})

local on_attach = function(client, bufnr)
	lsp_status.on_attach(client)

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local options = { noremap = true, silent = true }

	buf_set_keymap("n", "<Leader>led", "<CMD>lua require('telescope.builtin').lsp_document_diagnostics()<CR>", options)
	buf_set_keymap("n", "<Leader>lew", "<CMD>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>", options)

	buf_set_keymap("n", "gl", "<CMD>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", options)
	buf_set_keymap("n", "[d", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>", options)
	buf_set_keymap("n", "]d", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>", options)

	buf_set_keymap("n", "<Leader>ll", "<CMD>lua vim.lsp.diagnostic.set_loclist()<CR>", options)

	if client.resolved_capabilities.code_action then
		buf_set_keymap("n", "<Leader>q", "<CMD>lua vim.lsp.buf.code_action()<CR>", options)
		buf_set_keymap("v", "<Leader>q", "<CMD>lua vim.lsp.buf.range_code_action()<CR>", options)

		buf_set_keymap("n", "<Leader>k", "<CMD>lua require('telescope.builtin').lsp_code_actions()<CR>", options)
		buf_set_keymap("v", "<Leader>k", "<CMD>lua require('telescope.builtin').lsp_range_code_actions()", options)

		buf_set_keymap("n", "<Leader>lc", "<CMD>lua require('telescope.builtin').lsp_code_actions()<CR>", options)
		buf_set_keymap("v", "<Leader>lc", "<CMD>lua require('telescope.builtin').lsp_range_code_actions()", options)
	end

	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "<Leader>f", "<CMD>lua vim.lsp.buf.formatting_seq_sync()<CR>", options)
	end

	if client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("v", "<Leader>f", "<CMD>lua vim.lsp.buf.range_formatting()<CR>", options)
	end

	if client.resolved_capabilities.document_symbol then
		buf_set_keymap("n", "<Leader>lsd", "<CMD>lua require('telescope.builtin').lsp_document_symbols()<CR>", options)
	end

	if client.resolved_capabilities.workspace_symbol then
		buf_set_keymap("n", "<Leader>lsw", "<CMD>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", options)
		buf_set_keymap(
			"n",
			"<Leader>lsW",
			"<CMD>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
			options
		)
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
		buf_set_keymap("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", options)
		buf_set_keymap("n", "<Leader>lr", "<CMD>lua require('telescope.builtin').lsp_references()<CR>", options)
	end

	if client.resolved_capabilities.goto_definition then
		buf_set_keymap("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", options)
		buf_set_keymap("n", "<Leader>ld", "<CMD>lua require('telescope.builtin').lsp_definitions()<CR>", options)

		buf_set_keymap("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", options)
		buf_set_keymap("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", options)
		buf_set_keymap("n", "<Leader>li", "<CMD>lua require('telescope.builtin').lsp_implementations()<CR>", options)
	end

	if client.resolved_capabilities.hover then
		buf_set_keymap("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", options)
		buf_set_keymap("n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>", options)
	end

	if client.resolved_capabilities.rename then
		buf_set_keymap("n", "<Leader>ar", "<CMD>lua vim.lsp.buf.rename()<CR>", options)
	end

	if client.resolved_capabilities.signature_help then
		buf_set_keymap("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", options)
	end

	if client.resolved_capabilities.type_definition then
		buf_set_keymap("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", options)
	end
end

local on_attach_ts = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	on_attach(client, bufnr)

	local ts_utils = require("nvim-lsp-ts-utils")
	ts_utils.setup({ eslint_bin = "eslint_d" })
	ts_utils.setup_client(client)

	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>af", ":TSLspRenameFile<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>i", ":TSLspImportAll<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>o", ":TSLspOrganize<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>q", ":TSLspFixCurrent<CR>", opts)
end

local on_attach_py = function(client, bufnr)
	on_attach(client, bufnr)

	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>o", ":PyrightOrganizeImports<CR>", opts)
end

local function make_base_config()
	local capabilities = lsp_status.capabilities
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	return {
		capabilities = capabilities,
		on_attach = on_attach,
		flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
	}
end

local function setup()
	vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
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

	for _, server in pairs(servers) do
		local config = make_base_config()

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
		local config = make_base_config()

		if server == "tsserver" then
			config = vim.tbl_extend("force", config, additional_servers.tsserver or {})
			config.on_attach = on_attach_ts
		elseif server == "pyright" then
			config = vim.tbl_extend("force", config, additional_servers.pyright or {})
			config.on_attach = on_attach_py
		else
			config = vim.tbl_extend("force", config, additional_servers[server] or {})
		end

		lspconfig[server].setup(config)
	end
end

setup()
