return {
    "rcarriga/vim-ultest",
    requires = { "vim-test/vim-test" },
    run = ":UpdateRemotePlugins",
    setup = function()
        vim.g.ultest_output_on_run = 0
        vim.g.ultest_output_on_line = 0
        vim.g.ultest_running_sign = "●"
        vim.g.ultest_pass_text = "✔"
        vim.g.ultest_fail_text = "✖"
        vim.g.ultest_running_text = "●"
    end,
    config = function()
        vim.cmd("doautocmd User SetPython3HostProg")
    end,
}
