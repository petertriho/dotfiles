return {
    "mvllow/modes.nvim",
    after = "tokyonight.nvim",
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
