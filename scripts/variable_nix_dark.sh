#!/usr/bin/env bash

VARIABLES_FILE=$HOME/.dotfiles/variables.nix
echo "Switching to dark-mode."
sed -i.bak 's/darkmode = false/darkmode = true/g' $VARIABLES_FILE
sudo nixos-rebuild switch --flake .
