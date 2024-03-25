-- Pull in the wezterm API
Wezterm = require("wezterm")
local constants = require("constants")
local os_constants = require("os_constants")
local dynamic_theme = require("dynamic_theme")

-- This table will hold the configuration.
Config = {}
if Wezterm.config_builder then
	Config = Wezterm.config_builder()
end

Config.disable_default_key_bindings = true

dofile(Wezterm.home_dir .. "/.config/wezterm/workspace.lua")
dofile(Wezterm.home_dir .. "/.config/wezterm/tabbar.lua")

constants.global = os_constants.updateConstants(constants.global)

Config.default_prog = { constants.global.SHELL }
Config.window_background_opacity = constants.global.OPACITY
Config.macos_window_background_blur = 20
Config.use_fancy_tab_bar = true
Config.font = Wezterm.font({
	family = constants.global.FONT_FAMILY,
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
Config.font_size = constants.global.FONT_SIZE
Config.window_padding = {
	left = constants.global.LEFT_PADDING,
	right = constants.global.RIGHT_PADDING,
	top = constants.global.UP_PADDING,
	bottom = constants.global.DOWN_PADDING,
}
Config.window_frame = {
	font = Wezterm.font({
		family = "MonaspiceRn Nerd Font",
		weight = "DemiBold",
	}),
	font_size = constants.global.FONT_SIZE + 1,
	active_titlebar_bg = dynamic_theme.getTheme().tab_background,
	inactive_titlebar_bg = dynamic_theme.getTheme().tab_background,
}
Config.tab_bar_at_bottom = true
Config.enable_scroll_bar = false
Config.max_fps = 165
Config.initial_cols = constants.global.DEFAULT_WIDTH
Config.initial_rows = constants.global.DEFAULT_HEIGHT
Config.hide_tab_bar_if_only_one_tab = false
Config.quit_when_all_windows_are_closed = false
Config.ui_key_cap_rendering = constants.global.KEYCAPS_RENDERING
Config.command_palette_rows = constants.global.PALETTE_ROWS
Config.window_decorations = constants.global.WINDOW_DECORATIONS
Config.integrated_title_button_style = constants.global.INTEGRATED_BUTTONS
Config.keys = constants.global.KEYS
Config.leader = constants.global.LEADER

Config.debug_key_events = false

return Config
