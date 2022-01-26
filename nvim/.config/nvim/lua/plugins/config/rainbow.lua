return {
    "luochen1990/rainbow",
    opt = true,
    setup = function()
        local colors = require("colors")

        vim.g.rainbow_active = 1

        vim.g.rainbow_conf = {
            guifgs = {
                colors.red,
                colors.green,
                colors.yellow,
                colors.blue,
                colors.magenta,
                colors.cyan,
            },
            separately = {
                css = 0,
                dockerfile = 0,
                fish = 0,
                go = 0,
                graphql = 0,
                html5 = 0,
                javascript = 0,
                javascriptreact = 0,
                json = 0,
                jsonc = 0,
                jsx = 0,
                lua = 0,
                markdown = 0,
                python = 0,
                rust = 0,
                scss = 0,
                sh = 0,
                svelte = 0,
                toml = 0,
                typescript = 0,
                typescriptreact = 0,
                yaml = 0,
                dbui = 0,
                NvimTree = 0,
                lspinfo = 0,
                Mundo = 0,
                MundoDiff = 0,
                packer = 0,
                fugitive = 0,
                fugitiveblame = 0,
                NeogitStatus = 0,
                DiffViewFiles = 0,
            },
        }
    end,
}
