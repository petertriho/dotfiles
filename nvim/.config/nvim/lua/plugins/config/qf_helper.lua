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
