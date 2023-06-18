#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

polybar i3_bar &
# sleep 0.3 
# polybar bottom &


