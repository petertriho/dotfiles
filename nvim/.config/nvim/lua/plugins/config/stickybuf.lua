return {
    "stevearc/stickybuf.nvim",
    config = function()
        local sidebars = {}

        for _, v in ipairs(require("filetypes").sidebars) do
            if v ~= "NvimTree" then
                sidebars[v] = "filetype"
            end
        end

        require("stickybuf").setup({
            filetype = sidebars,
        })
    end,
}
