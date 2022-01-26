return {
    "jvgrootveld/telescope-zoxide",
    after = "telescope.nvim",
    module = "telescope.extensions.zoxide",
    config = function()
        local function browse_files(selection)
            require("telescope").extensions.file_browser.file_browser({ cwd = selection.path })
        end

        local builtin = require("telescope.builtin")

        local function find_files(selection)
            builtin.find_files({ cwd = selection.path, hidden = true })
        end

        local function search_files(selection)
            builtin.live_grep({ cwd = selection.path })
        end

        local z_utils = require("telescope._extensions.zoxide.utils")
        require("telescope._extensions.zoxide.config").setup({
            mappings = {
                default = {
                    keepinsert = true,
                    action = find_files,
                    after_action = function() end,
                },
                ["<C-b>"] = {
                    keepinsert = true,
                    action = browse_files,
                },
                ["<C-f>"] = {
                    keepinsert = true,
                    action = find_files,
                },
                ["<C-s>"] = {
                    keepinsert = true,
                    action = search_files,
                },
                ["<C-w>"] = {
                    action = function(selection)
                        vim.cmd("cd " .. selection.path)
                    end,
                    after_action = function(selection)
                        print("Directory changed to " .. selection.path)
                    end,
                },
                ["<C-x>"] = { action = z_utils.create_basic_command("split") },
                ["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
            },
        })
    end,
}
