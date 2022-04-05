return {
    "simnalamburt/vim-mundo",
    cmd = "MundoToggle",
    config = function()
        vim.api.nvim_exec_autocmds("User", { pattern = "PythonHostProg" })
    end,
}
