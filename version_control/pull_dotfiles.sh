#!/bin/bash

REPO_URL="git@github.com:erupturatis/.dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

  # Using the full command instead of the alias to pull changes, including submodules
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull --force --recurse-submodules origin master

/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME gc
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME prune

echo "Dotfiles have been successfully updated."

