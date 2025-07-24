#!/usr/bin/env bash


# Custom bash additions
# Add your aliases and functions here
alias ll='ls -lah'
alias lR='ls -laR'
alias lRl='ls -laR | less'
alias ssha='~/git/dotfiles/bash/ssh-agent_addkey.sh'

# Start ssh-agent if not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/github/github_ed25519
fi

