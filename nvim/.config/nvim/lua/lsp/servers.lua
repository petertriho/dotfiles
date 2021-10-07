require("grammar-guard").init()

local null_ls = require("null-ls")

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local DIAGNOSTICS = methods.internal.DIAGNOSTICS

local diagnostic_sources = {
	dotenv = h.make_builtin({
		method = DIAGNOSTICS,
		filetypes = { "conf" },
		generator_opts = {
			command = "dotenv-linter",
			args = {
				"$FILENAME",
			},
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
					col = 0,
					end_col = #line - 1,
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
					col = 0,
					end_col = #line - 1,
					source = "fish",
					message = message,
					severity = 1,
				}
			end,
		},
		factory = h.generator_factory,
	}),
}

null_ls.config({
	sources = {
		-- conf
		diagnostic_sources.dotenv,
		-- dockerfile
		null_ls.builtins.diagnostics.hadolint,
		-- fish
		diagnostic_sources.fish,
		null_ls.builtins.formatting.fish_indent,
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
