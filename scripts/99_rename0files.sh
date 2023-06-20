#!/bin/bash

# Check if a folder path is provided as an argument
if [ $# -eq 0 ]; then
  echo "Please provide a folder path as an argument."
  exit 1
fi

folder_path="$1"

# Check if the folder exists
if [ ! -d "$folder_path" ]; then
  echo "Folder not found: $folder_path"
  exit 1
fi

# Move to the folder
cd "$folder_path" || exit 1

# Rename files in the folder
for file in *; do
  if [[ $file =~ ^[0-9]+:.* ]]; then
    new_name="${file#*:}"
    mv "$file" "$new_name"
    echo "Renamed $file to $new_name"
  fi
done

echo "File renaming complete."
