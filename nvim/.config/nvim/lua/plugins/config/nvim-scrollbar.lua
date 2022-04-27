return {
    "petertriho/nvim-scrollbar",
    config = function()
        local colors = require("colors")

        require("scrollbar").setup({
            folds = false,
            marks = {
                Search = { color = colors.orange },
            },
            excluded_filetypes = require("filetypes").excludes,
        })
    end,
}
