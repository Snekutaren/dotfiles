#!/usr/bin/env bash

# Custom bash additions
alias ll='ls -lah'
alias lR='ls -laR'
alias lRl='ls -laR | less'
alias ssha='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/github/github_ed25519'
alias git-push-nixos='git -C ~/nixos-config checkout auto && git -C ~/nixos-config add . && (git -C ~/nixos-config commit -m "$(date)" || true) && git -C ~/nixos-config push'
alias git-push-dot='git -C ~/dotfiles checkout auto && git -C ~/dotfiles add . && (git -C ~/dotfiles commit -m "$(date)" || true) && git -C ~/dotfiles push'
alias git-push-comfyui='git -C ~/comfyui checkout auto && git -C ~/comfyui add . && (git -C ~/comfyui commit -m "$(date)" || true) && git -C ~/comfyui push'
alias update-flake='sudo nix flake update --flake ~/nixos-config -v'
alias build-nix='sudo nixos-rebuild switch --flake ~/nixos-config -v'
alias build-nix-dry='sudo nixos-rebuild dry-activate --flake ~/nixos-config -v'
alias push-build-nix='update-flake && git-push-dot && build-nix && git-push-nixos' # need to change this to only push if valid flake
alias comfyui='nix develop ~/comfyui/nix'
alias reload-conf='source ~/.bashrc && echo "Bash configuration reloaded." && hyprctl reload && echo "Hyprland configuration reloaded."'

# PATH
export PATH="$HOME/.local/bin:$PATH"