return {
    "princejoogie/dir-telescope.nvim",
    after = { "telescope.nvim" },
    config = function()
        require("dir-telescope").setup({
            hidden = true,
            no_ignore = false,
            show_preview = true,
        })

        require("telescope").load_extension("dir")
    end,
}
