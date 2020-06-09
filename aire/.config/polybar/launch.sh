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

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar -r mystatus >> /tmp/polybar1.log 2>&1 &
# polybar bar2 >>/tmp/polybar2.log 2>&1 &

echo "bars launched"
