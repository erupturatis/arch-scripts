#!/bin/bash

REPO_URL="git@github.com:erupturatis/.dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

# Check if the .dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Dotfiles repository not found. Cloning..."
  git clone --bare $REPO_URL $DOTFILES_DIR
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config status.showUntrackedFiles no
  
  # Force checkout to overwrite existing files
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout --force
  
  # Initialize and update submodules if the repo was newly cloned
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME submodule update --init --recursive
else
  # Using the full command instead of the alias to pull changes, including submodules
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull --recurse-submodules --force origin master
fi

/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME gc
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME prune

echo "Dotfiles have been successfully updated."
