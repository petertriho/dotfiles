return {
    "github/copilot.vim",
    setup = function()
        vim.g.copilot_filetypes = {
            TelescopePrompt = false,
        }
        vim.g.copilot_no_tab_map = true
        vim.cmd("highlight CopilotSuggestion guifg=#565f89")
        vim.api.nvim_set_keymap(
            "i",
            "<C-c>",
            "copilot#Accept('<C-c>')",
            { script = true, silent = true, nowait = true, expr = true }
        )
    end,
}
