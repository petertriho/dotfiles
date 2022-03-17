return {
    "rmagatti/goto-preview",
    keys = {
        { "n", "gpd" },
        { "n", "gpi" },
        { "n", "gpr" },
        { "n", "gP" },
    },
    config = function()
        require("goto-preview").setup({
            width = 120,
            height = 30,
            default_mappings = true,
            border = { "↖", "─", "╮", "│", "╯", "─", "╰", "│" },
        })
    end,
}
