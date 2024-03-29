return {
    "Darazaki/indent-o-matic",
    config = function()
        require("indent-o-matic").setup({
            max_lines = 128,
            standard_widths = { 2, 4 },
            filetype_markdown = {
                max_lines = 0,
            },
            filetype_vimwiki = {
                max_lines = 0,
            },
        })
    end,
}
