#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

sketchybar --set $NAME label="$(aerospace list-workspaces --focused)"
