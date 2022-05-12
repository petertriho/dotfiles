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
local o = vim.o
o.clipboard = "unnamedplus"
o.colorcolumn = "80"
o.cursorline = true
o.expandtab = true
o.ignorecase = true
o.lazyredraw = true
o.list = true
o.mouse = "a"
o.number = true
o.pumheight = 10
-- o.relativenumber = true
o.scrolloff = 5
-- o.shada = "!,'0,f0,<50,s10,h"
o.shell = "bash"
o.shiftwidth = 4
o.showmode = false
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.softtabstop = 4
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.timeoutlen = 300
o.title = true
o.titlestring = "nvim %t %M"
o.ttimeout = false
o.ttimeoutlen = 0
-- o.updatetime = 100
o.wrap = false

local opt = vim.opt
opt.diffopt:append("algorithm:histogram,hiddenoff")
opt.fillchars = {
    diff = "╱",
    eob = " ",
    fold = " ",
    msgsep = "‾",
    vert = "│",
}
opt.listchars = {
    eol = "¬",
    extends = "›",
    nbsp = "¤",
    precedes = "‹",
    space = "·",
    tab = "» ",
    trail = "·",
}
opt.path:append("**")
opt.shortmess:append("c")
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

if vim.fn.executable("win32yank.exe") == 1 then
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

if vim.fn.executable("rg") == 1 then
    o.grepprg = "rg --vimgrep --color=never --no-heading --smart-case --hidden"
    o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

local dir = vim.fn.expand("~/.undodir")

if vim.fn.isdirectory(dir) ~= 1 then
    vim.fn.mkdir(dir, "p", "0700")
end

o.undodir = dir
o.undofile = true

local function mkdir()
    local dir = vim.fn.expand("<afile>:p:h")

    if vim.fn.isdirectory(dir) == 1 then
        vim.fn.mkdir(dir, "p")
    end
end

local function python3_host_prog_job(cmd)
    vim.fn.jobstart(cmd, {
        on_stdout = function(_, data, _)
            g.python3_host_prog = string.gsub(data[1], "\n", "")
        end,
    })
end

local function set_python3_host_prog()
    if vim.fn.exists("$VIRTUAL_ENV") == 1 then
        python3_host_prog_job("which -a python3 | head -n2 | tail -n1")
    else
        python3_host_prog_job("which python3")
    end
end

local function set_augroups(groups)
    for name, commands in pairs(groups) do
        vim.api.nvim_create_augroup(name, {})
        for _, command in pairs(commands) do
            command[2].group = name
            vim.api.nvim_create_autocmd(unpack(command))
        end
    end
end

set_augroups({
    _general = {
        -- {
        --     "TextYankPost",
        --     {
        --         pattern = "*",
        --         callback = function()
        --             vim.highlight.on_yank({ higroup = "Search", timeout = 200 })
        --         end,
        --         desc = "Highlight on yank",
        --     },
        -- },
        {
            { "FocusLost", "InsertEnter", "WinLeave" },
            {
                callback = function()
                    if o.number then
                        o.relativenumber = false
                    end
                end,
                desc = "Turn off relative number",
            },
        },
        {
            { "FocusGained", "InsertLeave", "WinEnter" },
            {
                callback = function()
                    if o.number then
                        o.relativenumber = true
                    end
                end,
                desc = "Turn on relative number",
            },
        },
        {
            "BufWritePre",
            { pattern = "*", callback = mkdir, desc = "Make directory for file if it does not exist" },
        },
        {
            "User",
            {
                pattern = "PythonHostProg",
                callback = set_python3_host_prog,
                desc = "Load python host prog when required",
            },
        },
    },
    _targets = {
        {
            "User",
            {
                pattern = "targets#mappings#user",
                command = "call targets#mappings#extend({'a': {'argument': [{'o': '[{([]', 'c': '[])}]', 's': ','}]}})",
                desc = "Additional ia/aa text objects",
            },
        },
    },
})
