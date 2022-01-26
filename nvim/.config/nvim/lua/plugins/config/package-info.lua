return {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    module = "package-info",
    config = function()
        require("package-info").setup()
    end,
}
