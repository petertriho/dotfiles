return {
    "editorconfig/editorconfig-vim",
    setup = function()
        vim.g.EditorConfig_exclude_patterns = require("languages").excludes
    end,
}
