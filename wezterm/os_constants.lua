local keymaps = require("keymaps")

local function updateConstants(constants)
	for _, v in ipairs(keymaps.getBase()) do
		table.insert(constants.KEYS, v)
	end

	if os.execute("cd C:/WINDOWS") then
		Wezterm.log_info("Running on Windows!")
		constants.SHELL = "C:/Program Files/nu/bin/nu.exe"

		constants.FONT_SIZE = 11
		constants.OPACITY = 1
		constants.WINDOW_DECORATIONS = "TITLE"
		constants.INTEGRATED_BUTTONS = "Windows"

		for _, v in ipairs(keymaps.getWindows()) do
			table.insert(constants.KEYS, v)
		end
	elseif not os.execute("cd /Applications") then
		Wezterm.log_info("Running on Linux!")

		constants.SHELL = "zsh"
		constants.FONT_SIZE = 10.5
		constants.FONT_FAMILY = "MonaspiceNe Nerd Font Mono"
		constants.OPACITY = 1
		constants.UP_PADDING = 10
		constants.WINDOW_DECORATIONS = "TITLE|RESIZE"
		constants.INTEGRATED_BUTTONS = "Gnome"
		constants.LEADER = {
			key = "/",
			mods = "CTRL",
			timeout_milliseconds = 1000,
		}

		for _, v in ipairs(keymaps.getLinux()) do
			table.insert(constants.KEYS, v)
		end
	else
		Wezterm.log_info("MacOS!")

		constants.WINDOW_DECORATIONS = "TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
		constants.INTEGRATED_BUTTONS = "MacOsNative"

		for _, v in ipairs(keymaps.getDarwin()) do
			table.insert(constants.KEYS, v)
		end
	end

	return constants
end

return { updateConstants = updateConstants }
