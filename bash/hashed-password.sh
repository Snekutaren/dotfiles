#!/usr/bin/env bash
set -euo pipefail  # Better error handling

# Prompt for username
read -p "Name of age-file (e.g., tellus): " USERNAME

# Generate hashed password
echo "Password to be hashed:"
PASSWORD=$(mkpasswd -m sha-512)

# Create secrets directory if it doesn't exist
OUTPUT_DIR="${HOME}/nixos-config/secrets"
mkdir -p "$OUTPUT_DIR"

# Encrypt with age
echo "$PASSWORD" | age --encrypt -r "$(cat ~/.config/age/age.pub)" > "${OUTPUT_DIR}/nixrog-${USERNAME}.age"

# Verify file was created
if [[ -f "${OUTPUT_DIR}/nixrog-${USERNAME}.age" ]]; then
    echo "Success! Encrypted file saved to: ${OUTPUT_DIR}/nixrog-${USERNAME}.age"
else
    echo "Error: Failed to create encrypted file" >&2
    exit 1
fi