require("grammar-guard").init()

local null_ls = require("null-ls")
local b = require("null-ls.builtins")

null_ls.config({
	sources = {
		-- dockerfile
		b.diagnostics.hadolint,
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
