return {
    "tpope/vim-unimpaired",
    setup = function()
        vim.g.nremap = { ["[x"] = "", ["]x"] = "" }
    end,
    config = function()
        vim.cmd([[
            exe UnimpairedMapTransform('xml_encode','[X')
            exe UnimpairedMapTransform('xml_decode',']X')
        ]])
    end,
}
