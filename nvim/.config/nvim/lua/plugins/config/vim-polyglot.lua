return {
    "sheerun/vim-polyglot",
    setup = function()
        local languages = require("languages")
        vim.g.polyglot_disabled = {
            "ftdetect",
            "sensible",
            unpack(languages.common),
            unpack(languages.extras),
        }
    end,
}
