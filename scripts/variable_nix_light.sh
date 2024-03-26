#!/usr/bin/env bash

VARIABLES_FILE=$HOME/.dotfiles/nixos/variables.nix
echo "Switching to light-mode."
sed -i.bak 's/darkmode = true/darkmode = false/g' $VARIABLES_FILE
sudo nixos-rebuild switch --flake ~/.dotfiles
