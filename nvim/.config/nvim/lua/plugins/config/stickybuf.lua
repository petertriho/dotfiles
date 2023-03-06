return {
    "stevearc/stickybuf.nvim",
    config = function()
        require("stickybuf").setup({
            get_auto_pin = function(bufnr)
                local filetype = vim.bo[bufnr].filetype

                for _, v in ipairs(require("filetypes").sidebars) do
                    if v ~= "NvimTree" and v == filetype then
                        return "filetype"
                    end
                end

                return require("stickybuf").should_auto_pin(bufnr)
            end,
        })
    end,
}
