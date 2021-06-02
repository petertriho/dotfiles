require("compe").setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "always",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        path = true,
        tabnine = {priority = 0},
        tmux = {all_panes = true},
        vsnip = true
    }
}

require("lsp/keymaps")

require("lsp/setup").setup()
