return {
    "EtiamNullam/deferred-clipboard.nvim",
    config = function()
        require("deferred-clipboard").setup({
            fallback = "unnamedplus",
            lazy = true,
        })
    end,
}
