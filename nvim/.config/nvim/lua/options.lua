-- disable plugins
local g = vim.g
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
opt.errorbells = false
opt.expandtab = true
opt.fillchars = {
    fold = " ",
    vert = "│",
    eob = " ",
    msgsep = "‾",
    diff = "╱",
}
opt.hidden = true
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.lazyredraw = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 5
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
opt.termguicolors = true
opt.timeoutlen = 300
opt.title = true
opt.titlestring = "nvim %t %M (%F)"
opt.ttimeout = false
opt.ttimeoutlen = 0
opt.updatetime = 100
opt.visualbell = false
opt.wrap = false

local proc_version = io.open("/proc/version", "r")
if vim.loop.os_uname().sysname == "Linux" and proc_version ~= nil then
    local proc_version_text = proc_version:read()

    if proc_version_text:match("microsoft") then
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

vim.cmd([[
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", "", "g")
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", "", "g")
endif
]])

vim.cmd([[
if has("persistent_undo")
   let target_path = expand("~/.undodir")

    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
]])

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

set_augroups({
    _general = {
        {
            "TextYankPost",
            "*",
            "lua vim.highlight.on_yank({ higroup = 'Search', timeout = 200 })",
        },
    },
    _colors = {
        {
            "ColorScheme",
            "*",
            "highlight QuickScopePrimary guifg=#7aa2f7 gui=underline ctermfg=blue cterm=underline",
        },
        {
            "ColorScheme",
            "*",
            "highlight QuickScopeSecondary guifg=#f7768e gui=underline ctermfg=red cterm=underline",
        },
    },
    _targets = {
        {
            "User",
            "targets#mappings#user",
            "call targets#mappings#extend({'a': {'argument': [{'o': '[{([]', 'c': '[])}]', 's': ','}]}})",
        },
    },
})
