require("grammar-guard").init()

local null_ls = require("null-ls")

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local DIAGNOSTICS = methods.internal.DIAGNOSTICS
local FORMATTING = methods.internal.FORMATTING

local sources_diagnostics = {
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

local b = require("null-ls.builtins")

null_ls.config({
	sources = {
		-- dockerfile
		b.diagnostics.hadolint,
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
