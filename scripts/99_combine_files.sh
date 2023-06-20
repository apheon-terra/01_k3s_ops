#!/bin/bash

file1="$1"  # First input file
file2="$2"  # Second input file
output_file="combined.txt"  # Output file

# Check if both input files are provided
if [ -z "$file1" ] || [ -z "$file2" ]; then
  echo "Please provide both input files."
  exit 1
fi

# Check if input files exist
if [ ! -f "$file1" ] || [ ! -f "$file2" ]; then
  echo "One or both input files do not exist."
  exit 1
fi

# Combine lines from both input files
paste -d '\n' "$file1" "$file2" > "$output_file"

echo "Output file '$output_file' created."
