local signs = {
	Error = " ",
	Warning = " ",
	Hint = " ",
	Information = " ",
}

for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- folke/tokyonight.nvim
vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "Mundo", "MundoDiff", "DiffViewFiles", "dbui" }
vim.g.tokyonight_colors = { bg_sidebar = "#16161e", bg_float = "#16161e" }
vim.cmd("colorscheme tokyonight")

-- akinsho/nvim-bufferline.lua
require("bufferline").setup({
	options = {
		numbers = "ordinal",
		number_style = "",
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "EXPLORER",
				highlight = "Directory",
				text_align = "center",
			},
			{
				filetype = "Mundo",
				text = "UNDOTREE",
				highlight = "Directory",
				text_align = "center",
			},
			{
				filetype = "dbui",
				text = "DATABASE",
				highlight = "Directory",
				text_align = "center",
			},
		},
		custom_filter = function(buf_number)
			if vim.bo[buf_number].filetype ~= "fugitive" and vim.bo[buf_number].filetype ~= "NeogitStatus" then
				return true
			end
		end,
	},
})

local colors = require("tokyonight.colors").setup()

-- famiu/feline.nvim
local vi_mode_colors = {
	NORMAL = "blue",
	OP = "blue",
	INSERT = "green",
	VISUAL = "magenta",
	BLOCK = "magenta",
	REPLACE = "red",
	["V-REPLACE"] = "red",
	ENTER = "blue",
	MORE = "blue",
	SELECT = "magenta",
	COMMAND = "yellow",
	SHELL = "blue",
	TERM = "blue",
	NONE = "orange",
}

local feline_providers = require("feline.providers")
local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

feline_providers.add_provider("file_name", function(component)
	local filename = vim.fn.expand("%:t")
	local modified_str = ""

	if vim.bo.modified then
		local modified_icon = component.file_modified_icon or "●"
		modified_str = modified_icon .. " "
	end

	if filename == "" then
		filename = "unnamed"
	end

	return filename .. " " .. modified_str
end)

feline_providers.add_provider("file_type2", function(component)
	local extension = vim.fn.expand("%:e")

	local icon = component.icon or require("nvim-web-devicons").get_icon("", extension, { default = true })
	return icon .. " " .. vim.bo.filetype:upper()
end)

feline_providers.add_provider("winnr", function()
	return tostring(vim.fn.winnr())
end)

feline_providers.add_provider("lsp_progress", function()
	return require("lsp-status").status_progress()
end)

local properties = {
	force_inactive = {
		filetypes = {
			"NvimTree",
			"Mundo",
			"MundoDiff",
			"packer",
			"fugitive",
			"fugitiveblame",
			"NeogitStatus",
			"DiffviewFiles",
			"dbui",
		},
		buftypes = { "terminal" },
		bufnames = {},
	},
}

local components = {
	left = { active = {}, inactive = {} },
	mid = { active = {}, inactive = {} },
	right = { active = {}, inactive = {} },
}

components.left.active = {
	{
		provider = vi_mode_utils.get_vim_mode,
		hl = function()
			return {
				fg = "black",
				bg = vi_mode_utils.get_mode_color(),
				style = "bold",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	{
		provider = "",
		hl = function()
			return { fg = vi_mode_utils.get_mode_color(), bg = "fg_gutter" }
		end,
	},
	{
		provider = "file_name",
		hl = function()
			return {
				fg = vi_mode_utils.get_mode_color(),
				bg = "fg_gutter",
				style = "bold",
			}
		end,
		left_sep = "block",
		right_sep = "right_filled",
	},
	{
		provider = "git_branch",
		icon = " ",
		enabled = function()
			return vim.b.gitsigns_status_dict
		end,
		left_sep = " ",
		right_sep = { " ", "right" },
	},
	{
		provider = "git_diff_added",
		icon = " +",
		hl = { fg = "teal", style = "bold" },
	},
	{
		provider = "git_diff_changed",
		icon = " ~",
		hl = { fg = "blue", style = "bold" },
	},
	{
		provider = "git_diff_removed",
		icon = " -",
		hl = { fg = "red", style = "bold" },
		right_sep = "block",
	},
}

components.left.inactive = {
	{
		provider = "file_name",
		hl = { fg = "bg_statusline", bg = "fg_sidebar" },
		left_sep = "block",
		right_sep = "right_filled",
	},
}

components.right.active = {
	{ provider = "lsp_progress", left_sep = " ", right_sep = " " },
	{
		provider = "diagnostic_info",
		enabled = function()
			return lsp.diagnostics_exist("Information")
		end,
		icon = "  ",
		hl = { fg = "info" },
	},
	{
		provider = "diagnostic_hints",
		enabled = function()
			return lsp.diagnostics_exist("Hint")
		end,
		icon = "  ",
		hl = { fg = "hint" },
	},
	{
		provider = "diagnostic_warnings",
		enabled = function()
			return lsp.diagnostics_exist("Warning")
		end,
		icon = "  ",
		hl = { fg = "warning" },
	},
	{
		provider = "diagnostic_errors",
		enabled = function()
			return lsp.diagnostics_exist("Error")
		end,
		icon = "  ",
		hl = { fg = "error" },
	},
	{ provider = "lsp_client_names", left_sep = " ", right_sep = " " },
	{
		provider = "file_type2",
		enabled = function()
			return vim.bo.filetype ~= ""
		end,
		left_sep = { "left", " " },
		right_sep = " ",
	},
	{
		provider = "position",
		hl = function()
			return {
				fg = vi_mode_utils.get_mode_color(),
				bg = "fg_gutter",
				style = "bold",
			}
		end,
		left_sep = "left_filled",
	},
	{
		provider = "",
		hl = function()
			return { fg = vi_mode_utils.get_mode_color(), bg = "fg_gutter" }
		end,
	},
	{
		provider = "line_percentage",
		hl = function()
			return {
				fg = "black",
				bg = vi_mode_utils.get_mode_color(),
				style = "bold",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	{
		provider = "scroll_bar",
		hl = function()
			return {
				fg = vi_mode_utils.get_mode_color(),
				bg = "black",
				style = "bold",
			}
		end,
	},
}

components.right.inactive = {
	{ provider = "winnr", left_sep = " ", right_sep = " " },
}

require("feline").setup({
	default_fg = colors.fg_sidebar,
	default_bg = colors.bg_statusline,
	colors = colors,
	vi_mode_colors = vi_mode_colors,
	components = components,
	properties = properties,
})
