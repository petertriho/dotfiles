local black = {formatCommand = "black --fast --quiet -", formatStdin = true}

local cspell = {
    lintCommand = "cspell --config=$HOME/.config/format-lint/cSpell.json stdin",
    lintStdin = true,
    lintFormats = {"%f:%l:%c %t %m"},
    lintCategoryMap = {["-"] = "I"}
}

local dotenv_linter = {
    lintCommand = "dotenv-linter",
    lintFormats = {"%f:%l %m"}
}

local eslint = {
    lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
    lintFormats = {"%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m"},
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintSource = "eslint",
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
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

local prettier = {
    formatCommand = "prettierd ${INPUT}",
    formatStdin = true,
    env = {"PRETTIERD_DEFAULT_CONFIG=~/.config/format-lint/.prettierrc.json"}
}

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
            "typescript", "typescriptreact", "vimwiki", "yaml",
            "yaml.docker-compose"
        },
        settings = {
            rootMarkers = {
                ".git", ".venv", "node_modules", "tsconfig.json",
                "jsconfig.json", "setup.py"
            },
            languages = {
                ["="] = {cspell},
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
                vimwiki = {prettier, markdownlint},
                yaml = {prettier},
                ["yaml.docker-compose"] = {prettier}
            }
        }
    },
    go = {},
    graphql = {},
    html = {
        filetypes = {
            "aspnetcorerazor", "blade", "django-html", "edge", "ejs", "eruby",
            "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "jade",
            "leaf", "liquid", "mdx", "mustache", "njk", "nunjucks", "php",
            "razor", "slim", "twig", "vue", "svelte"
        }
    },
    json = {init_options = {provideFormatter = false}},
    lua = {
        --[[ settings = {
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
        } ]]
    },
    python = {},
    rust = {},
    tailwindcss = {
        filetypes = {
            "aspnetcorerazor", "blade", "django-html", "edge", "eelixir", "ejs",
            "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html",
            "html-eex", "jade", "leaf", "liquid", "mdx", "mustache", "njk",
            "nunjucks", "php", "razor", "slim", "twig", "css", "less",
            "postcss", "sass", "scss", "stylus", "sugarss", "javascript",
            "javascriptreact", "reason", "rescript", "typescript",
            "typescriptreact", "vue", "svelte"
        },
        settings = {
            tailwindCSS = {
                experimental = {
                    classRegex = {
                        "[\\w]*[cC]lass[\\w]*\\s*[:=]\\s*[{\"'`]+(.*)[\"'`}]+"
                    }
                }
            }
        }
    },
    terraform = {},
    typescript = {},
    yaml = {filetypes = {"yaml", "yaml.docker-compose"}}
}
