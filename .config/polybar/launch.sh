#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

polybar main &
# sleep 0.3 
# polybar bottom &


