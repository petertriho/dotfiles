return {
    "windwp/nvim-autopairs",
    requires = "nvim-treesitter/nvim-treesitter",
    after = { "nvim-treesitter", "nvim-cmp" },
    config = function()
        require("nvim-treesitter.configs").setup({ autopairs = { enable = true } })

        local autopairs = require("nvim-autopairs")
        autopairs.setup()

        local Rule = require("nvim-autopairs.rule")
        autopairs.add_rules({
            Rule("%(.*%)%s*%=$", "> {}", { "typescript", "typescriptreact", "javascript", "javascriptreact" })
                :use_regex(true)
                :set_end_pair_length(1),
        })
    end,
}
