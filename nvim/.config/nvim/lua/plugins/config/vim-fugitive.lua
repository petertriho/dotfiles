return {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
    config = function()
        vim.api.nvim_set_keymap("n", "[g", "<CMD>diffget //2<CR>", { silent = true, noremap = true })
        vim.api.nvim_set_keymap("n", "]g", "<CMD>diffget //3<CR>", { silent = true, noremap = true })
    end,
}
