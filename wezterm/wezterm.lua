-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Constants
local FONT_SIZE = 14
local WINDOW_DECORATIONS = "INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
local LIGHT_THEME = "rose-pine-dawn"
local DARK_THEME = "Sonokai (Gogh)"
local SHELL = "/bin/zsh"
local DEFAULT_WIDTH = 120
local DEFAULT_HEIGHT = 40
local OPACITY = 0.95

-- Function to hot-reload on dark mode switch from the OS
-- Source : https://github.com/wez/wezterm/issues/806#issuecomment-882110170
wezterm.on("window-config-reloaded", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = ""
	if appearance:find("Dark") then
		scheme = DARK_THEME
	else
		scheme = LIGHT_THEME
	end

	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

-- Changing constants based on the host OS
if os.execute("cd C:/WINDOWS") then
	wezterm.log_info("Running on Windows!")

	FONT_SIZE = 10
	config.window_decorations = "TITLE"
elseif not os.execute("cd /Applications") then
	wezterm.log_info("Running on Linux!")
	SHELL = "/home/linuxbrew/.linuxbrew/bin/nu"

	FONT_SIZE = 10
	OPACITY = 1
	config.window_decorations = "TITLE|RESIZE"
	config.integrated_title_button_style = "Gnome"
else
	wezterm.log_info("MacOS!")
	SHELL = "/Users/rufuslevi/.cargo/bin/nu"
end

config.default_prog = { SHELL }

config.window_background_opacity = OPACITY
config.macos_window_background_blur = 20
config.use_fancy_tab_bar = true
config.font = wezterm.font({
	family = "Monaspace Neon",
	weight = "Regular",
	stretch = "Normal",
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
config.font_size = FONT_SIZE
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_frame = {
	font = wezterm.font({
		family = "Monaspace Radon",
		weight = "DemiBold",
	}),
	font_size = FONT_SIZE,
}
config.initial_cols = DEFAULT_WIDTH
config.initial_rows = DEFAULT_HEIGHT
config.hide_tab_bar_if_only_one_tab = false
config.window_decorations = WINDOW_DECORATIONS

return config
