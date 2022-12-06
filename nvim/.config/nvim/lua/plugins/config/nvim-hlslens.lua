return {
    "kevinhwang91/nvim-hlslens",
    module = "hlslens",
    keys = "/",
    setup = function()
        local set_keymap = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        set_keymap(
            "n",
            "n",
            "<CMD>execute('normal! ' . v:count1 . 'n')<CR><CMD>lua require('hlslens').start()<CR>",
            opts
        )
        set_keymap(
            "n",
            "N",
            "<CMD>execute('normal! ' . v:count1 . 'N')<CR><CMD>lua require('hlslens').start()<CR>",
            opts
        )
        set_keymap("n", "*", "*<CMD>lua require('hlslens').start()<CR>", opts)
        set_keymap("n", "#", "#<CMD>lua require('hlslens').start()<CR>", opts)
        set_keymap("n", "g*", "g*<CMD>lua require('hlslens').start()<CR>", opts)
        set_keymap("n", "g#", "g#<CMD>lua require('hlslens').start()<CR>", opts)
    end,
    config = function()
        require("scrollbar.handlers.search").setup({ enable_incsearch = false })
    end,
}
