return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            ignore = "^$",
            pre_hook = function(ctx)
                if vim.bo.filetype == "typescriptreact" then
                    local U = require("Comment.utils")

                    local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

                    local location = nil
                    if ctx.ctype == U.ctype.blockwise then
                        location = require("ts_context_commentstring.utils").get_cursor_location()
                    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                        location = require("ts_context_commentstring.utils").get_visual_start_location()
                    end

                    return require("ts_context_commentstring.internal").calculate_commentstring({
                        key = type,
                        location = location,
                    })
                end
            end,
        })

        local set_keymap = vim.keymap.set

        set_keymap("n", "<Leader>/", "<Plug>(comment_toggle_linewise_current)")
        set_keymap("v", "<Leader>/", "gc", { remap = true })
    end,
}
