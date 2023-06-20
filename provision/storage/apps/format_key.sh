#!/bin/bash

# Example private key
private_key=$(cat <<EOF

EOF
)

# Remove line breaks and leading/trailing whitespace
formatted_key=$(echo "$private_key" | tr -d '\n' | awk '{$1=$1};1')

# Output the formatted key to a file
echo "$formatted_key" > formatted_private_key_2

# Print a success message
echo "Formatted private key has been saved to formatted_private_key.txt"
