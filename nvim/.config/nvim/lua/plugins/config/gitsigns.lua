return {
    "lewis6991/gitsigns.nvim",
    requires = "nvim-lua/plenary.nvim",
    opt = true,
    config = function()
        require("gitsigns").setup({
            signs = {
                add = {
                    text = "│",
                },
                change = {
                    text = "│",
                },
                delete = {
                    text = "│",
                },
                topdelete = {
                    text = "│",
                },
                changedelete = {
                    text = "│",
                },
            },
            current_line_blame_opts = {
                delay = 150,
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "Next change" })

                map("n", "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "Previous change" })

                require("which-key").register({
                    ["[c"] = "Previous change",
                    ["]c"] = "Next change",
                }, {})

                -- Actions
                map("n", "<Leader>hb", function()
                    gs.blame_line({ full = true })
                end)
                map("n", "<Leader>hD", function()
                    gs.diffthis("~")
                end)
                map("n", "<Leader>hd", gs.diffthis, { desc = "Diff this" })
                map("n", "<Leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
                map("n", "<Leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
                map({ "n", "v" }, "<Leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
                map("n", "<Leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
                map({ "n", "v" }, "<Leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
                map("n", "<Leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })

                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Inner hunk" })
            end,
        })

        require("scrollbar.handlers.gitsigns").setup()
    end,
}
