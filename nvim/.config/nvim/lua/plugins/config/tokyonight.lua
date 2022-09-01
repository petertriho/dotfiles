return {
    "folke/tokyonight.nvim",
    config = function()
        vim.g.tokyonight_style = "night"
        vim.g.tokyonight_sidebars = require("filetypes").sidebars
        vim.g.tokyonight_colors = {
            border_highlight = "#565f89",
        }
        vim.cmd("colorscheme tokyonight")

        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = nil })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = nil })

        local colors = require("colors")

        vim.api.nvim_set_hl(0, "Folded", { fg = colors.comment, bg = nil })

        vim.api.nvim_set_hl(0, "QuickScopePrimary", { fg = colors.blue, underline = true })
        vim.api.nvim_set_hl(0, "QuickScopeSecondary", { fg = colors.red, underline = true })

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
