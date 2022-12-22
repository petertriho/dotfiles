return {
    "utilyre/barbecue.nvim",
    requires = {
        "SmiteshP/nvim-navic",
    },
    config = function()
        require("barbecue").setup({
            create_autocmd = false,
            attach_navic = false,
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
