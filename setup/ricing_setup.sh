#!/bin/bash
#
yay -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
yay -S xcompmgr
setsid xcompmgr &
yay -S python-pywal
xwallpaper --zoom ./wallpapers/wallpaper.png
wal -i ./wallpapers/wallpaper.png
sudo chsh /usr/bin/zsh


