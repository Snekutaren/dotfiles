#!/usr/bin/env bash
set -euo pipefail

# Prompt for inputs
read -p "Name of age-file (e.g., tellus): " USERNAME
read -p "File prefix (optional, press Enter to skip): " PREFIX

# Generate hashed password
echo "Password to be hashed:"
PASSWORD=$(mkpasswd -m sha-512)

# Create output filename
OUTPUT_DIR="${HOME}/nixos-config/secrets"
mkdir -p "$OUTPUT_DIR"
FILENAME="${PREFIX:+${PREFIX}-}${USERNAME}.age"  # Adds prefix only if defined

# Encrypt with age
echo "$PASSWORD" | age --encrypt -r "$(cat ~/.config/age/age.pub)" > "${OUTPUT_DIR}/${FILENAME}"

# Verify
if [[ -f "${OUTPUT_DIR}/${FILENAME}" ]]; then
    echo "Success! Encrypted file saved to: ${OUTPUT_DIR}/${FILENAME}"
else
    echo "Error: Failed to create encrypted file" >&2
    exit 1
fi
