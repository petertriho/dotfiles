return {
    "mizlan/iswap.nvim",
    requires = "nvim-treesitter/nvim-treesitter",
    cmd = "ISwap",
    config = function()
        require("iswap").setup({
            hl_snipe = "ErrorMsg",
        })
    end,
}
