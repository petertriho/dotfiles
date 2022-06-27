return {
    "nvim-neotest/neotest",
    requires = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-python",
        "haydenmeade/neotest-jest",
        "nvim-neotest/neotest-vim-test",
        "vim-test/vim-test",
    },
    setup = function()
        vim.keymap.set("n", "]t", function()
            require("neotest").jump.next("Next test")
        end, {})
        vim.keymap.set("n", "[t", function()
            require("neotest").jump.prev("Previous test")
        end, {})
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
