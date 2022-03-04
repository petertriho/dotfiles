local M = {}

local openfile = require("nvim-tree.actions.open-file")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local view_selection = function(prompt_bufnr, map)
    actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local filename = selection.filename
        if filename == nil then
            filename = selection[1]
        end
        openfile.fn("preview", filename)
    end)
    return true
end

function M.launch_telescope(func_name, opts)
    local telescope_status_ok, _ = pcall(require, "telescope")
    if not telescope_status_ok then
        return
    end
    local lib_status_ok, lib = pcall(require, "nvim-tree.lib")
    if not lib_status_ok then
        return
    end
    local node = lib.get_node_at_cursor()
    local is_folder = node.has_children and true
    local basedir = is_folder and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ":h")
    if node.name == ".." and TreeExplorer ~= nil then
        basedir = TreeExplorer.cwd
    end
    opts = opts or { hidden = true }
    opts.cwd = basedir
    opts.search_dirs = { basedir }
    opts.attach_mappings = view_selection
    return require("telescope.builtin.files")[func_name](opts)
end

return M
