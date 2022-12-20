return {
    bashls = {},
    cssls = {},
    dockerls = {},
    emmet_ls = {
        filetypes = {
            "css",
            "html",
            "sass",
            "scss",
            "xml",
        },
    },
    eslint = {},
    gopls = {},
    graphql = {
        filetypes = { "graphql" },
    },
    html = {
        init_options = {
            provideFormatter = false,
        },
    },
    jsonls = {
        init_options = {
            provideFormatter = false,
        },
        settings = {
            json = {
                validate = { enable = true },
                schemas = require("schemastore").json.schemas(),
            },
        },
    },
    ltex = {},
    -- marksman = {},
    quick_lint_js = {
        filetypes = { "javascript", "javascriptreact", "jsx" },
    },
    ruff_lsp = {},
    rust_analyzer = {},
    prismals = {},
    pyright = {
        python = {
            analysis = {
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        },
    },
    sumneko_lua = {},
    svelte = {},
    tailwindcss = {
        settings = {
            tailwindCSS = {
                experimental = {
                    classRegex = {
                        "[\\w]*[cC]lass[\\w]*\\s*[:=]\\s*[{\"'`]+(.*)[\"'`}]+",
                    },
                },
            },
        },
    },
    taplo = {},
    terraformls = {},
    tflint = {},
    tsserver = {
        commands = {
            TSServerOrganizeImports = {
                function()
                    local params = {
                        command = "_typescript.organizeImports",
                        arguments = { vim.api.nvim_buf_get_name(0) },
                    }
                    vim.lsp.buf.execute_command(params)
                end,
                description = "Organize Imports",
            },
        },
        user_commands = {
            {
                name = "TSServerOrganizeImports",
                command = function()
                    local params = {
                        command = "_typescript.organizeImports",
                        arguments = { vim.api.nvim_buf_get_name(0) },
                    }
                    vim.lsp.buf.execute_command(params)
                end,
                opts = {
                    desc = "Organize Imports",
                },
            },
        },
    },
    yamlls = {},
}
