local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

_G.tab_complete = function(key)
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t(key)
    else
        return vim.fn["compe#complete"]()
    end
end

_G.s_tab_complete = function(key)
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t(key)
    end
end

local set_keymap = vim.api.nvim_set_keymap
local complete_opts = {expr = true}
set_keymap("i", "<C-j>", "v:lua.tab_complete('<C-j>')", complete_opts)
set_keymap("s", "<C-j>", "v:lua.tab_complete('<C-j>')", complete_opts)
set_keymap("i", "<C-k>", "v:lua.s_tab_complete('<C-k>')", complete_opts)
set_keymap("s", "<C-k>", "v:lua.s_tab_complete('<C-k>')", complete_opts)

set_keymap("i", "<Tab>", "v:lua.tab_complete('<Tab>')", complete_opts)
set_keymap("s", "<Tab>", "v:lua.tab_complete('<Tab>')", complete_opts)
set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete('<S-Tab>')", complete_opts)
set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete('<S-Tab>')", complete_opts)

local compe_opts = {silent = true, expr = true, noremap = true}
set_keymap("i", "<C-Space>", "compe#complete()", compe_opts)
set_keymap("i", "<CR>", "compe#confirm('<CR>')", compe_opts)
set_keymap("i", "<C-e>", "compe#close()", compe_opts)
set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", compe_opts)
set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", compe_opts)
