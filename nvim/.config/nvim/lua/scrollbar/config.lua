return {
    handle = {
        text = " ",
        color = "white",
    },
    marks = {
        Error = { text = { "-", "=" }, priority = 1, color = "red" },
        Warn = { text = { "-", "=" }, priority = 2, color = "orange" },
        Info = { text = { "-", "=" }, priority = 3, color = "blue" },
        Hint = { text = { "-", "=" }, priority = 4, color = "green" },
        Misc = { text = { "-", "=" }, priority = 4, color = "yellow" },
    },
    excluded_filetypes = {
        "",
        "prompt",
        "TelescopePrompt",
    },
    autocmd = {
        refresh = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
    },
    show = {
        diagnostics = true,
    },
}
