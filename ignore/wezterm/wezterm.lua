local wezterm = require("wezterm")

return {
	default_prog = { "wsl.exe", "-d", "Ubuntu", "--cd", "\\\\wsl$\\Ubuntu\\home\\peter" },
	font = wezterm.font("JetBrainsMono NF"),
	font_size = 13,
	color_scheme = "tokyonight",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	enable_tab_bar = false,
}
