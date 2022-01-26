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
                    [".env"] = "conf",
                    [".prettierrc"] = "jsonc",
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
