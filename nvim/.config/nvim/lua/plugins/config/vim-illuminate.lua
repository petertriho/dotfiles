return {
    "RRethy/vim-illuminate",
    module = "illuminate",
    opt = true,
    setup = function()
        vim.g.Illuminate_ftblacklist = require("languages").excludes
    end,
}
