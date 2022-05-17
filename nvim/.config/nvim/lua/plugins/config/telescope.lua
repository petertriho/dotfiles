return {
    "nvim-telescope/telescope.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    module = "telescope",
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                },
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                    n = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },
                history = false,
                file_ignore_patterns = { "%.git/*" },
                sorting_strategy = "ascending",
                layout_strategy = "flex",
                layout_config = {
                    horizontal = { preview_width = 0.6, prompt_position = "top" },
                    vertical = { mirror = true },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = false,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
            pickers = {
                file_browser = {
                    hidden = true,
                },
                find_files = {
                    hidden = true,
                    attach_mappings = function()
                        require("telescope.actions.set").select:enhance({
                            post = function()
                                vim.cmd(":normal! zx")
                            end,
                        })
                        return true
                    end,
                },
            },
        })

        telescope.load_extension("fzf")

        local commands = require("github-notifications.telescope.commands")
        commands.open_in_browser = function(notification)
            local url = string.gsub(notification.value.subject.url, "api%.github%.com/repos", "github.com"):gsub(
                "/pulls/(%d+)",
                "/pull/%1"
            )

            if vim.fn.has("mac") == 1 then
                vim.cmd('call jobstart(["open", expand("' .. url .. '")], {"detach": v:true})')
            elseif vim.fn.has("unix") == 1 then
                vim.cmd('call jobstart(["xdg-open", expand("' .. url .. '")], {"detach": v:true})')
            else
                vim.notify("gx not supported on this OS", vim.log.levels.ERROR)
            end
        end
    end,
}
