return {
    "petertriho/vim-abolish",
    cmd = { "Subvert", "S" },
    keys = { { "n", "cr" } },
    setup = function()
        require("which-key").register({
            name = "coerce",
            [" "] = "space case",
            ["-"] = "dash-case",
            ["."] = "dot.case",
            ["_"] = "snake_case",
            c = "camelCase",
            k = "kebab-case",
            m = "MixedCase",
            s = "snake_case",
            t = "Title Case",
            u = "SNAKE_UPPERCASE",
            U = "SNAKE_UPPERCASE",
        }, {
            prefix = "cr",
            mode = "n",
        })
    end,
}
