#!/usr/bin/env bash

sudo killall -w .openrgb-wrapped
nohup openrgb --startminimized &>/dev/null &
