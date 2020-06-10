#!/usr/bin/env bash

## Variables
# network iface 
export DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

# hwmon path
CORETEMP_FILE="Package"
for i in /sys/class/hwmon/hwmon*/temp*_input; do 
    FN="$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))"
    if [[ $FN =~ $CORETEMP_FILE ]]; then
        export HWMON_PATH="$i"
    fi
done

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

### LAUNCH BARS
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

# Launch bar1
polybar -r mystatus >> /tmp/polybar1.log 2>&1 &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-mybar1

# Launch bar2
# polybar -r mystatus >> /tmp/polybar2.log 2>&1 &
# ln -s /tmp/polybar_mqueue.$! /tmp/ipc-mybar2

echo "bars launched"
