#!/bin/bash
echo "Your custom commands here"

# ricing

# console color

wal -R
setsid xcompmgr &


# keybinds setup
xmodmap -e "clear lock"
xmodmap -e "keycode 66 = Super_L"

# screenshot

sxhkd &

xset -b

