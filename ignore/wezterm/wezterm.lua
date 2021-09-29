local wezterm = require("wezterm")

local config = {
	font_size = 13,
	color_scheme = "tokyonight",
	bold_brightens_ansi_colors = true,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	window_close_confirmation = "NeverPrompt",
	hide_tab_bar_if_only_one_tab = true,
	leader = { key = "s", mods = "CTRL" },
	keys = {
		{
			mods = "LEADER",
			key = "\\",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ mods = "LEADER", key = "-", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ mods = "LEADER", key = "1", action = wezterm.action({ ActivateTab = 0 }) },
		{ mods = "LEADER", key = "2", action = wezterm.action({ ActivateTab = 1 }) },
		{ mods = "LEADER", key = "3", action = wezterm.action({ ActivateTab = 2 }) },
		{ mods = "LEADER", key = "4", action = wezterm.action({ ActivateTab = 3 }) },
		{ mods = "LEADER", key = "5", action = wezterm.action({ ActivateTab = 4 }) },
		{ mods = "LEADER", key = "6", action = wezterm.action({ ActivateTab = 5 }) },
		{ mods = "LEADER", key = "7", action = wezterm.action({ ActivateTab = 6 }) },
		{ mods = "LEADER", key = "8", action = wezterm.action({ ActivateTab = 7 }) },
		{ mods = "LEADER", key = "9", action = wezterm.action({ ActivateTab = 8 }) },
		{ mods = "LEADER", key = "a", action = "ShowTabNavigator" },
		{ mods = "LEADER", key = "c", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ mods = "LEADER", key = "h", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ mods = "LEADER", key = "j", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ mods = "LEADER", key = "k", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ mods = "LEADER", key = "l", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ mods = "LEADER", key = "s", action = "ActivateLastTab" },
		{ mods = "LEADER", key = "x", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
		{ mods = "LEADER", key = "z", action = "TogglePaneZoomState" },
		{ mods = "LEADER|CTRL", key = "s", action = wezterm.action({ SendString = "\x13" }) },
		{ mods = "LEADER|SHIFT", key = "&", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
		{ mods = "LEADER|SHIFT", key = "H", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
		{ mods = "LEADER|SHIFT", key = "J", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
		{ mods = "LEADER|SHIFT", key = "K", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
		{ mods = "LEADER|SHIFT", key = "L", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
	},
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "wsl.exe", "-d", "Ubuntu", "--cd", "\\\\wsl$\\Ubuntu\\home\\peter" }
	config.font = wezterm.font("JetBrainsMono NF")
else
	config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
end

return config
