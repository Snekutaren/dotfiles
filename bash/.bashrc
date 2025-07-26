#!/usr/bin/env bash

# Custom bash additions
alias ll='ls -lah'
alias lR='ls -laR'
alias lRl='ls -laR | less'
alias ssha='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/github/github_ed25519'
alias commit_nixos='git -C ~/git/nixos-config add . && (git -C ~/git/nixos-config commit -m "$(date)" || true) && git -C ~/git/nixos-config push'
alias commit_dot='git -C ~/git/dotfiles add . && (git -C ~/git/dotfiles commit -m "$(date)" || true) && git -C ~/git/dotfiles push'
alias build_nix='sudo nix flake update --flake ~/git/nixos-config -vvv && sudo nixos-rebuild switch --flake ~/git/nixos-config -vvv'
alias build_nix_dry="sudo nixos-rebuild dry-run --flake ~/git/nixos-config -vvv"

# PATH
export PATH=$HOME/.local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

