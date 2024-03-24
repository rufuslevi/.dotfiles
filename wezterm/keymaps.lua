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
			action = Wezterm.action.CloseCurrentTab({ confirm = true }),
		},
		{
			key = "v",
			mods = "LEADER",
			action = Wezterm.action.ClearScrollback("ScrollbackAndViewport"),
		},
		{
			key = "t",
			mods = "LEADER",
			action = Wezterm.action.SpawnTab("CurrentPaneDomain"),
		},
	}
end
local function getWindows()
	return {}
end
local function getDarwin()
	return {
		{
			key = "1",
			mods = "SUPER",
			action = Wezterm.action.ActivateTab(0),
		},
		{
			key = "2",
			mods = "SUPER",
			action = Wezterm.action.ActivateTab(1),
		},
		{
			key = "3",
			mods = "SUPER",
			action = Wezterm.action.ActivateTab(2),
		},
		{
			key = "4",
			mods = "SUPER",
			action = Wezterm.action.ActivateTab(3),
		},
		{
			key = "5",
			mods = "SUPER",
			action = Wezterm.action.ActivateTab(4),
		},
		{
			key = "6",
			mods = "SUPER",
			action = Wezterm.action.ActivateTab(5),
		},
		{
			key = "7",
			mods = "SUPER",
			action = Wezterm.action.ActivateTab(6),
		},
		{
			key = "8",
			mods = "SUPER",
			action = Wezterm.action.ActivateTab(7),
		},
		{
			key = "9",
			mods = "SUPER",
			action = Wezterm.action.ActivateTab(8),
		},
	}
end
local function getLinux()
	return {
		{
			key = "1",
			mods = "CTRL",
			action = Wezterm.action.ActivateTab(0),
		},
		{
			key = "2",
			mods = "CTRL",
			action = Wezterm.action.ActivateTab(1),
		},
		{
			key = "3",
			mods = "CTRL",
			action = Wezterm.action.ActivateTab(2),
		},
		{
			key = "4",
			mods = "CTRL",
			action = Wezterm.action.ActivateTab(3),
		},
		{
			key = "5",
			mods = "CTRL",
			action = Wezterm.action.ActivateTab(4),
		},
		{
			key = "6",
			mods = "CTRL",
			action = Wezterm.action.ActivateTab(5),
		},
		{
			key = "7",
			mods = "CTRL",
			action = Wezterm.action.ActivateTab(6),
		},
		{
			key = "8",
			mods = "CTRL",
			action = Wezterm.action.ActivateTab(7),
		},
		{
			key = "9",
			mods = "CTRL",
			action = Wezterm.action.ActivateTab(8),
		},
	}
end

return { getBase = getBase, getWindows = getWindows, getDarwin = getDarwin, getLinux = getLinux }
