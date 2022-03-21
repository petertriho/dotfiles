return {
    "gbprod/substitute.nvim",
    module = "substitute",
    setup = function()
        local set_keymap = vim.api.nvim_set_keymap

        set_keymap("n", "s", "<CMD>lua require('substitute').operator()<CR>", { noremap = true })
        set_keymap("n", "ss", "<CMD>lua require('substitute').line()<CR>", { noremap = true })
        set_keymap("n", "S", "<CMD>lua require('substitute').eol()<CR>", { noremap = true })
        set_keymap("x", "s", "<CMD>lua require('substitute').visual()<CR>", { noremap = true })

        set_keymap("n", "<Leader>s", "<CMD>lua require('substitute.range').operator()<CR>", { noremap = true })
        set_keymap("x", "<Leader>s", "<CMD>lua require('substitute.range').visual()<CR>", {})
        set_keymap("n", "<Leader>ss", "<CMD>lua require('substitute.range').word()<CR>", {})

        set_keymap(
            "n",
            "<Leader>S",
            "<CMD>lua require('substitute.range').operator({ prefix = 'S' })<CR>",
            { noremap = true }
        )
        set_keymap("x", "<Leader>S", "<CMD>lua require('substitute.range').visual({ prefix = 'S' })<CR>", {})
        set_keymap("n", "<Leader>SS", "<CMD>lua require('substitute.range').word({ prefix = 'S' })<CR>", {})

        set_keymap("n", "cx", "<CMD>lua require('substitute.exchange').operator()<CR>", { noremap = true })
        set_keymap("n", "cxx", "<CMD>lua require('substitute.exchange').line()<CR>", { noremap = true })
        set_keymap("x", "X", "<CMD>lua require('substitute.exchange').visual()<CR>", { noremap = true })
        set_keymap("n", "cxc", "<CMD>lua require('substitute.exchange').cancel()<CR>", { noremap = true })

        set_keymap("x", "p", "<CMD>lua require('substitute').visual()<CR>", {})
        set_keymap("x", "P", "<CMD>lua require('substitute').visual()<CR>", {})
    end,
    config = function()
        require("substitute").setup({
            on_substitute = function(_)
                if packer_plugins["vim-yoink"] and packer_plugins["vim-yoink"].loaded then
                    vim.fn["yoink#startUndoRepeatSwap"]()
                end
            end,
        })
    end,
}
