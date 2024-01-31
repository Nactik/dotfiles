#!/bin/zsh

# Terminate already running bar instances
killall -q polybar

external_monitor=$(xrandr --listactivemonitors | tail -n +2 | awk -F' ' '{ print $4 }' | grep -P '^(?!eDP-1).*$' | head -n 1)

# wait until processes have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar 
polybar -c ~/.config/polybar/config.ini top 2>~/.config/polybar/top.log & 

if [[ ! -z ${external_monitor} ]]; then
  last_monitor=$(cat ~/.config/polybar/last_monitor.txt | head -n 1)
  ## Replace last_monitor by current in polybar config
  sed -i "/eDP/! s/${last_monitor}/${external_monitor}/g" ~/.config/polybar/config.ini
  ## Update last_monitor
  echo $external_monitor > ~/.config/polybar/last_monitor.txt

  polybar -c ~/.config/polybar/config.ini external 2>~/.config/polybar/external.log & 
fi
