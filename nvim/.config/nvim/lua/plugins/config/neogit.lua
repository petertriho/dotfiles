return {
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    cmd = "Neogit",
    module = "neogit",
    config = function()
        require("neogit").setup({
            disable_commit_confirmation = true,
            integrations = { diffview = true },
        })
    end,
}
