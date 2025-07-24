#!/usr/bin/env bash

# Custom bash additions
alias ll='ls -lah'
alias lR='ls -laR'
alias lRl='ls -laR | less'
alias ssha='~/git/dotfiles/bash/ssh-agent_addkey.sh'
alias buildnix='git -C ~/git/nixos-config commit -am "$(date)" && sudo nix flake update --flake ~/git/nixos-config -vv && sudo nixos-rebuild switch --flake ~/git/nixos-config'
alias buildnix_dry="sudo nixos-rebuild dry-run --flake ~/git/nixos-config -vv"

# Start ssh-agent if not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/github/github_ed25519
fi

# PATH
export PATH=$HOME/.local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

