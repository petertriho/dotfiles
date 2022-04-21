return {
    "sheerun/vim-polyglot",
    setup = function()
        local filetypes = require("filetypes")
        vim.g.polyglot_disabled = {
            "autoindent",
            "ftdetect",
            "sensible",
            unpack(filetypes.treesitter),
            unpack(filetypes.extras),
        }
    end,
}
