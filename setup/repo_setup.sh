#!/bin/bash

# Initialize a bare repository for dotfiles
git init --bare $HOME/.dotfiles

# Configure the repository to not show untracked files in status
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config status.showUntrackedFiles no

# Add the remote origin to the repository
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME remote add origin git@github.com:erupturatis/.dotfiles.git

# Fetch and forcefully reset to the latest changes from the remote repository
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME fetch origin
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME reset --hard origin/master

echo "Repository setup and updates have been applied."
