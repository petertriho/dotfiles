local M = {}

local disabled = {
    lua_ls = true,
    tsserver = true,
}

local function filter(client)
    return not disabled[client.name]
end

M.on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.keymap.set("n", "<Leader>f", function()
            vim.lsp.buf.format({
                bufnr = bufnr,
                filter = filter,
                async = true,
            })
        end, { buffer = bufnr, desc = "LSP format" })
    end

    if client.server_capabilities.documentRangeFormattingProvider then
        vim.keymap.set("v", "<Leader>f", function()
            vim.lsp.buf.format({
                bufnr = bufnr,
                filter = filter,
                async = true,
            })
        end, { buffer = bufnr, desc = "LSP range format" })
    end
end

return M
