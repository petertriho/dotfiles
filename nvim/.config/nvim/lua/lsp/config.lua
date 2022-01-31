return {
    bashls = {},
    cssls = {},
    dockerls = {},
    ["emmet_ls"] = {
        filetypes = {
            "css",
            "html",
            "javascript",
            "javascriptreact",
            "sass",
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
    -- quick_lint_js = {},
    rust_analyzer = {},
    prismals = {},
    pyright = {
        single_file_support = false,
        python = {
            analysis = {
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        },
    },
    sumneko_lua = {
        cmd = { "lua-language-server" },
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
    yamlls = {
        filetypes = { "yaml", "yaml.docker-compose" },
    },
}
