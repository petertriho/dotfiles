return {
    "petertriho/nvim-scrollbar",
    config = function()
        local colors = require("colors")

        require("scrollbar").setup({
            marks = {
                Search = { color = colors.orange },
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
