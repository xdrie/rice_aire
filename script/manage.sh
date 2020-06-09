#!/usr/bin/env bash

# stow the config files
stow -v -R -t $HOME reis

# install the dependencies
yay -S --needed\
    i3-gaps i3lock-color polybar kitty rofi dunst picom-tryone-git nitrogen feh sxiv xdotool betterlockscreen\
    ttf-material-design-icons ttf-input otf-nerd-fonts-fira-code nerd-fonts-fira-mono noto-fonts \
    unclutter xautolock mpc playerctl pass\
    ruby python python-dbus python-sh python-gobject\
