return {
    "mvllow/modes.nvim",
    config = function()
        local colors = require("colors")

        require("modes").setup({
            colors = {
                copy = colors.yellow,
                delete = colors.red,
                insert = colors.green,
                visual = colors.magenta,
            },
        })
    end,
}
