return {
    "sindrets/winshift.nvim",
    cmd = "WinShift",
    config = function()
        require("winshift").setup({
            window_picker_ignore = {
                filetype = {
                    "dbui",
                    "DiffViewFiles",
                    "Mundo",
                    "MundoDiff",
                    "NvimTree",
                },
            },
        })
    end,
}
