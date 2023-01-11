#!/bin/bash

internal_monitor="eDP-1"
external_monitor="DP-2"

monitor_add() {

  desktops=5 # How many desktopo to move to 2nd monitor

  bspc monitor "$external_monitor" -a Desktop
  
  for desktop in $(bspc query -D --names -m "$internal_monitor" | sed "$desktops"q); do
    bspc desktop "$desktop" --to-monitor "$external_monitor"
  done

  bspc desktop Desktop --remove
  bspc wm -O "$external_monitor" "$internal_monitor"
}


monitor_remove() {
  # Temp desktop because one desktop is require per monitor
  # bspc monitor $internal_monitor -a Desktop
  
  # for desktop in $(bspc query -D -m $internal_monitor)
  # do
  #  bspc desktop $desktop --to-monitor $external_monitor
  # done
  
  bspc monitor "$external_monitor" -a Desktop

  for desktop in $(bspc query -D -m "$external_monitor"); do
    bspc desktop "$desktop" --to-monitor "$internal_monitor"
  done 

  bspc desktop Desktop --remove
  bspc monitor "$internal_monitor" -o 1 2 3 4 5 6 7 8 9 0

}

## Main setup

if [[ $(xrandr -q | grep "DP-2 connected") ]]; then
  monitor_add
else 
  monitor_remove
fi


feh --bg-center ~/.config/wallpaper/wall.png &
~/.config/polybar/launch.sh
