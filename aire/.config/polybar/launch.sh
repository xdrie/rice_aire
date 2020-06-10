#!/usr/bin/env bash

## Variables
# network iface 
export DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

# pulseaudio sink (find using `pacmd list-sinks | grep name`)
export PULSE_SINK="alsa_output.pci-0000_1e_00.3.analog-stereo"

# hwmon path
CORETEMP_FILE="Package"
for i in /sys/class/hwmon/hwmon*/temp*_input; do 
    FN="$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))"
    if [[ $FN =~ $CORETEMP_FILE ]]; then
        export HWMON_PATH="$i"
    fi
done

# monitor
export BAR_MONITOR=""

# kill existing bars (alternatively, `polybar-msg cmd quit`)
killall -q polybar

### LAUNCH BARS
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

# Launch bar1
polybar -r thestatus1 >> /tmp/polybar1.log 2>&1 &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-mybar1

# Launch bar2
# polybar -r mystatus >> /tmp/polybar2.log 2>&1 &
# ln -s /tmp/polybar_mqueue.$! /tmp/ipc-mybar2

echo "bars launched"
