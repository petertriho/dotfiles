return {
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons",
    setup = function()
        local set_keymap = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        set_keymap("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", opts)
        set_keymap("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", opts)

        set_keymap("n", "<Leader>1", "<CMD>lua require('bufferline').go_to_buffer(1)<CR>", {})
        set_keymap("n", "<Leader>2", "<CMD>lua require('bufferline').go_to_buffer(2)<CR>", {})
        set_keymap("n", "<Leader>3", "<CMD>lua require('bufferline').go_to_buffer(3)<CR>", {})
        set_keymap("n", "<Leader>4", "<CMD>lua require('bufferline').go_to_buffer(4)<CR>", {})
        set_keymap("n", "<Leader>5", "<CMD>lua require('bufferline').go_to_buffer(5)<CR>", {})
        set_keymap("n", "<Leader>6", "<CMD>lua require('bufferline').go_to_buffer(6)<CR>", {})
        set_keymap("n", "<Leader>7", "<CMD>lua require('bufferline').go_to_buffer(7)<CR>", {})
        set_keymap("n", "<Leader>8", "<CMD>lua require('bufferline').go_to_buffer(8)<CR>", {})
        set_keymap("n", "<Leader>9", "<CMD>lua require('bufferline').go_to_buffer(9)<CR>", {})
        set_keymap("n", "<Leader>0", "<CMD>lua require('bufferline').go_to_buffer(10)<CR>", {})
    end,
    config = function()
        require("bufferline").setup({
            options = {
                numbers = function(opts)
                    return string.format("%s.", opts.ordinal)
                end,
                close_command = "Bwipeout! %d",
                right_mouse_command = "Bwipeout! %d",
                offsets = {
                    {
                        filetype = "dbui",
                        text = "DATABASE",
                        highlight = "Directory",
                        text_align = "center",
                    },
                    {
                        filetype = "DiffViewFiles",
                        text = "DIFFVIEW",
                        highlight = "Directory",
                        text_align = "center",
                    },
                    {
                        filetype = "Mundo",
                        text = "UNDOTREE",
                        highlight = "Directory",
                        text_align = "center",
                    },
                    {
                        filetype = "NvimTree",
                        text = "EXPLORER",
                        highlight = "Directory",
                        text_align = "center",
                    },
                    {
                        filetype = "Outline",
                        text = "OUTLINE",
                        highlight = "Directory",
                        text_align = "center",
                    },
                    {
                        filetype = "UltestSummary",
                        text = "TESTS",
                        highlight = "Directory",
                        text_align = "center",
                    },
                },
                custom_filter = function(buf_number)
                    return vim.bo[buf_number].filetype ~= "fugitive"
                        and vim.bo[buf_number].filetype ~= "NeogitStatus"
                        and vim.bo[buf_number].buftype ~= "terminal"
                end,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    return "(" .. count .. ")"
                end,
            },
        })
    end,
}
