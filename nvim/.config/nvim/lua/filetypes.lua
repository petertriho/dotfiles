local sidebars = {
    "dbui",
    "DiffViewFiles",
    "Mundo",
    "MundoDiff",
    "NvimTree",
    "Outline",
}

return {
    treesitter = {
        "css",
        "dockerfile",
        "fish",
        "gitconfig",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "graphql",
        "html",
        "java",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "python",
        "rust",
        "scss",
        "svelte",
        "toml",
        "typescript",
        "vim",
        "yaml",
    },
    extras = {
        "html5",
        "javascriptreact",
        "jsx",
        "sh",
        "typescriptreact",
    },
    excludes = {
        "dirbuf",
        "fugitive",
        "fugitiveblame",
        "gitcommit",
        "help",
        "lspinfo",
        "NeogitStatus",
        "notify",
        "packer",
        "prompt",
        "qf",
        "TelescopePrompt",
        "TelescopeResults",
        unpack(sidebars),
    },
    sidebars = sidebars,
}
