#!/bin/bash

folder="$1"

# Check if the folder argument is provided
if [ -z "$folder" ]; then
  echo "Please provide the folder path as an argument."
  exit 1
fi

# Check if the folder exists
if [ ! -d "$folder" ]; then
  echo "Folder does not exist: $folder"
  exit 1
fi

# Recursive function to check and delete empty files
check_and_delete_empty_files() {
  local dir=$1

  # Iterate over files and directories
  for item in "$dir"/*; do
    if [ -f "$item" ] && [ ! -s "$item" ]; then
      echo "Deleting empty file: $item"
      rm "$item"
    elif [ -d "$item" ]; then
      check_and_delete_empty_files "$item"  # Recursive call for subdirectories
    fi
  done
}

# Start checking and deleting empty files
check_and_delete_empty_files "$folder"
