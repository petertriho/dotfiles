return {
    "pwntester/octo.nvim",
    requires = {
        "kyazdani42/nvim-web-devicons",
        "nvim-telescope/telescope.nvim",
    },
    cmd = "Octo",
    config = function()
        require("octo").setup()
    end,
}
