-- disable plugins
local g = vim.g
g.did_load_filetypes = 1

g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_2html_plugin = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

-- options
local opt = vim.opt
opt.clipboard = "unnamedplus"
opt.colorcolumn = "80"
opt.cursorline = true
opt.expandtab = true
opt.fillchars = {
    fold = " ",
    vert = "│",
    eob = " ",
    msgsep = "‾",
    diff = "╱",
}
opt.ignorecase = true
opt.lazyredraw = true
opt.mouse = "a"
opt.number = true
opt.path = opt.path + "**"
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 5
-- opt.shada = "!,'0,f0,<50,s10,h"
opt.shell = "bash"
opt.shiftwidth = 4
opt.shortmess = opt.shortmess + "c"
opt.showmode = false
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.timeoutlen = 300
opt.title = true
opt.titlestring = "nvim %t %M (%F)"
opt.ttimeout = false
opt.ttimeoutlen = 0
opt.updatetime = 100
opt.wildignore = {
    "*.o",
    "*.pyc",
    "*/.git/*",
    "*/.venv/*",
    "*/__pycache__/*",
    "*/cache/*",
    "*/node_modules/*",
    "*/tmp/*",
}
opt.wrap = false

local proc_version = io.open("/proc/version", "r")
if vim.loop.os_uname().sysname == "Linux" and proc_version ~= nil then
    local proc_version_text = proc_version:read()

    if proc_version_text:match("microsoft") and vim.fn.executable("win32yank.exe") == 1 then
        vim.g.clipboard = {
            name = "win32yank",
            copy = {
                ["+"] = "win32yank.exe -i --crlf",
                ["*"] = "win32yank.exe -i --crlf",
            },
            paste = {
                ["+"] = "win32yank.exe -o --lf",
                ["*"] = "win32yank.exe -o --lf",
            },
            ["cache_enabled"] = 0,
        }
    end

    proc_version:close()
end

if vim.fn.executable("rg") == 1 then
    opt.grepprg = "rg --vimgrep --color=never --no-heading --smart-case --hidden"
    opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

if vim.fn.exists("$VIRTUAL_ENV") == 1 then
    g.python3_host_prog = vim.fn.substitute(vim.fn.system("which -a python3 | head -n2 | tail -n1"), "\n", "", "g")
else
    g.python3_host_prog = vim.fn.substitute(vim.fn.system("which python3"), "\n", "", "g")
end

if vim.fn.has("persistent_undo") == 1 then
    local dir = vim.fn.expand("~/.undodir")

    if vim.fn.isdirectory(dir) ~= 1 then
        vim.fn.mkdir(dir, "p", "0700")
    end

    opt.undodir = dir
    opt.undofile = true
end

local function set_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.cmd("augroup " .. group_name)
        vim.cmd("autocmd!")
        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
            vim.cmd(command)
        end
        vim.cmd("augroup END")
    end
end

-- mkdir if does not exists
function _G.mkdir()
    local dir = vim.fn.expand("%:p:h")

    if vim.fn.isdirectory(dir) ~= 1 then
        vim.fn.mkdir(dir, "p")
    end
end

set_augroups({
    _general = {
        {
            "TextYankPost",
            "*",
            "lua vim.highlight.on_yank({ higroup = 'Search', timeout = 200 })",
        },
        {
            "BufWritePre",
            "*",
            "call v:lua.mkdir()",
        },
        {
            "InsertEnter",
            "*(^prompt)@<!",
            "set norelativenumber"
        },
        {
            "InsertLeave",
            "*(^prompt)@<!",
            "set relativenumber"
        }
    },
    _targets = {
        {
            "User",
            "targets#mappings#user",
            "call targets#mappings#extend({'a': {'argument': [{'o': '[{([]', 'c': '[])}]', 's': ','}]}})",
        },
    },
})
