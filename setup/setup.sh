#!/bin/bash

BASE_PATH="$HOME/arch-scripts/setup"

# Installations
chmod +x "$BASE_PATH/installs_setup.sh"
source "$BASE_PATH/installs_setup.sh"

# Utilities
chmod +x "$BASE_PATH/utilities_setup.sh"
source "$BASE_PATH/utilities_setup.sh"

# SSH key setup
chmod +x "$BASE_PATH/ssh_keys_setup.sh"
source "$BASE_PATH/ssh_keys_setup.sh"

