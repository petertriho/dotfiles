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
	rustywind = h.make_builtin({
		method = FORMATTING,
		filetypes = { "css", "html", "javascriptreact", "typescriptreact", "scss" },
		generator_opts = {
			command = "rustywind",
			args = {
				"--stdin",
			},
			to_stdin = true,
		},
		factory = h.formatter_factory,
	}),
}

local b = require("null-ls.builtins")

null_ls.config({
	sources = {
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
		b.formatting.stylua,
		-- python
		b.diagnostics.flake8,
		b.formatting.isort,
		b.formatting.black,
		-- shell
		b.diagnostics.shellcheck,
		-- null_ls.builtins.formatting.shellharden,
		b.formatting.shfmt.with({
			extra_args = { "-s", "-i", "4", "-bn", "-ci", "-sr", "-kp" },
		}),
		-- web
		sources_formatting.rustywind,
		b.formatting.prettier.with({
			filetypes = { "markdown", "vimwiki", "yaml", "yaml.docker-compose" },
		}),
		b.formatting.prettierd,
		b.formatting.eslint_d,

		-- markdown/vimwiki
		b.diagnostics.markdownlint.with({
			filetypes = { "markdown", "vimwiki" },
			extra_args = {
				"--config",
				vim.fn.expand("$HOME/.config/format-lint/.markdownlint.jsonc"),
				"--stdin",
			},
		}),
		b.diagnostics.write_good.with({
			filetypes = { "markdown", "vimwiki" },
		}),
	},
})

return {
	bashls = {},
	cssls = {},
	dockerls = {},
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
	prismals = {},
	pyright = {},
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
	tsserver = {},
	yamlls = {
		filetypes = { "yaml", "yaml.docker-compose" },
	},
}
