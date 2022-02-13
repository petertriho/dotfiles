return {
    "mfussenegger/nvim-ts-hint-textobject",
    setup = function()
        local set_keymap = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        set_keymap("o", "H", ":<C-U>lua require('tsht').nodes()<CR>", { silent = true })
        set_keymap("v", "H", ":lua require('tsht').nodes()<CR>", opts)
    end,
}
