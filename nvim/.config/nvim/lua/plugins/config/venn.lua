return {
    "jbyuki/venn.nvim",
    cmd = "VBox",
    setup = function()
        local toggle_venn = function()
            local venn_enabled = vim.inspect(vim.b.venn_enabled)
            if venn_enabled == "nil" then
                vim.b.venn_enabled = true
                vim.cmd([[setlocal ve=all]])
                -- draw a line on HJKL keystokes
                vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
                vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
                vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
                vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
                -- draw a box by pressing "B" with visual selection
                vim.api.nvim_buf_set_keymap(0, "v", "B", ":VBox<CR>", { noremap = true })
            else
                vim.cmd([[setlocal ve=]])
                vim.cmd([[mapclear <buffer>]])
                vim.b.venn_enabled = nil
            end
        end
        vim.keymap.set("n", "<Leader>v", toggle_venn, { noremap = true })
    end,
}
