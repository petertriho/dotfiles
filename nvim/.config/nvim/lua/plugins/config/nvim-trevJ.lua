return {
    "AckslD/nvim-trevJ.lua",
    module = "trevj",
    after = "nvim-treesitter",
    setup = function()
        vim.keymap.set("n", "gJ", function()
            require("trevj").format_at_cursor()
        end, {})
    end,
}
