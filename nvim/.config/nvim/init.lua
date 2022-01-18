vim.opt.shadafile = "NONE"
if vim.fn.isdirectory(vim.fn.stdpath("data") .. "/site/pack/packer/start/impatient.nvim") == 1 then
    require("impatient")
end
require("options")
require("plugins")
require("lsp")
require("keymaps")
require("ui")
vim.opt.shadafile = ""
