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
    graphql = {},
    html = {},
    jsonls = {
        filetypes = { "json", "jsonc" },
        init_options = {
            provideFormatter = false,
        },
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
            },
        },
    },
    ltex = {},
    -- quick_lint_js = {},
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
    sumneko_lua = {
        cmd = { "lua-language-server" },
    },
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
