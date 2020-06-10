# aire

new rice

## setup

the installer will install packages and stow the configuration files.

### prerequisites

install:
+ `git`
+ `stow`
+ `python-sh` (`pip install sh` on non-Arch distros)

### installer

use the installer script to manage installation:
```sh
# to install
./script/manage.sh install
# uninstall
./script/manage.sh uninstall
```

### wallpaper
place the wallpaper at `~/Pictures/wallpaper.[png|jpg]`
```sh
# configure wallpaper
nitrogen ~/Pictures
```

### dependencies
+ `i3-gaps`, `i3lock-color`
+ `polybar`
+ `kitty`
+ `rofi`
+ `dunst`
+ `picom-tryone-git`
+ `nitrogen`
+ `feh`
+ `sxiv`
+ `xdotool`
+ `unclutter`
+ `xautolock`
+ `mpc`
+ `python`
+ `ruby`
+ `playerctl`
+ `pass`
+ `betterlockscreen`
+ `redshift` (optional)
+ `xava` (optional)
+ `niacop` (optional)
+ `spicetify-cli`, `spicetify-themes-git` (optional)

## configuration

### temperature

+ update the `CORETEMP_FILE` variable in `~/.config/polybar/launch.sh` to the correct [hwmon file](https://github.com/polybar/polybar/issues/2078#issuecomment-620630184).

### pulseaudio

+ update the `PULSE_SINK` variable `~/.config/polybar/launch.sh` to the correct pulseaudio sink.

### hidpi
to enable HIDPI support in GTK/Qt apps:
+ uncomment the `scaling` section in `~/.xprofile`.
+ in `~/.Xresources.reis` update `*.dpi`.

## optional extensions

### xava
customize the window to fit your desktop resolution:
+ edit `width` and `height` under `[window]`

### spicetify
see [spicetify-cli documentation](https://github.com/khanhas/spicetify-cli/wiki/Basic-Usage)

## keybindings

use the `Shift+Super+/` keybind to pull up the i3 keybindings list.
