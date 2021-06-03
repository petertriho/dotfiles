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
        tabnine = {
            priority = 0,
            max_num_results = 4,
            show_prediction_strength = true
        },
        tmux = {all_panes = true},
        vsnip = true
    }
}

require("lsp/keymaps")

require("lsp/setup").setup()
