return {
    "rcarriga/vim-ultest",
    requires = { "vim-test/vim-test" },
    run = ":UpdateRemotePlugins",
    cmd = {
        "UltestAttach",
        "UltestClear",
        "UltestDebug",
        "UltestLast",
        "UltestNearest",
        "UltestOutput",
        "Ultest",
        "UltestStop",
        "UltestSummary",
    },
    opt = true,
    setup = function()
        vim.g.ultest_output_on_run = 0
        vim.g.ultest_output_on_line = 0
        vim.g.ultest_virtual_text = 1
        vim.g.ultest_running_sign = "●"
        vim.g.ultest_pass_text = "✔"
        vim.g.ultest_fail_text = "✖"
        vim.g.ultest_running_text = "●"
    end,
}
