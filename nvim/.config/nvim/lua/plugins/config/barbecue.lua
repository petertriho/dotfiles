return {
    "utilyre/barbecue.nvim",
    requires = {
        "SmiteshP/nvim-navic",
    },
    config = function()
        require("barbecue").setup({
            attach_navic = false,
            create_autocmd = false,
            exclude_filetypes = require("filetypes").excludes,
            modifiers = {
                dirname = ":s?.*??",
            },
        })

        vim.api.nvim_create_autocmd({
            "WinScrolled",
            "BufWinEnter",
            "CursorHold",
            "InsertLeave",
        }, {
            group = vim.api.nvim_create_augroup("barbecue", {}),
            callback = function()
                require("barbecue.ui").update()
            end,
        })
    end,
}
