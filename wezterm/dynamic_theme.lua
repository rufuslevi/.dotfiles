-- Function to hot-reload on dark mode switch from the OS
-- Source : https://github.com/wez/wezterm/issues/806#issuecomment-882110170
Wezterm.on("window-config-reloaded", function(window)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = ""
	if appearance:find("Dark") then
		scheme = DARK_THEME
	else
		scheme = LIGHT_THEME
	end

	Wezterm.log_info(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)
