require("grammar-guard").init()

local null_ls = require("null-ls")

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local DIAGNOSTICS = methods.internal.DIAGNOSTICS
local FORMATTING = methods.internal.FORMATTING

local sources_diagnostics = {
    dotenv = h.make_builtin({
        method = DIAGNOSTICS,
        filetypes = { "conf" },
        generator_opts = {
            command = "dotenv-linter",
            args = {
                "$FILENAME",
            },
            to_temp_file = true,
            from_stderr = true,
            format = "line",
            on_output = function(line)
                local pattern = ":(%d+) (.+)"
                local row, message = line:match(pattern)

                if row == nil then
                    return nil
                end

                return {
                    row = tonumber(row),
                    col = 1,
                    end_col = #line,
                    source = "dotenv-linter",
                    message = message,
                    severity = 1,
                }
            end,
        },
        factory = h.generator_factory,
    }),
    fish = h.make_builtin({
        method = DIAGNOSTICS,
        filetypes = { "fish" },
        generator_opts = {
            command = "fish",
            args = {
                "-n",
                "$FILENAME",
            },
            to_temp_file = true,
            from_stderr = true,
            format = "line",
            on_output = function(line)
                local pattern = "%(line (%d+)%): (.+)"
                local row, message = line:match(pattern)

                if row == nil then
                    return nil
                end

                return {
                    row = tonumber(row),
                    col = 1,
                    end_col = #line,
                    source = "fish",
                    message = message,
                    severity = 1,
                }
            end,
        },
        factory = h.generator_factory,
    }),
    jq = h.make_builtin({
        method = DIAGNOSTICS,
        filetypes = { "json", "jsonc" },
        generator_opts = {
            command = "jq",
            args = {
                ".",
            },
            to_stdin = true,
            from_stderr = true,
            format = "line",
            on_output = h.diagnostics.from_pattern(
                [[parse (%w+):(%w+) at line (%d+), column (%d+)]],
                { "severity", "message", "row", "col" },
                {
                    adapters = {
                        h.diagnostics.adapters.end_col.from_length,
                    },
                    severities = {
                        error = h.diagnostics.severities["error"],
                    },
                }
            ),
        },
        factory = h.generator_factory,
    }),
}

local sources_formatting = {
    autoflake = h.make_builtin({
        method = FORMATTING,
        filetypes = { "python" },
        generator_opts = {
            command = "autoflake",
            args = {
                "--in-place",
                "--remove-all-unused-imports",
                "$FILENAME",
            },
            to_temp_file = true,
        },
        factory = h.formatter_factory,
    }),
}

local b = require("null-ls.builtins")

null_ls.config({
    sources = {
        -- *
        b.diagnostics.codespell.with({
            filetypes = {
                "fish",
                "go",
                "javascript",
                "javascriptreact",
                "lua",
                "python",
                "rust",
                "sh",
                "typescript",
                "typescriptreact",
            },
        }),
        -- conf
        sources_diagnostics.dotenv,
        -- dockerfile
        b.diagnostics.hadolint,
        -- fish
        sources_diagnostics.fish,
        b.formatting.fish_indent,
        -- json
        sources_diagnostics.jq,
        b.formatting.fixjson.with({
            filetypes = { "json", "jsonc" },
            extra_args = { "--indent", "4" },
        }),
        -- lua
        b.formatting.stylua.with({
            extra_args = { "--config-path", vim.fn.expand("$HOME/.config/format-lint/.stylua.toml") },
        }),
        -- nginx
        b.formatting.nginx_beautifier,
        -- python
        b.diagnostics.flake8,
        sources_formatting.autoflake,
        b.formatting.isort,
        b.formatting.black,
        -- shell
        b.diagnostics.shellcheck,
        -- null_ls.builtins.formatting.shellharden,
        b.formatting.shfmt.with({
            extra_args = { "-s", "-i", "4", "-bn", "-ci", "-sr", "-kp" },
        }),
        -- web
        b.diagnostics.stylelint.with({
            extra_args = { "--config", vim.fn.expand("$HOME/.config/format-lint/.stylelintrc.json") },
        }),
        b.formatting.rustywind,
        b.formatting.stylelint.with({
            extra_args = { "--config", vim.fn.expand("$HOME/.config/format-lint/.stylelintrc.json") },
        }),
        b.formatting.prettier.with({
            filetypes = { "markdown", "vimwiki", "yaml", "yaml.docker-compose" },
            extra_args = {
                "--config",
                vim.fn.expand("$HOME/.config/format-lint/.prettierrc.json"),
            },
        }),
        b.formatting.prettierd.with({
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "svelte",
                "css",
                "scss",
                "html",
                "json",
                "jsonc",
            },
        }),

        -- markdown/vimwiki
        b.diagnostics.markdownlint.with({
            filetypes = { "markdown", "vimwiki" },
            extra_args = {
                "--config",
                vim.fn.expand("$HOME/.config/format-lint/.markdownlint.jsonc"),
                "--stdin",
            },
        }),
        b.diagnostics.vale.with({
            filetypes = { "markdown", "tex", "vimwiki" },
            extra_args = {
                "--config",
                vim.fn.expand("$HOME/.config/vale/.vale.ini"),
            },
        }),
    },
})

return {
    bashls = {},
    cssls = {},
    dockerls = {},
    eslint = {},
    gopls = {},
    grammar_guard = {
        settings = {
            ltex = {
                enabled = { "latex", "tex", "bib", "markdown" },
                language = "en",
                diagnosticSeverity = "information",
                additionalRules = {
                    enablePickyRules = true,
                    motherTongue = "en",
                },
                dictionary = {},
                disabledRules = {},
                hiddenFalsePositives = {},
            },
        },
    },
    graphql = {},
    html = {},
    jsonls = {
        filetypes = { "json", "jsonc" },
        init_options = {
            provideFormatter = false,
        },
    },
    ["null-ls"] = {},
    ["rust_analyzer"] = {},
    prismals = {},
    pyright = {},
    sumneko_lua = {
        cmd = { "sumneko-lua-language-server" },
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
