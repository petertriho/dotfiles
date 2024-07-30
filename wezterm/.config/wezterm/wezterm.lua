local wezterm = require("wezterm")

local leader_key = "b"

local config = {
    color_scheme = "tokyonight",
    bold_brightens_ansi_colors = true,
    -- harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    window_close_confirmation = "NeverPrompt",
    hide_tab_bar_if_only_one_tab = true,
    leader = { key = leader_key, mods = "CTRL" },
    keys = {
        { mods = "LEADER|CTRL", key = leader_key, action = { SendKey = { mods = "CTRL", key = leader_key } } },
        { mods = "LEADER", key = leader_key, action = "ActivateLastTab" },
        {
            mods = "LEADER",
            key = "\\",
            action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
        },
        { mods = "LEADER", key = "-", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
        { mods = "LEADER", key = "[", action = "ActivateCopyMode" },
        { mods = "LEADER", key = "]", action = wezterm.action.PasteFrom("Clipboard") },
        { mods = "LEADER", key = "1", action = wezterm.action({ ActivateTab = 0 }) },
        { mods = "LEADER", key = "2", action = wezterm.action({ ActivateTab = 1 }) },
        { mods = "LEADER", key = "3", action = wezterm.action({ ActivateTab = 2 }) },
        { mods = "LEADER", key = "4", action = wezterm.action({ ActivateTab = 3 }) },
        { mods = "LEADER", key = "5", action = wezterm.action({ ActivateTab = 4 }) },
        { mods = "LEADER", key = "6", action = wezterm.action({ ActivateTab = 5 }) },
        { mods = "LEADER", key = "7", action = wezterm.action({ ActivateTab = 6 }) },
        { mods = "LEADER", key = "8", action = wezterm.action({ ActivateTab = 7 }) },
        { mods = "LEADER", key = "9", action = wezterm.action({ ActivateTab = 8 }) },
        { mods = "LEADER", key = "Tab", action = "QuickSelect" },
        { mods = "LEADER", key = "a", action = "ShowTabNavigator" },
        { mods = "LEADER", key = "c", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
        { mods = "LEADER", key = "f", action = "ToggleFullScreen" },
        { mods = "LEADER", key = "h", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
        { mods = "LEADER", key = "j", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
        { mods = "LEADER", key = "k", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
        { mods = "LEADER", key = "l", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
        { mods = "LEADER", key = "n", action = wezterm.action({ ActivateTabRelative = 1 }) },
        { mods = "LEADER", key = "p", action = wezterm.action({ ActivateTabRelative = -1 }) },
        { mods = "LEADER", key = "x", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
        { mods = "LEADER", key = "z", action = "TogglePaneZoomState" },
        { mods = "LEADER|SHIFT", key = "&", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
        { mods = "LEADER|SHIFT", key = "H", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
        { mods = "LEADER|SHIFT", key = "J", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
        { mods = "LEADER|SHIFT", key = "K", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
        { mods = "LEADER|SHIFT", key = "L", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
    },
    colors = {
        tab_bar = {
            background = "#0E0E14",
            active_tab = {
                bg_color = "#1A1B26",
                fg_color = "#C0CAF5",
            },
            inactive_tab = {
                bg_color = "#13141C",
                fg_color = "#565F89",
            },
            inactive_tab_hover = {
                bg_color = "#1A1B26",
                fg_color = "#C0CAF5",
            },
            new_tab = {
                bg_color = "#13141C",
                fg_color = "#565F89",
            },
            new_tab_hover = {
                bg_color = "#1A1B26",
                fg_color = "#C0CAF5",
            },
        },
    },
    inactive_pane_hsb = {
        saturation = 1.0,
        brightness = 1.0,
    },
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
}

wezterm.on("format-tab-title", function(tab)
    if tab.is_active then
        return {
            { Text = "▎" .. tab.active_pane.title },
        }
    end

    return {
        { Text = " " .. tab.active_pane.title },
    }
end)

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.default_domain = "WSL:NixOS"
    config.font = wezterm.font("JetBrainsMono Nerd Font")
    config.font_size = 12
    config.allow_win32_input_mode = false
else
    config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
    config.font_size = 14
end

return config
