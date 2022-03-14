return {
    "rlch/github-notifications.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("github-notifications").setup({
            cache = true,
            mappings = {
                hide = "h",
                mark_all_read = "a",
                mark_read = "r",
                open_in_browser = "o",
            },
            prompt_mappings = {
                hide = "<C-h>",
                mark_all_read = "<C-a>",
                mark_read = "<C-r>",
                open_in_browser = "<C-o>",
            },
        })
    end,
}
