return {
    "elihunter173/dirbuf.nvim",
    keys = { { "n", "-" } },
    cmd = {
        "Dirbuf",
        "DirbufSync",
    },
    setup = function()
        vim.api.nvim_create_augroup("dirbuf", {})
        vim.api.nvim_create_autocmd("BufEnter", {
            group = "dirbuf",
            pattern = "*",
            callback = function()
                if vim.fn.isdirectory(vim.fn.expand("%")) == 1 and not vim.opt_local.modified:get() then
                    vim.cmd("Dirbuf")
                end
            end,
        })
    end,
    config = function()
        require("dirbuf").setup({})
    end,
}
