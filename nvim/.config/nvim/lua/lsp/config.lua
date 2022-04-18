return {
    bashls = {},
    cssls = {},
    dockerls = {},
    emmet_ls = {
        filetypes = {
            "css",
            "html",
            "javascript",
            "javascriptreact",
            "sass",
            "svelte",
            "scss",
            "typescript",
            "typescriptreact",
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
                schemas = require("schemastore").json.schemas(),
            },
        },
    },
    ltex = {
        filetypes = { "bib", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" },
    },
    quick_lint_js = {
        filetypes = { "javascript", "javascriptreact", "jsx" },
    },
    rust_analyzer = {},
    prismals = {},
    pyright = {
        python = {
            analysis = {
                diagnosticMode = "workspace",
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
