local signs = {
	Error = " ",
	Warn = " ",
	Info = " ",
	Hint = " ",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
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
		numbers = function(opts)
			return string.format("%s.", opts.ordinal)
		end,
		close_command = "Bwipeout! %d",
		right_mouse_command = "Bwipeout! %d",
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
colors = vim.tbl_extend("force", colors, {
	fg = colors.none,
	bg = colors.bg_statusline,
})

-- famiu/feline.nvim
local vi_mode_colors = {
	NORMAL = "blue",
	OP = "blue",
	INSERT = "green",
	VISUAL = "magenta",
	BLOCK = "magenta",
	LINES = "magenta",
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

feline_providers.add_provider("file_type_2", function(component, winid)
	local bufnr = vim.api.nvim_win_get_buf(winid)
	local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
	local extension = vim.fn.fnamemodify(filename, ":e")
	local filetype = vim.bo[bufnr].filetype:upper()

	local icon_str, icon_hlname = require("nvim-web-devicons").get_icon(filename, extension, { default = true })

	local icon = { str = icon_str }

	if component.colored_icon == nil or component.colored_icon then
		local fg = vim.api.nvim_get_hl_by_name(icon_hlname, true).foreground

		if fg then
			icon.hl = { fg = string.format("#%06x", fg) }
		end
	end
	return " " .. filetype, icon
end)

feline_providers.add_provider("position_2", function(_, winid)
	return string.format(" %d:%d", unpack(vim.api.nvim_win_get_cursor(winid)))
end)

feline_providers.add_provider("file_stats", function(_, winid)
	local bufnr = vim.api.nvim_win_get_buf(winid)

	local lines = vim.api.nvim_buf_line_count(bufnr)
	local tab = vim.api.nvim_buf_get_option(bufnr, "shiftwidth")
	local file_enc = (vim.bo[bufnr].fenc ~= "" and vim.bo[bufnr].fenc) or vim.o.enc
	local file_format = vim.bo[bufnr].fileformat

	return string.format("%s  %s   %d   %d", file_enc:upper(), file_format:upper(), tab, lines)
end)

feline_providers.add_provider("lsp_client_count", function(component, winid)
	local count = 0
	local icon = component.icon or " "

	for _ in pairs(vim.lsp.buf_get_clients(vim.api.nvim_win_get_buf(winid))) do
		count = count + 1
	end

	return icon .. "LSP:" .. count
end)

local components = {
	active = { {}, {} },
	inactive = { {}, {} },
}

components.active[1] = {
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
		provider = "file_info",
		icon = "",
		file_readonly_icon = " ",
		hl = function()
			return {
				fg = vi_mode_utils.get_mode_color(),
				bg = "fg_gutter",
				style = "bold",
			}
		end,
		right_sep = "right_filled",
	},
	{
		provider = "git_branch",
		icon = " ",
		enabled = function()
			return vim.b.gitsigns_status_dict
		end,
		left_sep = " ",
		right_sep = { " ", { str = "right", hl = {
			fg = "NONE",
			bg = "bg",
		} } },
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

components.active[2] = {
	{
		provider = function()
			return require("package-info").get_status()
		end,
		enabled = function()
			return package.loaded["package-info"] ~= nil
		end,
	},
	{
		provider = function()
			return require("lsp-status").status_progress()
		end,
		left_sep = " ",
	},
	{
		provider = function()
			return require("nvim-gps").get_location()
		end,
		enabled = function()
			return package.loaded["nvim-treesitter"] ~= nil and require("nvim-gps").is_available()
		end,
		left_sep = " ",
	},
	{
		provider = "position_2",
		left_sep = " ",
	},
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
	{ provider = "lsp_client_count", left_sep = " ", right_sep = " " },
	{
		provider = "file_type_2",
		enabled = function()
			return vim.bo.filetype ~= ""
		end,
		left_sep = { { str = "left", hl = {
			fg = "NONE",
			bg = "bg",
		} }, " " },
		right_sep = " ",
	},
	{
		provider = "file_stats",
		hl = function()
			return {
				fg = vi_mode_utils.get_mode_color(),
				bg = "fg_gutter",
				style = "bold",
			}
		end,
		left_sep = { "left_filled", "block" },
		right_sep = "block",
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

components.inactive[1] = {
	{
		provider = "file_info",
		icon = "",
		file_readonly_icon = " ",
		hl = { fg = "bg_statusline", bg = "fg_sidebar" },
		right_sep = "right_filled",
	},
}

components.inactive[2] = {
	{
		provider = function(_, winid)
			return tostring(vim.fn.win_id2win(winid))
		end,
		left_sep = " ",
		right_sep = " ",
	},
}

require("feline").setup({
	colors = colors,
	vi_mode_colors = vi_mode_colors,
	components = components,
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
		buftypes = {},
		bufnames = {},
	},
	disable = {
		filetypes = {},
		buftypes = { "terminal" },
		bufnames = {},
	},
})
