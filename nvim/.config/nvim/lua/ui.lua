-- folke/tokyonight.nvim
vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = {
    "dbui",
    "DiffViewFiles",
    "Mundo",
    "MundoDiff",
    "Outline"
}
vim.g.tokyonight_colors = {
    border_highlight = "#565f89",
}
vim.cmd("colorscheme tokyonight")

local colors = require("colors")

require("scrollbar").setup({
    handle = {
        color = colors.bg_highlight,
    },
    marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
    },
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "dbui",
        "NvimTree",
        "lspinfo",
        "Mundo",
        "MundoDiff",
        "packer",
        "fugitive",
        "fugitiveblame",
        "NeogitStatus",
        "DiffViewFiles",
    },
})

vim.cmd("highlight QuickScopePrimary guifg=" .. colors.blue .. " gui=underline ctermfg=blue cterm=underline")
vim.cmd("highlight QuickScopeSecondary guifg=" .. colors.red .. " gui=underline ctermfg=red cterm=underline")
vim.cmd("highlight Folded guifg=" .. colors.comment .. " guibg=" .. colors.none)
vim.fn.sign_define("LightBulbSign", { text = "", texthl = "DiagnosticSignWarn" })

local diagnostic_signs = {
    [vim.diagnostic.severity.ERROR] = { "Error", " " },
    [vim.diagnostic.severity.WARN] = { "Warn", " " },
    [vim.diagnostic.severity.INFO] = { "Info", " " },
    [vim.diagnostic.severity.HINT] = { "Hint", " " },
}

for _, properties in pairs(diagnostic_signs) do
    local hl = "DiagnosticSign" .. properties[1]
    vim.fn.sign_define(hl, { text = properties[2], texthl = hl, numhl = "" })
end

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
                filetype = "dbui",
                text = "DATABASE",
                highlight = "Directory",
                text_align = "center",
            },
            {
                filetype = "DiffViewFiles",
                text = "DIFFVIEW",
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
                filetype = "NvimTree",
                text = "EXPLORER",
                highlight = "Directory",
                text_align = "center",
            },
            {
                filetype = "Outline",
                text = "OUTLINE",
                highlight = "Directory",
                text_align = "center",
            },
        },
        custom_filter = function(buf_number)
            if
                vim.bo[buf_number].filetype ~= "fugitive"
                and vim.bo[buf_number].filetype ~= "NeogitStatus"
                and vim.bo[buf_number].buftype ~= "terminal"
            then
                return true
            end
        end,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
        end,
    },
})

-- feline-nvim/feline.nvim
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

local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

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
        provider = { name = "file_info", opts = { type = "relative", file_readonly_icon = " " } },
        short_provider = { name = "file_info", opts = { type = "base-only", file_readonly_icon = " " } },
        icon = "",
        hl = function()
            return {
                fg = vi_mode_utils.get_mode_color(),
                bg = "fg_gutter",
                style = "bold",
            }
        end,
        right_sep = "right_filled",
        priority = 0,
    },
    {
        provider = "git_branch",
        icon = " ",
        enabled = function()
            return vim.b.gitsigns_status_dict
        end,
        left_sep = " ",
        right_sep = { " ", { str = "right", hl = {
            fg = "fg",
            bg = "bg",
        } } },
    },
    {
        provider = "git_diff_added",
        icon = " +",
        hl = { fg = "teal", style = "bold" },
        truncate_hide = true,
        priority = 3,
    },
    {
        provider = "git_diff_changed",
        icon = " ~",
        hl = { fg = "blue", style = "bold" },
        truncate_hide = true,
        priority = 3,
    },
    {
        provider = "git_diff_removed",
        icon = " -",
        hl = { fg = "red", style = "bold" },
        right_sep = "block",
        truncate_hide = true,
        priority = 3,
    },
    -- {
    --     provider = function()
    --         return require("nvim-gps").get_location()
    --     end,
    --     enabled = function()
    --         return package.loaded["nvim-treesitter"] ~= nil and require("nvim-gps").is_available()
    --     end,
    --     left_sep = " ",
    --     truncate_hide = true,
    --     priority = 4,
    -- },
}

components.active[2] = {
    {
        provider = function()
            return require("package-info").get_status()
        end,
        enabled = function()
            return package.loaded["package-info"] ~= nil
        end,
        truncate_hide = true,
        priority = 1,
    },
    {
        provider = function()
            return require("lsp-status").status_progress()
        end,
        enabled = function()
            return #vim.lsp.buf_get_clients(vim.api.nvim_get_current_buf())
        end,
        left_sep = " ",
        truncate_hide = true,
        priority = 1,
    },
    {
        provider = "position_2",
        left_sep = " ",
    },
    {
        provider = "diagnostic_info",
        enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
        end,
        icon = "  ",
        hl = { fg = "info" },
        truncate_hide = true,
        priority = 2,
    },
    {
        provider = "diagnostic_hints",
        enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
        end,
        icon = "  ",
        hl = { fg = "hint" },
        truncate_hide = true,
        priority = 2,
    },
    {
        provider = "diagnostic_warnings",
        enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
        end,
        icon = "  ",
        hl = { fg = "warning" },
        truncate_hide = true,
        priority = 2,
    },
    {
        provider = "diagnostic_errors",
        enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
        end,
        icon = "  ",
        hl = { fg = "error" },
        truncate_hide = true,
        priority = 2,
    },
    {
        provider = "lsp_client_count",
        left_sep = " ",
        truncate_hide = true,
        priority = 2,
    },
    {
        provider = "file_type_2",
        enabled = function()
            return vim.bo.filetype ~= ""
        end,
        left_sep = { " ", { str = "left", hl = {
            fg = "fg",
            bg = "bg",
        } }, " " },
    },
    {
        provider = "file_stats",
        short_provider = { name = "file_stats", opts = { short = true } },
        hl = function()
            return {
                fg = vi_mode_utils.get_mode_color(),
                bg = "fg_gutter",
                style = "bold",
            }
        end,
        left_sep = { " ", "left_filled", "block" },
        right_sep = "block",
        priority = 1,
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
    -- {
    --     provider = "scroll_bar",
    --     hl = function()
    --         return {
    --             fg = vi_mode_utils.get_mode_color(),
    --             bg = "black",
    --             style = "bold",
    --         }
    --     end,
    -- },
}

components.inactive[1] = {
    {
        provider = { name = "file_info", opts = { type = "relative", file_readonly_icon = " " } },
        short_provider = { name = "file_info", opts = { type = "base-only", file_readonly_icon = " " } },
        icon = "",
        hl = { fg = "bg_statusline", bg = "fg_sidebar" },
        right_sep = "right_filled",
    },
}

components.inactive[2] = {
    {
        provider = function()
            return tostring(vim.fn.win_id2win(vim.api.nvim_get_current_win()))
        end,
        left_sep = " ",
        right_sep = " ",
    },
}

require("feline").setup({
    theme = colors,
    vi_mode_colors = vi_mode_colors,
    components = components,
    force_inactive = {
        filetypes = {
            "^NvimTree$",
            "^packer$",
            "^fugitive$",
            "^fugitiveblame$",
            "^qf$",
            "^help$",
            "^dbui$",
            "^DiffviewFiles$",
            "^Mundo$",
            "^MundoDiff$",
            "^NeogitStatus$",
            "^Outline$",
            "^packer$",
        },
        buftypes = {},
        bufnames = {},
    },
    disable = {
        filetypes = {},
        buftypes = { "^terminal$" },
        bufnames = {},
    },
    custom_providers = {
        file_type_2 = function()
            local bufnr = vim.api.nvim_get_current_buf()
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
            local extension = vim.fn.fnamemodify(filename, ":e")
            local filetype = vim.bo[bufnr].filetype:upper()

            local icon_str, icon_hlname = require("nvim-web-devicons").get_icon(filename, extension, { default = true })

            local icon = { str = icon_str }

            local fg = vim.api.nvim_get_hl_by_name(icon_hlname, true).foreground

            if fg then
                icon.hl = { fg = string.format("#%06x", fg) }
            end
            return " " .. filetype, icon
        end,
        position_2 = function()
            return string.format(" %d:%d", unpack(vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())))
        end,
        file_stats = function(_, opts)
            local bufnr = vim.api.nvim_get_current_buf()
            local lines = vim.api.nvim_buf_line_count(bufnr)

            if opts.short == true then
                return string.format(" %d", lines)
            else
                local file_enc = (vim.bo[bufnr].fenc ~= "" and vim.bo[bufnr].fenc) or vim.o.enc
                local file_format = vim.bo[bufnr].fileformat

                local tab_style = vim.api.nvim_buf_get_option(bufnr, "expandtab") and "●" or ""
                local tab = vim.api.nvim_buf_get_option(bufnr, "shiftwidth")

                return string.format(
                    "%s  %s  %s %d   %d",
                    file_enc:upper(),
                    file_format:upper(),
                    tab_style,
                    tab,
                    lines
                )
            end
        end,
        lsp_client_count = function()
            return " " .. "LSP:" .. #vim.lsp.buf_get_clients(vim.api.nvim_get_current_buf())
        end,
    },
})
