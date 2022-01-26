return {
    "kevinhwang91/nvim-hlslens",
    module = "hlslens",
    keys = "/",
    config = function()
        require("scrollbar.handlers.search").setup()
    end,
}
