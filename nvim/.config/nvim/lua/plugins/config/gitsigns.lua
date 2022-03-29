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
                end, { expr = true })

                map("n", "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true })

                -- Actions
                map("n", "<leader>hb", function()
                    gs.blame_line({ full = true })
                end)
                map("n", "<leader>hD", function()
                    gs.diffthis("~")
                end)
                map("n", "<leader>hd", gs.diffthis)
                map("n", "<leader>hp", gs.preview_hunk)
                map("n", "<leader>hR", gs.reset_buffer)
                map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
                map("n", "<leader>hS", gs.stage_buffer)
                map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
                map("n", "<leader>hu", gs.undo_stage_hunk)

                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
            end,
        })
    end,
}
