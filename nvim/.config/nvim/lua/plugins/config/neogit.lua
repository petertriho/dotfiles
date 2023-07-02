return {
    "NeogitOrg/neogit",
    requires = "nvim-lua/plenary.nvim",
    cmd = "Neogit",
    module = "neogit",
    setup = function()
        vim.api.nvim_create_user_command("ToggleNeogitStatusTab", function()
            local curr_bufname = vim.fn.bufname("NeogitStatus")

            if vim.fn.buflisted(curr_bufname) == 1 then
                local curr_bufnr = vim.fn.bufnr("NeogitStatus")

                for _, bufnr in ipairs(vim.fn.tabpagebuflist()) do
                    if bufnr == curr_bufnr then
                        vim.cmd("tabprevious")
                        return
                    end
                end
            end

            vim.cmd("Neogit")
        end, {})
    end,
    config = function()
        require("neogit").setup({
            disable_commit_confirmation = true,
            integrations = { diffview = true },
        })
    end,
}
