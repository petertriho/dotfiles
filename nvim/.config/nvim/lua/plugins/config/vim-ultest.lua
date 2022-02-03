return {
    "rcarriga/vim-ultest",
    requires = { "vim-test/vim-test" },
    run = ":UpdateRemotePlugins",
    setup = function()
        vim.g.ultest_output_on_run = 0
        vim.g.ultest_output_on_line = 0
        vim.g.ultest_virtual_text = 1
    end
}
