#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Usage: bash encode_values.sh <input_file> <output_file>"
  exit 1
fi

input_file="$1"
output_file="$2"

if [ ! -f "$input_file" ]; then
  echo "Error: File not found: $input_file"
  exit 1
fi

while IFS=':' read -r key value; do
  # Trim leading/trailing whitespace from key and value
  key=$(echo "$key" | awk '{$1=$1};1')
  value=$(echo "$value" | awk '{$1=$1};1')

  # Base64 encode the value
  encoded_value=$(echo -n "$value" | base64 -w 0)

  echo "$key: $encoded_value" >> "$output_file"
done < "$input_file"
