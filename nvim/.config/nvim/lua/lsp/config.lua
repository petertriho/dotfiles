local cspell = {
	lintCommand = "cspell --config=$HOME/.config/format-lint/cSpell.json stdin",
	lintStdin = true,
	lintFormats = { "%f:%l:%c %t %m" },
	lintIgnoreExitCode = true,
	lintCategoryMap = { ["-"] = "I" },
	lintSource = "cSpell",
}

local eslint = {
	lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %trror %m" },
	lintIgnoreExitCode = true,
	lintSource = "eslint",
	formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
	formatStdin = true,
}

local markdownlint = {
	lintCommand = "markdownlint --config=$HOME/.config/format-lint/.markdownlint.jsonc ${INPUT}",
	lintFormats = { "%f:%l:%c %m", "%f:%l %m", "%f: %l: %m" },
	lintIgnoreExitCode = true,
	lintSource = "markdownlint",
}

local prettier = {
	formatCommand = "prettier --config ~/.config/format-lint/.prettierrc.json --stdin-filepath ${INPUT}",
	formatStdin = true,
}

local prettierd = {
	formatCommand = "prettierd ${INPUT}",
	formatStdin = true,
	env = {
		string.format("PRETTIERD_DEFAULT_CONFIG=%s", vim.fn.expand("~/.config/format-lint/.prettierrc.json")),
	},
}

local rustywind = { formatCommand = "rustywind --stdin", formatStdin = true }

local write_good = {
	lintCommand = "write-good ${INPUT}",
	lintFormats = { "%m on line %l at column %c" },
	lintIgnoreExitCode = true,
	lintSource = "write-good",
}

return {
	efm = {
		init_options = { documentFormatting = true },
		filetypes = {
			"css",
			"html",
			"javascript",
			"javascriptreact",
			"markdown",
			"scss",
			"typescript",
			"typescriptreact",
			"vimwiki",
			"yaml",
			"yaml.docker-compose",
		},
		root_dir = function(fname)
			return require("lspconfig/util").root_pattern(".git")(fname) or vim.fn.getcwd()
		end,
		settings = {
			lintDebounce = 500000000,
			rootMarkers = {
				".git",
				".git/",
				"node_modules/",
				"tsconfig.json",
				"jsconfig.json",
			},
			languages = {
				["="] = {},
				css = { rustywind, prettierd },
				html = { rustywind, prettierd },
				javascript = { prettierd, eslint },
				javascriptreact = { rustywind, prettierd, eslint },
				markdown = { prettier, markdownlint, write_good },
				scss = { rustywind, prettierd },
				typescript = { prettierd, eslint },
				typescriptreact = { rustywind, prettierd, eslint },
				vimwiki = { prettier, markdownlint, write_good },
				yaml = { prettier },
				["yaml.docker-compose"] = { prettier },
			},
		},
	},
	go = {},
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
	rust = {},
	terraform = {},
}
