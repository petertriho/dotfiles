return {
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons",
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
                },
                custom_filter = function(buf_number)
                    if
                        vim.bo[buf_number].filetype ~= "fugitive"
                        and vim.bo[buf_number].filetype ~= "NeogitStatus"
                        and vim.bo[buf_number].buftype ~= "terminal"
                    then
                        return true
                    end
                end,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    return "(" .. count .. ")"
                end,
            },
        })
    end,
}
