
## THIS LOGIC IS CRAP _ FIX IT
#!/usr/bin/env bash
set -euo pipefail

echo "Running ssh-agent_addkey.sh"


# Start ssh-agent if not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/github/github_ed25519
fi

echo "✅ ssh-agent_addkey.sh ran"

