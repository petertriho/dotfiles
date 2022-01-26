return {
    "arthurxavierx/vim-caser",
    keys = "cm",
    setup = function()
        vim.g.caser_prefix = "cm"

        require("which-key").register({
            name = "caser",
            [" "] = "space case",
            ["-"] = "dash-case",
            ["."] = "dot.case",
            ["_"] = "snake_case",
            c = "camelCase",
            k = "kebab-case",
            K = "Title-Kebab-Case",
            m = "MixedCase",
            p = "PascalCase",
            s = "Sentence case",
            t = "Title Case",
            u = "SNAKE_UPPERCASE",
            U = "SNAKE_UPPERCASE",
        }, {
            prefix = "cm",
            mode = "n",
        })
    end,
}
