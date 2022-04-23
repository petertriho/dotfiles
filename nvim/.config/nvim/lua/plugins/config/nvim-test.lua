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
        require("nvim-test").setup()
    end,
}
