return {
    "sheerun/vim-polyglot",
    setup = function()
        local filetypes = require("filetypes")
        vim.g.polyglot_disabled = {
            "ftdetect",
            "sensible",
            unpack(filetypes.common),
            unpack(filetypes.extras),
        }
    end,
}
