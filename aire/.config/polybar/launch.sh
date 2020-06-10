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

# monitor (leave empty for default)
export BAR_MONITOR=""

# kill existing bars (alternatively, `polybar-msg cmd quit`)
pkill polybar

### LAUNCH BARS
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

# Launch bar1
polybar -r standard_bar >> /tmp/polybar1.log 2>&1 &
ln -sf /tmp/polybar_mqueue.$! /tmp/ipc-bar1

# Launch bar2
polybar -r focus_bar >> /tmp/polybar2.log 2>&1 &
ln -sf /tmp/polybar_mqueue.$! /tmp/ipc-bar2

# hide bar2
(sleep 0.2 && echo 'cmd:hide' >/tmp/ipc-bar2) &

echo "bars launched"
