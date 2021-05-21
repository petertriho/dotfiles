local black = {formatCommand = "black --fast --quiet -", formatStdin = true}

local dotenv_linter = {
    lintCommand = "dotenv-linter",
    lintFormats = {"%f:%l %m"}
}

local eslint = {
    lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m"},
    lintSource = "eslint"
}

local fixjson = {formatCommand = "fixjson", formatStdin = true}

local hadolint = {lintCommand = "hadolint", lintFormats = {"%f:%l %m"}}

local isort = {
    formatCommand = "isort --quiet --stdout --profile black -",
    formatStdin = true
}

local jq = {lintCommand = "jq ."}

local luaformat = {
    formatCommand = "lua-format --single-quote-to-double-quote  -i",
    formatStdin = true
}

local markdownlint = {
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
            "conf", "css", "dockerfile", "javascript", "javascriptreact",
            "json", "html", "lua", "markdown", "python", "scss", "sh",
            "typescript", "typescriptreact", "yaml"
        },
        settings = {
            rootMarkers = {
                ".git", ".venv", "node_modules", "tsconfig.json",
                "jsconfig.json", "setup.py"
            },
            languages = {
                conf = {dotenv_linter},
                css = {rustywind, prettier},
                dockerfile = {hadolint},
                javascript = {prettier, eslint},
                javascriptreact = {rustywind, prettier, eslint},
                json = {jq, fixjson},
                html = {rustywind, prettier},
                lua = {luaformat},
                markdown = {prettier, markdownlint},
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
    json = {init_options = {provideFormatter = false}},
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
