return {
    "HiPhish/nvim-ts-rainbow2",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        local colors = require("colors")

        require("nvim-treesitter.configs").setup({
            rainbow = {
                enable = true,
            },
        })
    end,
}
