local dynamic_theme = require("dynamic_theme")

local function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

Wezterm.on("format-tab-title", function(tab)
	local theme = dynamic_theme.getTheme()
	-- theme = nil
	if theme == nil then
		return
	end

	local background = theme.background
	local text = theme.text

	if tab.is_active then
		background = theme.active_background
		text = theme.active_text
	end

	local title = tab_title(tab)

	return {
		{ Background = { Color = theme.tab_background } },
		{ Foreground = { Color = background } },
		{ Text = Wezterm.nerdfonts.ple_left_half_circle_thick },
		{ Background = { Color = background } },
		{ Foreground = { Color = text } },
		{ Text = title },
		{ Background = { Color = theme.tab_background } },
		{ Foreground = { Color = background } },
		{ Text = Wezterm.nerdfonts.ple_right_half_circle_thick },
	}
end)

return {}
