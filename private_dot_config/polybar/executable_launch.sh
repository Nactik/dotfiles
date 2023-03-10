#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# wait until processes have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar 
polybar -c ~/.config/polybar/config.ini top 2>~/.config/polybar/top.log & 

if [[ $(xrandr -q | grep "DP-2 connected") ]]; then
  polybar -c ~/.config/polybar/config.ini external 2>~/.config/polybar/external.log & 
fi
