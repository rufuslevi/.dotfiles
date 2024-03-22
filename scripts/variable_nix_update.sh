#!/usr/bin/env bash

VARIABLES_FILE=./variables.nix
if grep -q "darkmode = true;" $VARIABLES_FILE; then
	echo "Currently dark-mode. Switching to light-mode."
	sed -i.bak 's/darkmode = true/darkmode = false/g' $VARIABLES_FILE
else
	echo "Currently light-mode. Switching to dark-mode."
	sed -i.bak 's/darkmode = false/darkmode = true/g' $VARIABLES_FILE
fi
