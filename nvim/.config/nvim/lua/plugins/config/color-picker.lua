return {
    "ziontee113/color-picker.nvim",
    cmd = {
        "PickColor",
        "PickColorInsert",
    },
    setup = function()
        local set_keymap = vim.keymap.set
        local opts = { noremap = true, silent = true }

        set_keymap("n", "<C-c>", "<CMD>PickColor<CR>", opts)
        set_keymap("i", "<C-c>", "<CMD>PickColorInsert<CR>", opts)
    end,
    config = function()
        require("color-picker").setup()
    end,
}
