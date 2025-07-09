#!/bin/bash
set -e

echo "Starting dotfiles bootstrap..."

# Copy bashrc additions
echo "Installing bash configs..."
bashrc_path="$HOME/.bashrc"
if ! grep -q '### custom bash additions ###' "$bashrc_path"; then
  echo -e "\n### custom bash additions ###" >> "$bashrc_path"
  cat bash/bashrc >> "$bashrc_path"
  echo "Appended custom bashrc additions"
else
  echo "Custom bashrc additions already present"
fi

# Run switch-to-fish script
bash bash/switch-to-fish.sh

echo "Bootstrap complete! Please restart your terminal or source ~/.bashrc"
