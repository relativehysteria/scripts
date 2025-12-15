#!/bin/sh

power_dir="/sys/class/power_supply/BAT0"
! [ -d "$power_dir" ] && exit

cap=$(cat "$power_dir/capacity")
stat=$(cat "$power_dir/status")

echo -ne "\033[1m$cap%\033[0m"
echo " $stat"

energy_now="$power_dir/energy_now"
power_now="$power_dir/power_now"

if [ -r "$energy_now" ] && [ -r "$power_now" ]; then
    en=$(cat "$energy_now")
    pw=$(cat "$power_now")
    [ "$pw" -gt 0 ] && time=$(awk "BEGIN { printf \"%.1f\", $en / $pw }")
    echo "$time hours until empty"
fi
