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
    jdtls = {},
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
    ltex = {
        filetypes = { "bib", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" },
    },
    lua_ls = {},
    marksman = {},
    quick_lint_js = {
        filetypes = { "javascript", "javascriptreact", "jsx" },
    },
    ruff_lsp = {
        init_options = {
            args = {
                "--config",
                vim.fn.expand("$HOME/.config/format-lint/.ruff.toml"),
            },
        },
        commands = {
            RuffOrganizeImports = {
                function()
                    local params = {
                        command = "ruff.applyOrganizeImports",
                        arguments = { vim.api.nvim_buf_get_name(0) },
                    }
                    vim.lsp.buf.execute_command(params)
                end,
                description = "Organize Imports",
            },
        },
    },
    rust_analyzer = {},
    prismals = {},
    -- pylyzer = {},
    pyright = {
        python = {
            analysis = {
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        },
    },
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
    },
    yamlls = {},
}
