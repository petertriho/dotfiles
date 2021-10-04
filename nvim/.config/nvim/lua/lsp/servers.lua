require("grammar-guard").init()

local null_ls = require("null-ls")
null_ls.config({
	sources = {
		-- dockerfile
		null_ls.builtins.diagnostics.hadolint,
		-- lua
		null_ls.builtins.formatting.stylua,
		-- python
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.black,
		-- shell
		null_ls.builtins.diagnostics.shellcheck,
		-- null_ls.builtins.formatting.shellharden,
		null_ls.builtins.formatting.shfmt.with({
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
