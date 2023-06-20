#!/bin/bash

# Check if a file is provided as an argument
if [ $# -eq 0 ]; then
  echo "Please provide a file as an argument."
  exit 1
fi

input_file="$1"
output_file="output.txt"

# Extract comments starting with '# 01_command' and save them to the output file
grep -E '^# 01_command' "$input_file" > "$output_file"

# Modify the extracted lines in the output file
sed -i 's/^# 01_command\(\/[0-9a-zA-Z_\/.-]*\)/\1/' "$output_file"

echo "Extraction and modification complete. Result saved in $output_file."
