local M = {}

local disabled = {
    lua_ls = true,
    tsserver = true,
}

local function filter(client)
    return not disabled[client.name]
end

local null_ls = require("null-ls")

M.on_attach = function(client, bufnr)
    local format = function()
        vim.lsp.buf.format({
            bufnr = bufnr,
            filter = filter,
            async = true,
        })
    end

    local slow_format = function()
        null_ls.enable({ name = "slow_formatters" })
        format()
        null_ls.disable({ name = "slow_formatters" })
    end

    if client.server_capabilities.documentFormattingProvider then
        vim.keymap.set("n", "<Leader>f", function()
            format()
        end, { buffer = bufnr, desc = "LSP format" })

        vim.keymap.set("n", "<Leader>F", function()
            slow_format()
        end, { buffer = bufnr, desc = "Slow LSP format" })
    end

    if client.server_capabilities.documentRangeFormattingProvider then
        vim.keymap.set("v", "<Leader>f", function()
            format()
        end, { buffer = bufnr, desc = "LSP range format" })

        vim.keymap.set("v", "<Leader>F", function()
            slow_format()
        end, { buffer = bufnr, desc = "Slow LSP range format" })
    end
end

return M
