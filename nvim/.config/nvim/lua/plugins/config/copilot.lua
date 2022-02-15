return {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
    setup = function()
        vim.g.copilot_filetypes = {
            TelescopePrompt = false,
        }
        vim.g.copilot_no_tab_map = true
        vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#565f89" })
        vim.api.nvim_set_keymap(
            "i",
            "<C-c>",
            "copilot#Accept('<C-c>')",
            { script = true, silent = true, nowait = true, expr = true }
        )
    end,
}
