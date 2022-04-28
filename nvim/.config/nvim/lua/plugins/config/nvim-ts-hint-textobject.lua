return {
    "mfussenegger/nvim-ts-hint-textobject",
    setup = function()
        local set_keymap = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        set_keymap("o", "m", ":<C-U>lua require('tsht').nodes()<CR>", { silent = true })
        set_keymap("v", "m", ":lua require('tsht').nodes()<CR>", opts)
    end,
}
