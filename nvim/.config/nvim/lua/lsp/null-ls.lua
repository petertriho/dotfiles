local M = {}

local null_ls = require("null-ls")

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local DIAGNOSTICS = methods.internal.DIAGNOSTICS
local FORMATTING = methods.internal.FORMATTING

local sources_diagnostics = {
    bandit = h.make_builtin({
        method = DIAGNOSTICS,
        filetypes = { "python" },
        generator_opts = {
            command = "bandit",
            args = {
                "--quiet",
                "--format",
                "json",
                "$FILENAME",
            },
            to_temp_file = true,
            from_stderr = true,
            format = "json",
            on_output = function(params)
                if #params.output.results then
                    return {}
                end

                local parser = h.diagnostics.from_json({
                    attributes = {
                        row = "line_number",
                        col = "col_offset",
                        code = "test_id",
                        message = "issue_text",
                        severity = "issue_severity",
                    },
                    severities = {
                        HIGH = h.diagnostics.severities.error,
                        MEDIUM = h.diagnostics.severities.warning,
                        LOW = h.diagnostics.severities.information,
                        UNDEFINED = h.diagnostics.severities.hint,
                    },
                })

                return parser({ output = params.output.results })
            end,
        },
        factory = h.generator_factory,
    }),
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
                    severity = h.diagnostics.severities.error,
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
                    severity = h.diagnostics.severities.error,
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
                        error = h.diagnostics.severities.error,
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
    -- for black versions that do not accept stdin
    black = h.make_builtin({
        method = FORMATTING,
        filetypes = { "python" },
        generator_opts = {
            command = "black",
            args = {
                "--quiet",
                "$FILENAME",
            },
            to_temp_file = true,
        },
        factory = h.formatter_factory,
    }),
    pybetter = h.make_builtin({
        method = FORMATTING,
        filetypes = { "python" },
        generator_opts = {
            command = "pybetter",
            args = {
                "--exclude",
                "B004", -- __all__ attribute
                "$FILENAME",
            },
            to_temp_file = true,
        },
        factory = h.formatter_factory,
    }),
    docformatter = h.make_builtin({
        method = FORMATTING,
        filetypes = { "python" },
        generator_opts = {
            command = "docformatter",
            args = {
                "--in-place",
                "$FILENAME",
            },
            to_temp_file = true,
        },
        factory = h.formatter_factory,
    }),
    ssort = h.make_builtin({
        method = FORMATTING,
        filetypes = { "python" },
        generator_opts = {
            command = "ssort",
            args = {
                "$FILENAME",
            },
            to_temp_file = true,
        },
        factory = h.formatter_factory,
    }),
    pyupgrade = h.make_builtin({
        method = FORMATTING,
        filetypes = { "python" },
        generator_opts = {
            command = "pyupgrade",
            args = {
                "--py3-plus",
                "$FILENAME",
            },
            to_temp_file = true,
        },
        factory = h.formatter_factory,
    }),
}

local b = require("null-ls.builtins")

local u = require("null-ls.utils")
local conditional = u.make_conditional_utils()

local check_if_black_accepts_stdin = function()
    local black_version = string.match(vim.fn.system("black --version"), "([%d%.]+%a*%d*)")
    return black_version >= "21.4b0"
end

M.setup = function(overrides)
    local config = vim.tbl_deep_extend("force", {
        sources = {
            -- *
            b.diagnostics.codespell.with({
                filetypes = {},
                disabled_filetypes = { "gitcommit", "markdown", "NvimTree", "vimwiki" },
            }),
            b.hover.dictionary,
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
            }),
            -- lua
            b.diagnostics.selene.with({
                condition = function(utils)
                    return utils.root_has_file({ "selene.toml", ".selene.toml" })
                end,
            }),
            b.formatting.stylua.with({
                extra_args = function(params)
                    local extra_args = {}

                    if not conditional.root_has_file({ "stylua.toml", ".stylua.toml" }) then
                        extra_args = {
                            "--config-path",
                            vim.fn.expand("$HOME/.config/format-lint/.stylua.toml"),
                        }
                    end

                    return extra_args
                end,
            }),
            -- nginx
            b.formatting.nginx_beautifier,
            -- python
            sources_diagnostics.bandit,
            b.diagnostics.flake8.with({
                extra_args = {
                    "--ignore",
                    "E501", -- line too long
                },
            }),
            -- b.diagnostics.pylint,
            sources_formatting.autoflake,
            sources_formatting.docformatter.with({
                condition = function(utils)
                    return not string.find(vim.fn.system("python --version"), "3.8")
                end,
            }),
            sources_formatting.pybetter,
            sources_formatting.pyupgrade,
            sources_formatting.ssort.with({
                condition = function(utils)
                    return not string.find(vim.fn.system("python --version"), "3.8")
                end,
            }),
            b.formatting.isort.with({
                extra_args = function(params)
                    local extra_args = { "--profile", "black" }

                    if string.find(vim.fn.system("python --version"), "3.8") then
                        table.insert(extra_args, "--sl")
                    end

                    return extra_args
                end,
            }),
            sources_formatting.black.with({
                condition = function(utils)
                    return not check_if_black_accepts_stdin()
                end,
            }),
            b.formatting.black.with({
                condition = function(utils)
                    return check_if_black_accepts_stdin()
                end,
            }),
            -- shell
            b.code_actions.shellcheck,
            b.diagnostics.shellcheck,
            b.formatting.shfmt.with({
                extra_args = function(params)
                    local extra_args = {
                        "-s",
                        "-bn",
                        "-ci",
                        "-sr",
                        "-kp",
                    }

                    if params.options and params.options.insertSpaces and params.options.tabSize then
                        table.insert(extra_args, "-i")
                        table.insert(extra_args, params.options.tabSize)
                    end

                    return extra_args
                end,
            }),
            -- web
            b.diagnostics.stylelint.with({
                extra_args = {
                    "--config",
                    vim.fn.expand("$HOME/.config/format-lint/.stylelintrc.json"),
                },
            }),
            b.formatting.rustywind,
            b.formatting.stylelint.with({
                extra_args = {
                    "--config",
                    vim.fn.expand("$HOME/.config/format-lint/.stylelintrc.json"),
                },
            }),
            b.formatting.prettier.with({
                filetypes = {
                    "graphql",
                    "markdown",
                    "svelte",
                    "vimwiki",
                    "yaml",
                },
                extra_args = function(params)
                    local extra_args = {}

                    if params.options and not params.options.insertSpaces then
                        table.insert(extra_args, "--use-tabs")
                        table.insert(extra_args, "true")
                    end

                    if params.options and params.options.tabSize then
                        table.insert(extra_args, "--tab-width")
                        table.insert(extra_args, params.options.tabSize)
                    end

                    return extra_args
                end,
            }),
            b.formatting.prettierd.with({
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                    "vue",
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
    }, overrides or {})

    null_ls.setup(config)
end

return M
