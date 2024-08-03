#!/bin/bash

YABAI_WINDOW_MODE=$(yabai -m query --windows --window | jq -r '."is-floating"')
echo $YABAI_WINDOW_MODE

if [ "$YABAI_WINDOW_MODE" = 'true' ]; then
	echo "floating"
	osascript -e 'display notification "Enabled floating" with title "Yabai"'
else
	echo "not floating"
	osascript -e 'display notification "Disabled floating" with title "Yabai"'
fi
