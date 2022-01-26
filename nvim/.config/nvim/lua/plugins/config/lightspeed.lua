return {
    "ggandor/lightspeed.nvim",
    keys = {
        "<Plug>Lightspeed_s",
        "<Plug>Lightspeed_S",
        "<Plug>Lightspeed_x",
        "<Plug>Lightspeed_X",
        "<Plug>Lightspeed_f",
        "<Plug>Lightspeed_F",
        "<Plug>Lightspeed_t",
        "<Plug>Lightspeed_T",
    },
    config = function()
        require("lightspeed").setup({
            exit_after_idle_msecs = { unlabeled = nil, labeled = nil },
            substitute_chars = {
                [" "] = "␣",
                ["\r"] = "¬",
                ["\t"] = "»",
            },
        })
    end,
}
