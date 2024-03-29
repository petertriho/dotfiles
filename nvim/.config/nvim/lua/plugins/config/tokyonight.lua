return {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            style = "night",
            sidebars = require("filetypes").sidebars,
            on_colors = function(colors)
                colors.border_highlight = "#2d3149"
            end,
            on_highlights = function(hl, colors)
                hl.ConflictMarkerBegin = { bg = colors.diff.add }
                hl.ConflictMarkerOurs = { bg = colors.diff.add }
                hl.ConflictMarkerCommonAncestors = { bg = colors.diff.delete }
                hl.ConflictMarkerCommonAncestorsHunk = { bg = colors.diff.delete }
                hl.ConflictMarkerSeparator = { bg = colors.diff.change }
                hl.ConflictMarkerTheirs = { bg = colors.diff.change }
                hl.ConflictMarkerEnd = { bg = colors.diff.change }

                hl.EyelinerPrimary = { fg = colors.blue, style = "underline" }
                hl.EyelinerSecondary = { fg = colors.red, style = "underline" }

                hl.Folded = { fg = colors.comment, bg = nil }

                hl.TelescopeNormal = {
                    bg = colors.bg_dark,
                    fg = colors.fg_dark,
                }
                hl.TelescopeBorder = {
                    bg = colors.bg_dark,
                    fg = colors.bg_dark,
                }
                hl.TelescopePromptNormal = {
                    bg = colors.border_highlight,
                }
                hl.TelescopePromptBorder = {
                    bg = colors.border_highlight,
                    fg = colors.border_highlight,
                }
                hl.TelescopePromptTitle = {
                    bg = colors.border_highlight,
                    fg = colors.fg_dark,
                }
                hl.TelescopePreviewTitle = {
                    bg = colors.border_highlight,
                    fg = colors.fg_dark,
                }
                hl.TelescopeResultsTitle = {
                    bg = colors.border_highlight,
                    fg = colors.fg_dark,
                }
            end,
        })

        vim.cmd("colorscheme tokyonight")

        vim.fn.sign_define("LightBulbSign", { text = "󰌶", texthl = "DiagnosticSignWarn" })

        local diagnostic_signs = {
            [vim.diagnostic.severity.ERROR] = { "Error", "󰅚 " },
            [vim.diagnostic.severity.WARN] = { "Warn", "󰀪 " },
            [vim.diagnostic.severity.INFO] = { "Info", " " },
            [vim.diagnostic.severity.HINT] = { "Hint", "󰌶 " },
        }

        for _, properties in pairs(diagnostic_signs) do
            local hl = "DiagnosticSign" .. properties[1]
            vim.fn.sign_define(hl, { text = properties[2], texthl = hl, numhl = "" })
        end
    end,
}
