vim.opt.shadafile = "NONE"
if vim.fn.has("nvim-0.9") == 1 then
    vim.loader.enable()
end
require("options")
require("plugins")
require("lsp")
require("keymaps")
vim.opt.shadafile = ""
