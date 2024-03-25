#!/usr/bin/env bash

COUNT=$(dunstctl count waiting)
ENABLED=""
DISABLED=""
if [ $COUNT != 0 ]; then DISABLED=""; fi
if dunstctl is-paused | grep -q "false"; then echo "{\"text\":\"${ENABLED}\", \"class\":\"dunst\"}"; else echo "{\"text\":\"${DISABLED}\",\"class\":\"dunst\"}"; fi
