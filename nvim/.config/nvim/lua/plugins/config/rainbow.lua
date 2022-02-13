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

        local languages = require("languages")

        for _, language_type in pairs(languages) do
            if language_type ~= "sidebars" then
                for _, language in ipairs(language_type) do
                    rainbow_conf.separately[language] = 0
                end
            end
        end

        vim.g.rainbow_conf = rainbow_conf
    end,
}
