local global = {
	KEYS = {},
	LEADER = {
		key = "/",
		mods = "SUPER",
		timeout_milliseconds = 1000,
	},
	FONT_SIZE = 14,
	FONT_FAMILY = "Monaspace Neon",
	PALETTE_ROWS = 1,
	WINDOW_DECORATIONS = "",
	INTEGRATED_BUTTONS = "",
	KEYCAPS_RENDERING = "UnixLong",
	SHELL = "/bin/zsh",
	DEFAULT_WIDTH = 120,
	DEFAULT_HEIGHT = 40,
	-- OPACITY = 0.90,
	OPACITY = 1,
	LEFT_PADDING = 0,
	RIGHT_PADDING = 0,
	UP_PADDING = 48,
	DOWN_PADDING = 0,
}

local themes = {
	light_theme = "rose-pine-dawn",
	dark_theme = "GruvboxDark",
	-- dark_theme = "Catppuccin Mocha",
	-- dark_theme = "Sonokai (Gogh)",
	catppuccin_mocha = {
		background = "#191724",
		tab_background = "#1f1d2e",
		active_background = "",
		text = "#575279",
		active_text = "#e0def4",
	},
	gruvbox_dark = {
		background = "#32302f",
		tab_background = "#282828",
		active_background = "#1d2021",
		text = "#bdae93",
		active_text = "#fbf1c7",
	},
	rose_pine_dawn = {
		background = "#f2e9e1",
		tab_background = "#faf4ed",
		active_background = "#cecacd",
		text = "#9893a5",
		active_text = "#575279",
	},
}
local dark_theme = themes.gruvbox_dark
local light_theme = themes.rose_pine_dawn

return { themes = themes, dark_theme = dark_theme, light_theme = light_theme, global = global }
