#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar3.log
# polybar mainbar-left -c ~/.config/polybar/t4Linux.ini 2>&1 | tee -a /tmp/polybar1.log &
polybar workspaces -c ~/.config/polybar/t4Linux.ini 2>&1 &
polybar date -c ~/.config/polybar/t4Linux.ini 2>&1 &
polybar mainbar-right -c ~/.config/polybar/t4Linux.ini 2>&1 &
polybar tray -c ~/.config/polybar/t4Linux.ini 2>&1 &
polybar update -c ~/.config/polybar/t4Linux.ini 2>&1 &
polybar volume -c ~/.config/polybar/t4Linux.ini 2>&1 &
polybar mainbar-right-4 -c ~/.config/polybar/t4Linux.ini 2>&1 &
# disown
# polybar bar2 2>&1 | tee -a /tmp/polybar2.log &
# disown
if [[ $(xrandr -q | grep 'DP-2 connected') ]]; then
	polybar workspaces-DP-2 -c ~/.config/polybar/t4Linux.ini 2>&1 &
	polybar date-DP-2 -c ~/.config/polybar/t4Linux.ini 2>&1 &
fi
echo "Bars launched..."
