return {
    "AndrewRadev/splitjoin.vim",
    cmd = { "SplitjoinJoin", "SplitjoinSplit" },
    setup = function()
        vim.g.splitjoin_split_mapping = ""
        vim.g.splitjoin_join_mapping = ""
    end,
}
