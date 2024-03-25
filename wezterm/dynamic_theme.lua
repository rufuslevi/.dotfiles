local constants = require("constants")

-- Function to hot-reload on dark mode switch from the OS
-- Source : https://github.com/wez/wezterm/issues/806#issuecomment-882110170
Wezterm.on("window-config-reloaded", function(window)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = ""

	local file = io.open(Wezterm.home_dir .. "/.config/wezterm/theme.bin", "w")
	if not file then
		return nil
	end

	if appearance:find("Dark") then
		file:write("dark")
		scheme = constants.themes.dark_theme
	else
		file:write("light")
		scheme = constants.themes.light_theme
	end
	file:close()

	Wezterm.log_info(appearance)

	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

local function getTheme()
	local file = io.open(Wezterm.home_dir .. "/.config/wezterm/theme.bin", "r")
	if not file then
		return nil
	end

	local theme_variant = file:read()

	local theme
	if theme_variant == "dark" then
		theme = constants.dark_theme
	elseif theme_variant == "light" then
		theme = constants.light_theme
	end

	return theme
end

return { getTheme = getTheme }
