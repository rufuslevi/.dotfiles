local workspaces = {
	{
		id = "fun",
		label = Wezterm.format({
			{ Attribute = { Intensity = "Bold" } },
			{ Foreground = { AnsiColor = "Fuchsia" } },
			{ Text = "fun" },
		}),
	},
	{
		id = "domum",
		label = Wezterm.format({
			{ Attribute = { Intensity = "Bold" } },
			{ Foreground = { AnsiColor = "Black" } },
			{ Text = "domum" },
		}),
		tabs = {
			{
				title = "SSH - domum",
				args = { "ssh", "domum" },
			},
		},
	},
	{
		id = ".dotfiles",
		label = Wezterm.format({
			{ Attribute = { Italic = true } },
			{ Foreground = { AnsiColor = "Blue" } },
			{ Text = ".dotfiles" },
		}),
		cwd = Wezterm.home_dir .. "/.dotfiles",
		tabs = {
			{
				title = "Folder",
			},
			{
				title = "nvim",
				args = { "nvim", "." },
				toActivate = true,
			},
		},
	},
	{
		id = "inf8480",
		label = Wezterm.format({
			{ Attribute = { Italic = true } },
			{ Foreground = { AnsiColor = "Blue" } },
			{ Text = "inf8480" },
		}),
		cwd = Wezterm.home_dir .. "/Developer/poly/inf8480",
	},
}

local function generateWorkspace(inner_window, inner_pane, id)
	local workspace
	for _, w in pairs(workspaces) do
		if w.id == id then
			workspace = w
		end
	end

	if not workspace.cwd then
		workspace.cwd = Wezterm.home_dir
	end

	inner_window:perform_action(
		Wezterm.action.Multiple({
			Wezterm.action.SwitchToWorkspace({
				name = id,
				spawn = {
					cwd = workspace.cwd,
				},
			}),
			Wezterm.action.ClearScrollback("ScrollbackAndViewport"),
		}),
		inner_pane
	)

	local muxWindow
	for _, w in pairs(Wezterm.mux.all_windows()) do
		if w:get_workspace() == id then
			muxWindow = w
			break
		end
	end
	local guiWindow = muxWindow:gui_window()

	if not workspace.tabs then
		return
	end

	for i, tab in pairs(workspace.tabs) do
		local muxTab
		if i ~= 1 then
			muxTab, _, _ = muxWindow:spawn_tab({
				cwd = tab.cwd,
				args = tab.args,
			})
		else
			muxTab = muxWindow:tabs()[1]
			local pane = muxTab:panes()[1]

			if tab.args then
				local command = ""
				for _, arg in pairs(tab.args) do
					command = command .. " " .. arg
				end

				guiWindow:perform_action(
					Wezterm.action.Multiple({
						Wezterm.action.SendString(command),
						Wezterm.action.SendKey({
							key = "Enter",
						}),
					}),
					pane
				)
			end
		end

		if tab.title then
			muxTab:set_title(tab.title)
		end

		if tab.toActivate then
			muxTab:activate()
		end
	end
end

local function switchToWorkspace(window, pane, id)
	window:perform_action(
		Wezterm.action.SwitchToWorkspace({
			name = id,
		}),
		pane
	)

	Wezterm.log_info("Selected ", id)
end

local function selectWorkspace(window, pane)
	local choices = {}
	local currentWindows = Wezterm.mux.all_windows()

	for _, workspace in pairs(workspaces) do
		table.insert(choices, {
			id = workspace.id,
			label = workspace.label,
		})
	end

	for _, w in pairs(currentWindows) do
		local workspaceDefined = false
		for _, choice in pairs(choices) do
			if w:get_workspace() == choice.id then
				workspaceDefined = true
			end
		end

		if not workspaceDefined then
			table.insert(choices, {
				id = w:get_workspace(),
				label = w:get_workspace(),
			})
		end
	end

	window:perform_action(
		Wezterm.action.InputSelector({
			action = Wezterm.action_callback(function(inner_window, inner_pane, id, _)
				if id == nil then
					Wezterm.log_info("Cancelled!")
				else
					local workspaceAlreadyOpen = false
					for _, w in pairs(Wezterm.mux.all_windows()) do
						if w:get_workspace() == id then
							workspaceAlreadyOpen = true
							break
						end
					end
					print(workspaceAlreadyOpen)

					if workspaceAlreadyOpen then
						switchToWorkspace(inner_window, inner_pane, id)
					end
					if not workspaceAlreadyOpen then
						generateWorkspace(inner_window, inner_pane, id)
					end
					Wezterm.reload_configuration()
				end
			end),
			title = "Workspace selection",
			choices = choices,
			alphabet = "123456789",
			description = "Write the number you want to choose or press / to search.",
			fuzzy_description = "Fuzzy find and/or make a workspace : ",
		}),
		pane
	)
end

return { selectWorkspace = selectWorkspace }
