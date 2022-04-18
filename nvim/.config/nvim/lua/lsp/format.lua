local M = {}

M.on_attach = function(client, bufnr)
    local disabled = {
        sumneko_lua = true,
        tsserver = true,
    }

    if not disabled[client.name] then
        if client.server_capabilities.documentFormattingProvider then
            vim.keymap.set("n", "<leader>f", function()
                local formatting_params = vim.lsp.util.make_formatting_params({})
                client.request("textDocument/formatting", formatting_params, nil, bufnr)
            end, { buffer = bufnr })
        end

        if client.server_capabilities.documentRangeFormattingProvider then
            vim.keymap.set("v", "<leader>f", function()
                local formatting_params = vim.lsp.util.make_formatting_params({})
                local range_params = vim.lsp.util.make_range_params()
                formatting_params.range = range_params.range
                client.request("textDocument/rangeFormatting", formatting_params, nil, bufnr)
            end, { buffer = bufnr })
        end
    end
end

return M
