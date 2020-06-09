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
# Launch general app                     #
##########################################

## Special
if testcmd redshift; then
    redshift &
fi

if testcmd niacop; then
    # run niacop tracker (with delay)
    (sleep 15 && $HOME/.bin/niacop activity >> ~/.log/niacop/niacop.log) &
fi
