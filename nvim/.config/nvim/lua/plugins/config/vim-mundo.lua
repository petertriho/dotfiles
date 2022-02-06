return {
    "simnalamburt/vim-mundo",
    cmd = "MundoToggle",
    config = function()
        vim.cmd("doautocmd User SetPython3HostProg")
    end,
}
