return {
    "rlch/github-notifications.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local commands = require("github-notifications.telescope.commands")
        commands.open_in_browser = function(notification)
            local url = notification.value.subject.url

            url = url:gsub("api%.github%.com", "github.com")

            if vim.fn.has("mac") == 1 then
                vim.cmd('call jobstart(["open", expand("' .. url .. '")], {"detach": v:true})')
            elseif vim.fn.has("unix") == 1 then
                vim.cmd('call jobstart(["xdg-open", expand("' .. url .. '")], {"detach": v:true})')
            else
                vim.notify("gx not supported on this OS", vim.log.levels.ERROR)
            end
        end

        require("github-notifications").setup({
            mappings = {
                hide = "h",
                mark_all_read = "a",
                mark_read = "r",
                open_in_browser = "o",
            },
            prompt_mappings = {
                hide = "<C-h>",
                mark_all_read = "<C-a>",
                mark_read = "<C-r>",
                open_in_browser = "<C-o>",
            },
        })
    end,
}
