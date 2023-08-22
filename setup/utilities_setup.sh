#!/bin/bash

# setting up gitC 
GITC_PATH="$HOME/arch-scripts/utilities/gitC.sh"
sudo rm -f /usr/local/bin/gitC
sudo ln -s $GITC_PATH /usr/local/bin/gitC
chmod +x $GITC_PATH

# set up caps lock as hero key
xmodmap -e "clear lock"
xmodmap -e "keycode 66 = Super_L"


