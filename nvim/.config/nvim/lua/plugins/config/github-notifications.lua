return {
    "rlch/github-notifications.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("github-notifications").setup()
    end,
}
