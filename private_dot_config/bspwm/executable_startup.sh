#!/bin/bash

internal_monitor="eDP-1"
# external_monitor="DP-2" 
external_monitor=$(xrandr --listactivemonitors | tail -n +2 | awk -F' ' '{ print $4 }' | grep -P '^(?!eDP-1).*$' | head -n 1) 


monitor_add() {

  until [[ $(bspc query -M | wc -l) -eq 2 ]]
  do
    sleep 1
  done

  desktops=5 # How many desktopo to move to 2nd monitor

  # bspc monitor "$external_monitor" -a Desktop
  
  for desktop in $(bspc query -D --names -m "$internal_monitor" | tail -n $desktops); do
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
  ext_monitor=$(cat .config/bspwm/last_monitor.txt | head -1)
  bspc monitor "$ext_monitor" -a Desktop

  for desktop in $(bspc query -D --names -m "$ext_monitor"); do
    bspc desktop "$desktop" --to-monitor "$internal_monitor"
  done 

  bspc desktop "Desktop" -r
  bspc monitor "$ext_monitor" -r
}

if [[ $1 != "--reload" ]]; then 
  ## Main setup
  if [[ ! -z ${external_monitor} ]]; then
    echo "${external_monitor}" > ~/.config/bspwm/last_monitor.txt
    monitor_add
  else
    monitor_remove
  fi
fi


feh --bg-center ~/.config/wallpaper/wall.png &
~/.config/polybar/launch.sh
