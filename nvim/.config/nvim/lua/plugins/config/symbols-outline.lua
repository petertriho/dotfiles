return {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    setup = function()
        vim.g.symbols_outline = {
            auto_preview = false,
            position = "right",
        }
    end,
}
