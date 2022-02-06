return {
    "simnalamburt/vim-mundo",
    cmd = "MundoToggle",
    config = function()
        vim.cmd("doautocmd User PythonHostProg")
    end,
}
