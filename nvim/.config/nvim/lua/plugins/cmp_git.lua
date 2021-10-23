-- Special thanks to tjdevries for initial code https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/plugin/cmp_gh_source.lua
--
--[[ TODO:
-- add stylua
-- tests
-- config: limit, sort order, include closed?
-- support worktree
-- handle authentication errors
-- handle empty results
]]
--

local M = {}

local Job = require("plenary.job")

local source = {}

source.new = function()
    local self = setmetatable({ cache = {} }, { __index = source })

    return self
end

source.complete = function(self, _, callback)
    local bufnr = vim.api.nvim_get_current_buf()

    if not self.cache[bufnr] then
        local command = nil
        if vim.fn.executable("gh") == 1 then
            command = {
                "gh",
                "issue",
                "list",
                "--limit",
                "100",
                "--json",
                "title,number,body",
            }
        elseif vim.fn.executable("curl") == 1 then
            local remote_origin_url = vim.fn.system("git config --get remote.origin.url")
            local owner, repo = string.match(remote_origin_url, "github%.com[/:](.+)/(.+)%.git")
            local url = string.format(
                "https://api.github.com/repos/%s/%s/issues?filter=%s&state=%s&per_page=%d&page=%d",
                owner,
                repo,
                "all",
                "open",
                100,
                1
            )

            command = {
                "curl",
                "-H",
                "'Accept: application/vnd.github.v3+json'",
                url,
            }

            if vim.fn.exists("$GITHUB_API_TOKEN") == 1 then
                local token = vim.fn.getenv("GITHUB_API_TOKEN")
                local authorization_header = string.format("'Authorization: token %s'", token)
                table.insert(command, "-H")
                table.insert(command, authorization_header)
            end
        else
            vim.notify("gh and curl executables not found!")
            return
        end

        command.on_exit = function(job)
            local result = job:result()
            local ok, parsed = pcall(vim.json.decode, table.concat(result, ""))
            if not ok then
                vim.notify("Failed to parse github api result")
                return
            end

            local items = {}
            for _, gh_item in ipairs(parsed) do
                if gh_item.body ~= vim.NIL then
                    gh_item.body = string.gsub(gh_item.body or "", "\r", "")
                else
                    gh_item.body = ""
                end

                table.insert(items, {
                    label = string.format("#%s", gh_item.number),
                    documentation = {
                        kind = "markdown",
                        value = string.format("# %s\n\n%s", gh_item.title, gh_item.body),
                    },
                })
            end

            callback({ items = items, isIncomplete = false })
            self.cache[bufnr] = items
        end

        Job:new(command):start()
    else
        callback({ items = self.cache[bufnr], isIncomplete = false })
    end
end

source.get_trigger_characters = function()
    return { "#" }
end

source.get_debug_name = function()
    return "cmp_git"
end

source.is_available = function()
    return vim.bo.filetype == "gitcommit"
end

M.setup = function()
    require("cmp").register_source("cmp_git", source.new())
end

return M
