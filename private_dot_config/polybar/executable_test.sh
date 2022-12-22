#!/bin/bash


if [[ $(xrandr -q | grep "DP-2 connected") ]]; then
  echo "test"
fi
