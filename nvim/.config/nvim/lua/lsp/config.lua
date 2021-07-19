local black = {formatCommand = "black --fast --quiet -", formatStdin = true}

local cspell = {
    lintCommand = "cspell --config=$HOME/.config/format-lint/cSpell.json stdin",
    lintStdin = true,
    lintFormats = {"%f:%l:%c %t %m"},
    lintIgnoreExitCode = true,
    lintCategoryMap = {["-"] = "I"},
    lintSource = "cSpell"
}

local dotenv_linter = {
    lintCommand = "dotenv-linter ${INPUT}",
    lintFormats = {"%f:%l %m"},
    lintIgnoreExitCode = true,
    lintSource = "dotenv-linter"
}

local eslint = {
    lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f(%l,%c): %tarning %m", "%f(%l,%c): %trror %m"},
    lintIgnoreExitCode = true,
    lintSource = "eslint",
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
    formatStdin = true
}

local fish = {
    lintCommand = "fish -n ${INPUT}",
    lintFormats = {"%f (line %l): %m"},
    lintIgnoreExitCode = true,
    lintSource = "fish"
}

local fish_indent = {formatCommand = "fish_indent", formatStdin = true}

local fixjson = {formatCommand = "fixjson --indent 4", formatStdin = true}

local hadolint = {
    lintCommand = "hadolint --no-color ${INPUT}",
    lintFormats = {"%f:%l %m %tarning: %m", "%f:%l %m %tnfo: %m", "%f:%l:%c %m"},
    lintIgnoreExitCode = true,
    lintSource = "hadolint"
}

local isort = {
    formatCommand = "isort --quiet --stdout --profile black -",
    formatStdin = true
}

local jq = {
    lintCommand = "jq .",
    lintFormats = {"parse %trror: %m at line %l, column %c"},
    lintIgnoreExitCode = true,
    lintSource = "jq"
}

local luaformat = {
    formatCommand = "lua-format --single-quote-to-double-quote -i",
    formatStdin = true
}

local markdownlint = {
    lintCommand = "markdownlint --config=$HOME/.config/format-lint/.markdownlint.jsonc ${INPUT}",
    lintFormats = {"%f:%l:%c %m", "%f:%l %m", "%f: %l: %m"},
    lintIgnoreExitCode = true
}

local prettier = {
    formatCommand = "prettier --config ~/.config/format-lint/.prettierrc.json ${INPUT}",
    formatStdin = true
}

local prettierd = {
    formatCommand = "prettierd ${INPUT}",
    formatStdin = true,
    env = {
        string.format("PRETTIERD_DEFAULT_CONFIG=%s",
                      vim.fn.expand("~/.config/format-lint/.prettierrc.json"))
    }
}

local rustywind = {formatCommand = "rustywind --stdin", formatStdin = true}

local shfmt = {
    formatCommand = "shfmt -s -i 4 -bn -ci -sr -kp",
    formatStdin = true
}

local shellcheck = {
    lintCommand = "shellcheck -f gcc -x -",
    lintStdin = true,
    lintFormats = {
        "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m"
    },
    lintIgnoreExitCode = true,
    lintSource = "shellcheck"
}

local write_good = {
    lintCommand = "write-good ${INPUT}",
    lintFormats = {"%m on line %l at column %c"},
    lintIgnoreExitCode = true,
    lintSource = "write-good"
}

return {
    bash = {},
    css = {},
    dockerfile = {},
    efm = {
        init_options = {documentFormatting = true},
        filetypes = {
            "conf", "css", "dockerfile", "fish", "html", "javascript",
            "javascriptreact", "json", "jsonc", "lua", "markdown", "python",
            "scss", "sh", "typescript", "typescriptreact", "vimwiki", "yaml",
            "yaml.docker-compose"
        },
        settings = {
            lintDebounce = 500000000,
            rootMarkers = {
                ".git", ".venv", "node_modules", "tsconfig.json",
                "jsconfig.json", "setup.py"
            },
            languages = {
                -- ["="] = {cspell},
                conf = {dotenv_linter},
                css = {rustywind, prettierd},
                dockerfile = {hadolint},
                html = {rustywind, prettierd},
                javascript = {prettierd, eslint},
                javascriptreact = {rustywind, prettierd, eslint},
                json = {jq, fixjson},
                jsonc = {jq, fixjson},
                fish = {fish_indent, fish},
                lua = {luaformat},
                markdown = {prettier, markdownlint, write_good},
                python = {isort, black},
                scss = {rustywind, prettierd},
                sh = {shfmt, shellcheck},
                typescript = {prettierd, eslint},
                typescriptreact = {rustywind, prettierd, eslint},
                vimwiki = {prettier, markdownlint, write_good},
                yaml = {prettierd},
                ["yaml.docker-compose"] = {prettierd}
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
