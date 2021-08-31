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
