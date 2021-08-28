return {
	bashls = {},
	cssls = {},
	dockerls = {},
	graphql = {},
	html = {},
	jsonls = {
		init_options = {
			provideFormatter = false,
		},
	},
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
