local black = {formatCommand = "black --fast --quiet -", formatStdin = true}

local eslint = {
    lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m"},
    lintSource = "eslint"
}

local hadolint = {lintCommand = "hadolint", lintFormats = {"%f:%l %m"}}

local isort = {
    formatCommand = "isort --quiet --stdout --profile black -",
    formatStdin = true
}

local luaformat = {
    formatCommand = "lua-format --single-quote-to-double-quote  -i",
    formatStdin = true
}

local markdownlint2 = {
    lintCommand = "markdownlint-cli2 ${INPUT}",
    lintFormats = {"%f:%l %m", "%f:%l:%c %m", "%f: %l: %m"}
}

local prettier = {formatCommand = "prettierd ${INPUT}", formatStdin = true}

local rustywind = {formatCommand = "rustywind --stdin", formatStdin = true}

local shfmt = {formatCommand = "shfmt -ci -s -bn", formatStdin = true}

local shellcheck = {
    lintCommand = "shellcheck -f gcc -x -",
    lintStdin = true,
    lintFormats = {
        "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m"
    },
    lintSource = "shellcheck"
}

return {
    bash = {},
    css = {},
    dockerfile = {},
    efm = {
        init_options = {documentFormatting = true},
        filetypes = {
            "css", "dockerfile", "javascript", "javascriptreact", "json",
            "html", "lua", "markdown", "python", "scss", "sh", "typescript",
            "typescriptreact", "yaml"
        },
        settings = {
            rootMarkers = {
                ".git", ".venv", "node_modules", "tsconfig.json",
                "jsconfig.json", "setup.py"
            },
            languages = {
                css = {rustywind, prettier},
                dockerfile = {hadolint},
                javascript = {prettier, eslint},
                javascriptreact = {rustywind, prettier, eslint},
                json = {prettier},
                html = {rustywind, prettier},
                lua = {luaformat},
                markdown = {prettier, markdownlint2},
                python = {isort, black},
                scss = {rustywind, prettier},
                sh = {shfmt, shellcheck},
                typescript = {prettier, eslint},
                typescriptreact = {rustywind, prettier, eslint},
                yaml = {prettier}
            }
        }
    },
    go = {},
    graphql = {},
    html = {},
    json = {},
    lua = {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = vim.split(package.path, ";")
                },
                diagnostics = {globals = {"vim"}},
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                    }
                }
            }
        }
    },
    python = {},
    tailwindcss = {},
    terraform = {},
    typescript = {},
    yaml = {}
}
