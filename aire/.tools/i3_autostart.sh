#!/usr/bin/env bash

set -x # log commands

testcmd () {
    command -v "$1" >/dev/null
}

## X config
xmodmap ~/.Xmodmap

## UI

## Wallpaper

# Restore Nitrogen
nitrogen --restore &

# betterlock recache
betterlockscreen -u ~/Pictures/wallpaper.* &

## X scripts
# Auto Lock
xautolock -time 10 -locker "$HOME/.tools/betterlock" -notify 10 -notifier 'dunstify -a "Auto-Lock" "locking screen in 10s"' -detectsleep &
# Hide mouse
unclutter &

## Compositing
# Picom
picom -b --experimental-backends &

##########################################
# Launch general apps                    #
##########################################

## Special
if testcmd redshift; then
    redshift &
fi

NIAPATH=$HOME/.bin/niacop
if test -f $NIAPATH; then
    # run niacop tracker (with delay)
    echo "$(date)" >> ~/.log/niacop/starts.log
    echo "starting niacop with delay"
    (sleep 5 && $NIAPATH activity >> ~/.log/niacop/niacop.log) &
else
    echo "niacop was not found"
fi
