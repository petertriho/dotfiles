return {
    "luochen1990/rainbow",
    opt = true,
    setup = function()
        local colors = require("colors")

        vim.g.rainbow_active = 1

        local rainbow_conf = {
            guifgs = {
                colors.red,
                colors.green,
                colors.yellow,
                colors.blue,
                colors.magenta,
                colors.cyan,
            },
            separately = {},
        }

        local filetypes = require("filetypes")

        for _, filetype_type in pairs(filetypes) do
            if filetype_type ~= "sidebars" then
                for _, filetype in ipairs(filetype_type) do
                    rainbow_conf.separately[filetype] = 0
                end
            end
        end

        vim.g.rainbow_conf = rainbow_conf
    end,
}
