return {
    "rmagatti/goto-preview",
    keys = { "gpd", "gpi", "gpr", "gP" },
    config = function()
        require("goto-preview").setup({
            width = 120,
            height = 30,
            default_mappings = true,
            border = { "↖", "─", "╮", "│", "╯", "─", "╰", "│" },
        })
    end,
}
