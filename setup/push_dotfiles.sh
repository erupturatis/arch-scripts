#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="git@github.com:erupturatis/.dotfiles.git"

# Check if the .dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Dotfiles repository not found. Cloning..."
  git clone --bare $REPO_URL $DOTFILES_DIR
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config status.showUntrackedFiles no
fi

# Add changes to tracked files only
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add -u

# Add changes within submodules
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME submodule foreach 'git add . && git commit -m "Updating submodule bot"'


# Commit changes, including submodule references
commit_message="Updating dotfiles on $(date)"
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "$commit_message"

# Push changes, including submodule references
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push origin master

echo "Dotfiles and submodules have been successfully pushed."
