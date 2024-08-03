-- Pull in the wezterm API
Wezterm = require("wezterm")

-- This table will hold the configuration.
Config = {}
if Wezterm.config_builder then
	Config = Wezterm.config_builder()
end

dofile(Wezterm.home_dir .. "/.config/wezterm/workspace.lua")
dofile(Wezterm.home_dir .. "/.config/wezterm/constants.lua")
dofile(Wezterm.home_dir .. "/.config/wezterm/os_constants.lua")
dofile(Wezterm.home_dir .. "/.config/wezterm/dynamic_theme.lua")

Config.default_prog = { SHELL }
Config.window_background_opacity = OPACITY
Config.macos_window_background_blur = 20
Config.use_fancy_tab_bar = true
Config.line_height = 1.17
Config.font = Wezterm.font({
	family = "Monaspace Neon",
	weight = "Medium",
	stretch = "Condensed",
	harfbuzz_features = {
		"ss01=1",
		"ss02=1",
		"ss03=1",
		"ss04=1",
		"ss05=1",
		"ss06=1",
		"ss07=1",
		"ss08=1",
		"ss09=1",
	},
})
Config.font_size = FONT_SIZE
Config.freetype_load_flags = FREE_TYPE_LOAD_FLAGS
Config.window_padding = {
	left = LEFT_PADDING,
	right = RIGHT_PADDING,
	top = UP_PADDING,
	bottom = DOWN_PADDING,
}
Config.window_frame = {
	font = Wezterm.font({
		family = "Monaspace Radon",
		weight = "DemiBold",
	}),
	font_size = FONT_SIZE,
}
Config.tab_bar_at_bottom = true
Config.enable_scroll_bar = false
Config.max_fps = 165
Config.initial_cols = DEFAULT_WIDTH
Config.initial_rows = DEFAULT_HEIGHT
Config.hide_tab_bar_if_only_one_tab = false
Config.quit_when_all_windows_are_closed = false
Config.ui_key_cap_rendering = KEYCAPS_RENDERING
Config.command_palette_rows = PALETTE_ROWS
Config.window_decorations = WINDOW_DECORATIONS
Config.integrated_title_button_style = INTEGRATED_BUTTONS
Config.keys = KEYS
Config.leader = LEADER

Config.debug_key_events = false

return Config
