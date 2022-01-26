return {
    "petertriho/nvim-scrollbar",
    config = function()
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
    end,
}
