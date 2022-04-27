return {
    "nvim-treesitter/nvim-treesitter",
    opt = true,
    run = ":TSUpdateSync",
    config = function()
        local ts_utils = require("nvim-treesitter.ts_utils")
        ts_utils.get_node_text = function(node, bufnr)
            bufnr = bufnr or vim.api.nvim_get_current_buf()
            if not node then
                return {}
            end

            -- We have to remember that end_col is end-exclusive
            local start_row, start_col, end_row, end_col = ts_utils.get_node_range(node)

            if start_row ~= end_row then
                local lines = vim.api.nvim_buf_get_lines(bufnr, start_row, end_row + 1, false)
                lines[1] = string.sub(lines[1], start_col + 1)
                -- end_row might be just after the last line. In this case the last line is not truncated.
                if #lines == end_row - start_row + 1 then
                    lines[#lines] = string.sub(lines[#lines], 1, end_col)
                end
                return lines
            else
                local line = vim.api.nvim_buf_get_lines(bufnr, start_row, start_row + 1, false)[1]
                -- If line is nil then the line is empty
                return line and { string.sub(line, start_col + 1, end_col) } or {}
            end
        end

        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "comment",
                "prisma",
                "regex",
                "todotxt",
                "tsx",
                unpack(require("filetypes").treesitter),
            },
            sync_install = true,
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            incremental_selection = {
                enable = false,
            },
            indent = {
                enable = true,
                disable = { "python" },
            },
            fold = { enable = false },
        })
        require("nvim-treesitter").define_modules({
            fold = {
                attach = function()
                    vim.opt_local.foldmethod = "expr"
                    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
                    vim.opt_local.foldminlines = 1
                    vim.opt_local.foldnestmax = 3
                    vim.opt_local.foldlevel = 3
                    vim.opt_local.foldtext =
                        "substitute(getline(v:foldstart),'\\t',repeat(' ',&tabstop),'g').'...'.trim(getline(v:foldend)).' ('.(v:foldend-v:foldstart+1).' lines)'"
                end,
                detach = function() end,
                is_supported = function()
                    return true
                end,
            },
        })

        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.markdown.filetype_to_parsername = "octo"
    end,
}
