#!/usr/bin/env bash
# Startup script for waybar
# Kills any current running instances, starts a new one

killall .waybar-wrapped

waybar &
