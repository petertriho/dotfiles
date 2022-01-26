return {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilghtEnable", "TwilightDisable" },
    module = "zen-mode",
    config = function()
        require("twilight").setup()
    end,
}
