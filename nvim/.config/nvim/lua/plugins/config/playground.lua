return {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
    config = function()
        require("nvim-treesitter.configs").setup({
            playground = {
                enable = true,
            },
        })
    end,
}
