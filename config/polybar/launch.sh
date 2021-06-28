#!/bin/bash

# Terminate already running bar instances
# killall -q polybar

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar base &

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
DISPLAY1="$(xrandr -q | grep 'XWAYLAND' | cut -d ' ' -f1)"
[[ ! -z "$DISPLAY1" ]] && MONITOR="$DISPLAY1" polybar base &

# DISPLAY2="$(xrandr -q | grep 'XWAYLAND' | cut -d ' ' -f1)"
# [[ ! -z $DISPLAY2 ]] && MONITOR=$DISPLAY2 polybar top2 &

echo "Bars launched..."
