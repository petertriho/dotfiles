return {
    "folke/tokyonight.nvim",
    config = function()
        vim.g.tokyonight_style = "night"
        vim.g.tokyonight_sidebars = {
            "dbui",
            "DiffViewFiles",
            "Mundo",
            "MundoDiff",
            "Outline",
            "UltestSummary"
        }
        vim.g.tokyonight_colors = {
            border_highlight = "#565f89",
        }
        vim.cmd("colorscheme tokyonight")

        vim.cmd("highlight TelescopeNormal guibg=none")
        vim.cmd("highlight TelescopeBorder guibg=none")

        local colors = require("colors")

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
    end,
}
