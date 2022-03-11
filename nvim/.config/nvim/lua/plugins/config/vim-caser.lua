return {
    "arthurxavierx/vim-caser",
    keys = { { "n", "cC" } },
    setup = function()
        vim.g.caser_prefix = "cC"

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
            prefix = "cC",
            mode = "n",
        })
    end,
}
