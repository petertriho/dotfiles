return {
    "jinh0/eyeliner.nvim",
    config = function()
        local colors = require("colors")
        local utils = require("eyeliner.utils")

        local function enable_highlights()
            vim.api.nvim_set_hl(0, "EyelinerPrimary", {
                fg = colors.blue,
                bold = true,
                underline = true,
            })
            vim.api.nvim_set_hl(0, "EyelinerSecondary", {
                fg = colors.red,
                underline = true,
            })
            vim.api.nvim_set_hl(0, "EyelinerDimmed", { link = "Comment" })
            return utils["set-autocmd"]("ColorScheme", {
                callback = enable_highlights,
                group = "Eyeliner",
            })
        end

        require("eyeliner.shared")["enable-highlights"] = enable_highlights

        require("eyeliner").setup({
            highlight_on_key = false,
            match = "[a-z]",
        })
    end,
}
