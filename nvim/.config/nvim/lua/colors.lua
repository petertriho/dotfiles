local colors = require("tokyonight.colors").setup(require("tokyonight.config"))

colors = vim.tbl_extend("force", colors, {
    fg = colors.fg_sidebar,
    bg = colors.bg_statusline,
})

return colors
