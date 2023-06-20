#!/bin/bash
file="$1"
output_file="decoded_secrets.txt"

while IFS= read -r line; do
  if [[ $line =~ export\ ([A-Za-z_]+)=\ *\"?([^\" ]*)\"? ]]; then
    variable="${BASH_REMATCH[1]}"
    secret="${BASH_REMATCH[2]}"
    encoded_secret=$(echo -n "$secret" | base64 -d)
    encoded_line="export $variable=\"$encoded_secret\""
    echo "$encoded_line" >> "$output_file"
  fi
done < "$file"

echo "Base64 encoding completed. Encoded secrets saved in $output_file."
