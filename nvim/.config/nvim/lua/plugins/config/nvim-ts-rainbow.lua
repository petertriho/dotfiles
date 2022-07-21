return {
    "p00f/nvim-ts-rainbow",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        local colors = require("colors")

        require("nvim-treesitter.configs").setup({
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = 1000,
                colors = {
                    colors.red,
                    colors.green,
                    colors.blue,
                    colors.yellow,
                    colors.cyan,
                    colors.magenta,
                    colors.orange,
                },
            },
        })
    end,
}
