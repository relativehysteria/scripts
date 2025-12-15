#!/bin/sh

power_file="/sys/class/power_supply/BAT0/capacity"
! [ -f "$power_file" ] && exit
cat "$power_file"
