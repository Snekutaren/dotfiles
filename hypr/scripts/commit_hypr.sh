#!/usr/bin/env bash
set -euo pipefail

# TEST
echo "TEST $(date)" >> /tmp/hypr_commit_test.log
export SSH_AUTH_SOCK="/tmp/ssh-XXXXXXK6K1YX/agent.3373"

# Script to edit hyprland.conf and auto commit with timestamp

CONF="$HOME/git/dotfiles/hypr/hyprland.conf"
REPO="$HOME/git/dotfiles"
BRANCH="auto"
SSH_KEY="$HOME/.ssh/github/github_ed25519"

# Start ssh-agent if not running and add key
if [ -z "${SSH_AUTH_SOCK:-}" ]; then
  eval "$(ssh-agent -s)"
  ssh-add "$SSH_KEY"
fi

# Open file in EDITOR (fallback to nvim or nano)
${EDITOR:-nvim} "$CONF"

cd "$REPO"

# Switch to auto branch (create if it doesn't exist)
if git show-ref --quiet refs/heads/$BRANCH; then
  git checkout $BRANCH
else
  git checkout -b $BRANCH
fi

# Commit with current date-time as message
COMMIT_MSG="auto: $(date '+%Y-%m-%d %H:%M:%S')"
git add "$CONF"
git commit -m "$COMMIT_MSG"

# Push to remote branch
git push -u origin $BRANCH

echo "✅ Changes committed with message: '$COMMIT_MSG' and pushed to '$BRANCH'."
