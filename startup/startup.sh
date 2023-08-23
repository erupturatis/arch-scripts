#!/bin/bash
echo "Your custom commands here"

# ricing
wal -R
setsid xcompmgr &

# keybinds setup
xmodmap -e "clear lock"
xmodmap -e "keycode 66 = Super_L"

# other

echo "SCRIPT RUNNING HERE"

