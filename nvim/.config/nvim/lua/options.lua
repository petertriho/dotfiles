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
o.tabstop = 4
o.termguicolors = true
o.timeoutlen = 500
o.title = true
o.titlestring = "nvim %t %M (%F)"
o.ttimeout = true
o.ttimeoutlen = 10
o.visualbell = false

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

if vim.loop.os_uname().sysname == "Linux" then
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

vim.cmd([[
if exists("VIRTUAL_ENV")
	let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", "", "g")
else
	let g:python3_host_prog=substitute(system("which python3"), "\n", "", "g")
endif
]])

vim.g.polygot_disabled = {
    "autoindent", "sensible", "css", "go", "graphql", "html5", "javascript",
    "json", "jsonc", "jsx", "python", "scss", "toml", "typescript", "yaml"
}

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
    }
})
