local workspaceHandler = require("workspace")

local function getBase()
	return {
		{
			key = "l",
			mods = "LEADER",
			action = Wezterm.action.ShowLauncher,
		},
		{
			key = "p",
			mods = "LEADER",
			action = Wezterm.action.ActivateCommandPalette,
		},
		{
			key = "n",
			mods = "LEADER",
			action = Wezterm.action.PromptInputLine({
				description = Wezterm.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { AnsiColor = "Fuchsia" } },
					{ Text = "Enter name for new workspace" },
				}),
				action = Wezterm.action_callback(function(window, pane, line)
					if line then
						window:perform_action(
							Wezterm.action.SwitchToWorkspace({
								name = line,
							}),
							pane
						)
						Wezterm.reload_configuration()
					end
				end),
			}),
		},
		{
			key = "w",
			mods = "LEADER",
			action = Wezterm.action_callback(function(window, pane)
				workspaceHandler.selectWorkspace(window, pane)
			end),
		},
		{
			key = "c",
			mods = "LEADER",
			action = Wezterm.action.ClearScrollback("ScrollbackAndViewport"),
		},
	}
end
local function getWindows()
	return {}
end
local function getDarwin()
	return {}
end
local function getLinux()
	return {}
end

return { getBase = getBase, getWindows = getWindows, getDarwin = getDarwin, getLinux = getLinux }
