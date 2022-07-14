return {
    "nvim-neotest/neotest",
    requires = {
        "nvim-treesitter/nvim-treesitter",
        { "nvim-neotest/neotest-python", module = "neotest" },
        { "haydenmeade/neotest-jest", module = "neotest" },
        { "nvim-neotest/neotest-vim-test", module = "neotest" },
        { "vim-test/vim-test", module = "neotest" },
    },
    module = "neotest",
    setup = function()
        local set_keymap = vim.keymap.set

        set_keymap("n", "]t", function()
            require("neotest").jump.next("Next test")
        end, { desc = "Next test" })
        set_keymap("n", "[t", function()
            require("neotest").jump.prev("Previous test")
        end, { desc = "Previous Test" })
    end,
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-jest"),
                require("neotest-python"),
                require("neotest-vim-test")({ ignore_file_types = { "python", "js", "ts" } }),
            },
        })
    end,
}
