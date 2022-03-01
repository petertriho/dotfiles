return {
    "nathom/filetype.nvim",
    config = function()
        require("filetype").setup({
            overrides = {
                extension = {
                    dockerfile = "dockerfile",
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
                shebang = {
                    bash = "sh",
                },
            },
        })
    end,
}
