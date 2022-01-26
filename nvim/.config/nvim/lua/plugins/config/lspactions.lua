return {
    "RishabhRD/lspactions",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
    },
    config = function()
        vim.ui.select = require("lspactions").select
        vim.ui.input = require("lspactions").input

        vim.lsp.handlers["textDocument/codeAction"] = require("lspactions").codeaction
        vim.lsp.handlers["textDocument/references"] = require("lspactions").references
        vim.lsp.handlers["textDocument/definition"] = require("lspactions").definition
        vim.lsp.handlers["textDocument/declaration"] = require("lspactions").declaration
        vim.lsp.handlers["textDocument/implementation"] = require("lspactions").implementation
    end,
}
