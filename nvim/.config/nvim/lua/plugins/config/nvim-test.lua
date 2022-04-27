return {
    "klen/nvim-test",
    cmd = {
        "TestSuite",
        "TestFile",
        "TestEdit",
        "TestNearest",
        "TestLast",
        "TestVisit",
        "TestInfo",
    },
    config = function()
        require("nvim-test").setup({})
        require("nvim-test.runners.pytest"):setup({
            args = { "-sv" },
        })
    end,
}
