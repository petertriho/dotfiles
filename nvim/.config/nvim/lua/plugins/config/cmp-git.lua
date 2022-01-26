return {
    "petertriho/cmp-git",
    after = "nvim-cmp",
    config = function()
        require("cmp_git").setup()
    end,
}
