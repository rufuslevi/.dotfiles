#!/bin/bash

YABAI_SPACE_MODE=$(yabai -m query --spaces --space | jq -r '.type')
echo $YABAI_SPACE_MODE

if [ "$YABAI_SPACE_MODE" = 'bsp' ]; then
	osascript -e 'display notification "Turned off yabai handling" with title "Yabai"'
else
	osascript -e 'display notification "Turned on yabai handling" with title "Yabai"'
fi
