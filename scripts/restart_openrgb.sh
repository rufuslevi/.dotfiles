#!/usr/bin/env bash

killall -w .openrgb-wrapped &&
  nohup openrgb --startminimized &>/dev/null &
