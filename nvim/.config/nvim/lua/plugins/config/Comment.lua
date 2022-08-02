return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            ignore = "^$",
            pre_hook = function(ctx)
                local U = require("Comment.utils")

                local location = nil
                if ctx.ctype == U.ctype.block then
                    location = require("ts_context_commentstring.utils").get_cursor_location()
                elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                    location = require("ts_context_commentstring.utils").get_visual_start_location()
                end

                return require("ts_context_commentstring.internal").calculate_commentstring({
                    key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
                    location = location,
                })
            end,
        })

        local set_keymap = vim.keymap.set

        -- FIXME: expr keymaps appear to be broken?
        set_keymap("n", "gcc", "<Plug>(comment_toggle_current_linewise)")
        set_keymap("n", "<Leader>/", "<Plug>(comment_toggle_current_linewise)")
        set_keymap("v", "<Leader>/", "gc")
    end,
}
