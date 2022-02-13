return {
    "petertriho/nvim-scrollbar",
    config = function()
        local colors = require("colors")

        require("scrollbar").setup({
            marks = {
                Search = { color = colors.orange },
            },
            excluded_filetypes = require("languages").excludes
        })
    end,
}
