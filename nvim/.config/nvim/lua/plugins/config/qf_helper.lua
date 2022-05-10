return {
    "stevearc/qf_helper.nvim",
    cmd = {
        "QNext",
        "QPrev",
        "LLToggle",
        "QFToggle",
        "Keep",
        "Reject",
    },
    module = "qf_helper",
    ft = "qf",
    setup = function()
        local set_keymap = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        set_keymap("n", "<M-n>", "<CMD>QNext<CR>", opts)
        set_keymap("n", "<M-p>", "<CMD>QPrev<CR>", opts)
    end,
    config = function()
        require("qf_helper").setup({
            quickfix = {
                default_bindings = false,
                min_height = 10,
            },
            loclist = {
                default_bindings = false,
                min_height = 10,
            },
        })
    end,
}
