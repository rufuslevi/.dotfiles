#!/usr/bin/env zsh

toggledarkmode() {
	# What OS are we running?
	if [[ $(uname) == "Darwin" ]]; then
		# echo "Running MacOS!"
		osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to not dark mode'
	elif command -v apt >/dev/null; then
		echo "Running Debian based Linux!"

	elif command -v nix >/dev/null; then
		echo "Running NixOS based Linux!"
	else
		echo "Running Windows!"
	fi

}

(return 0 2>/dev/null) && echo "" || toggledarkmode
