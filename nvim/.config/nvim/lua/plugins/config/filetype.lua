return {
    "nathom/filetype.nvim",
    config = function()
        require("filetype").setup({
            overrides = {
                extension = {
                    prisma = "prisma",
                },
                literal = {
                    [".prettierrc"] = "jsonc",
                    ["todo.txt"] = "todotxt",
                    ["yarn.lock"] = "txt",
                },
                complex = {
                    [".*%.env.*"] = "conf",
                },
            },
        })
    end,
}
