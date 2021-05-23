vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

-- global
local o = vim.o
o.autoindent = true
o.autoread = true
o.backspace = "indent,eol,start"
o.completeopt = "menuone,noselect"
o.clipboard = "unnamedplus"
o.errorbells = false
o.expandtab = true
o.hidden = true
o.hlsearch = true
o.inccommand = "nosplit"
o.incsearch = true
o.lazyredraw = true
o.mouse = "a"
o.shell = "bash"
o.shiftwidth = 4
o.showmode = false
o.smartindent = true
o.smartindent = true
o.smarttab = true
o.softtabstop = 4
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.timeoutlen = 500
o.title = true
o.titlestring = "nvim %t %M (%F)"
o.ttimeout = true
o.ttimeoutlen = 10
o.visualbell = false
vim.cmd [[set shortmess+=c]]

-- window
local wo = vim.wo
wo.colorcolumn = "80"
wo.cursorline = true
wo.number = true
wo.relativenumber = true
wo.signcolumn = "yes"
wo.wrap = false

-- buffer
local bo = vim.bo
bo.swapfile = false

local proc_version = io.open("/proc/version", "r")
if vim.loop.os_uname().sysname == "Linux" and proc_version ~= nil then
    local proc_version_text = proc_version:read()

    if proc_version_text:match("microsoft") then
        vim.g.clipboard = {
            name = "win32yank",
            copy = {
                ["+"] = "win32yank.exe -i --crlf",
                ["*"] = "win32yank.exe -i --crlf"
            },
            paste = {
                ["+"] = "win32yank.exe -o --lf",
                ["*"] = "win32yank.exe -o --lf"
            },
            ["cache_enabled"] = 0
        }
    end

    proc_version:close()
end

vim.cmd([[
if exists("VIRTUAL_ENV")
	let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", "", "g")
else
	let g:python3_host_prog=substitute(system("which python3"), "\n", "", "g")
endif
]])

vim.cmd([[
if has("persistent_undo")
    if !isdirectory($HOME . "/.undodir")
        call mkdir($HOME . "/.undodir")
    endif

    set undodir=$HOME/.undodir
    set undofile
endif
]])

local function set_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.cmd("augroup " .. group_name)
        vim.cmd("autocmd!")
        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
            vim.cmd(command)
        end
        vim.cmd("augroup END")
    end
end

set_augroups({
    _general = {
        {
            "TextYankPost", "*",
            "lua require('vim.highlight').on_yank({ higroup = 'Search', timeout = 200 })"
        }
    },
    _plugins = {{"BufEnter,BufRead,BufNewFile", "NvimTree", "NvimTreeRefresh"}}
})
