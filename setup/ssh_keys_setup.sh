#!/bin/bash

# Check for existing SSH keys
if [ -f "$HOME/.ssh/id_rsa" ]; then
  echo "SSH key already exists. You can add it to your GitHub account manually."
  exit 1
fi

# Generate new SSH key
echo "Generating a new SSH key for GitHub..."
ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa" -C "your_email@example.com"
# Replace "your_email@example.com" with your email associated with your GitHub account

# Start the ssh-agent
eval "$(ssh-agent -s)"

# Add the new SSH key to the ssh-agent
ssh-add "$HOME/.ssh/id_rsa"

# Display the public key with instructions
echo "Your new SSH public key has been generated. Please add the following key to your GitHub account:"
cat "$HOME/.ssh/id_rsa.pub"
echo "You can copy the above key and add it manually to your GitHub account in Settings -> SSH and GPG keys -> New SSH key."
