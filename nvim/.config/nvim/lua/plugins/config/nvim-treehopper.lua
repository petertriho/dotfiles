return {
    "mfussenegger/nvim-treehopper",
    setup = function()
        local set_keymap = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        set_keymap("o", "z", ":<C-U>lua require('tsht').nodes()<CR>", { silent = true })
        set_keymap("x", "z", ":lua require('tsht').nodes()<CR>", opts)
    end,
}
