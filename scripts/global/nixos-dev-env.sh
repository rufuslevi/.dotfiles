#!/usr/bin/env bash

dev() {
	nix-shell ~/.config/scripts/shell.nix
}

(return 0 2>/dev/null) && echo "" || dev
