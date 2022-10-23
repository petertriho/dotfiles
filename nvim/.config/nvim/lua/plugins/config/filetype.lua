return {
    "nathom/filetype.nvim",
    config = function()
        require("filetype").setup({
            overrides = {
                extensions = {
                    prisma = "prisma",
                    sh = "sh",
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
