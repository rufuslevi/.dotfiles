-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Sonokai (Gogh)"
config.window_background_opacity = 0.95
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
config.font_size = 14
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
	font_size = 14,
}
config.hide_tab_bar_if_only_one_tab = false
config.window_decorations = "INTEGRATED_BUTTONS"

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Monokai Pro (Gogh)"
	else
		-- return "Ayu Light (Gogh)"
		-- return "Mocha (light) (terminal.sexy)"
		-- return "Solarized (light) (terminal.sexy)"
		-- return "Builtin Solarized Light"
		-- return "Solarized Light (Gogh)"
		-- return "Gruvbox light, soft (base16)"
		-- return "Catppuccin Latte"
		return "Catppuccin Frappe"
	end
end

wezterm.on("window-config-reloaded", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

-- and finally, return the configuration to wezterm
return config
