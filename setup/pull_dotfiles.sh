#!/bin/bash

REPO_URL="git@github.com:erupturatis/.dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

# Check if the .dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
  git clone --bare $REPO_URL $DOTFILES_DIR
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config status.showUntrackedFiles no
else
  # Using the full command instead of the alias
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull origin master
fi

/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME gc
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME prune

echo "Dotfiles have been successfully updated."
