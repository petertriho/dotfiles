return {
    "lukas-reineke/indent-blankline.nvim",
    opt = true,
    config = function()
        require("indent_blankline").setup({
            use_treesitter = true,
            show_first_indent_level = false,
            char = "│",
            show_current_context = true,
            filetype_exclude = require("filetypes").excludes,
        })
    end,
}
