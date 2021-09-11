require("grammar-guard").init()

local null_ls = require("null-ls")
null_ls.config({
	sources = {
		null_ls.builtins.flake8,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.stylua,
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
	-- prismals = {}
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
	tsserver = {},
	yamlls = {
		filetypes = { "yaml", "yaml.docker-compose" },
	},
}
