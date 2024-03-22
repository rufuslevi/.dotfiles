local keymaps = require("./keymaps")

for _, v in ipairs(keymaps.getBase()) do
	table.insert(KEYS, v)
end

if os.execute("cd C:/WINDOWS") then
	Wezterm.log_info("Running on Windows!")
	SHELL = "C:/Program Files/nu/bin/nu.exe"

	FONT_SIZE = 11
	OPACITY = 1
	WINDOW_DECORATIONS = "TITLE"
	INTEGRATED_BUTTONS = "Windows"

	for _, v in ipairs(keymaps.getWindows()) do
		table.insert(KEYS, v)
	end
elseif not os.execute("cd /Applications") then
	Wezterm.log_info("Running on Linux!")

	SHELL = "zsh"
	FONT_SIZE = 10.5
	FONT_FAMILY = "MonaspiceNe Nerd Font Mono"
	OPACITY = 1
	UP_PADDING = 10
	WINDOW_DECORATIONS = "TITLE|RESIZE"
	INTEGRATED_BUTTONS = "Gnome"
	LEADER = {
		key = "/",
		mods = "CTRL",
		timeout_milliseconds = 1000,
	}

	for _, v in ipairs(keymaps.getLinux()) do
		table.insert(KEYS, v)
	end
else
	Wezterm.log_info("MacOS!")

	WINDOW_DECORATIONS = "TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
	INTEGRATED_BUTTONS = "MacOsNative"

	for _, v in ipairs(keymaps.getDarwin()) do
		table.insert(KEYS, v)
	end
end
