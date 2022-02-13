return {
    "stevearc/stickybuf.nvim",
    config = function()
        local sidebars = {}

        for _, v in ipairs(require("languages").sidebars) do
            sidebars[v] = "filetype"
        end

        require("stickybuf").setup({
            filetype = sidebars,
        })
    end,
}
