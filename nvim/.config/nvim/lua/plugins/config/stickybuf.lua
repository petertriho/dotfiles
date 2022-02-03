return {
    "stevearc/stickybuf.nvim",
    config = function()
        require("stickybuf").setup({
            filetype = {
                dbui = "filetype",
                fugitive = "filetype",
                Outline = "filetype",
                UltestSummary = "filetype",
            },
        })
    end,
}
