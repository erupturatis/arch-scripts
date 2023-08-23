#!/bin/bash

# Check and install basic packages
for package in xclip neovim vim discord jetbrains-toolbox brave-bin npm xcompmgr; do
  if ! yay -Qq $package > /dev/null 2>&1; then
     
     yay -S $package 
  fi
done

# nvm setup
if ! command -v nvm &> /dev/null; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  source ~/.bashrc
  nvm install 18
  nvm alias default 18
fi

# Install dependencies for pyenv
deps="base-devel openssl zlib xz libffi sqlite tk git"
for package in $deps; do
  if ! yay -Qq $package > /dev/null 2>&1; then
     yay -S $package
  fi
done

# pyenv setup
if ! command -v pyenv &> /dev/null; then
  curl https://pyenv.run | bash
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init --path)"
  pyenv install 3.9.6
  pyenv global 3.9.6
fi

# Add nvm and pyenv to bashrc if not already there
if ! grep -q 'NVM_DIR' ~/.bashrc; then
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
fi

if ! grep -q 'pyenv init' ~/.bashrc; then
  echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
fi

# Bluetooth setup
bluetooth_packages="bluez bluez-utils blueman"
for package in $bluetooth_packages; do
  if ! yay -Qq $package > /dev/null 2>&1; then
     yay -S $package
  fi
done

sudo systemctl enable bluetooth
sudo systemctl start bluetooth

source ~/.bashrc

# maria db setup
chmod +x ./installs_setups/mariadb_install_setup.sh
source ./installs_setups/mariadb_install_setup.sh

# nvidia drivers

sudo pacman -Syu nvidia

echo "Installation complete!"


