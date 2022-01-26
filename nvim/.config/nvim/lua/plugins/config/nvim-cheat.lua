return {
    "RishabhRD/nvim-cheat.sh",
    requires = "RishabhRD/popfix",
    cmd = {
        "Cheat",
        "CheatWithoutComments",
        "CheatList",
        "CheatListWithoutComments",
    },
    setup = function()
        vim.g.cheat_default_window_layout = "vertical_split"
    end,
}
