return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["a/"] = "@comment.outer",
                        ["ac"] = "@conditional.outer",
                        ["ic"] = "@conditional.inner",
                        ["aC"] = "@class.outer",
                        ["iC"] = "@class.inner",
                        ["ae"] = "@block.outer",
                        ["ie"] = "@block.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["aL"] = "@loop.outer",
                        ["iL"] = "@loop.inner",
                        ["aP"] = "@parameter.outer",
                        ["iP"] = "@parameter.inner",
                        ["ar"] = "@call.outer",
                        ["ir"] = "@call.inner",
                        ["aS"] = "@statement.outer",
                        ["iS"] = "@statement.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
            },
        })
    end,
}
