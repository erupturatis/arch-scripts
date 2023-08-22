#!/bin/bash

# Initialize bare repository in ~/.dotfiles
git init --bare ~/.dotfiles

# Set up alias for dotfiles management
echo 'alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> ~/.bashrc
source ~/.bashrc

# Configure Git behavior
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config status.showUntrackedFiles no

# Clone dotfiles repository
git clone git@github.com:erupturatis/.dotfiles.git $HOME/.dotfiles

# Checkout dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout --force

# Initialize and update submodules
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME submodule update --init --recursive --force

echo "Dotfiles have been successfully set up and configured."
