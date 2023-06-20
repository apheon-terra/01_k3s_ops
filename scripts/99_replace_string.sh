#!/bin/bash

folder="$1"     # Folder path as first argument
search="$2"     # String to search for as second argument
replace="$3"    # String to replace with as third argument

# Recursively search for files named "ks.yaml" in the specified folder
find "$folder" -name "ks.yaml" -type f | while IFS= read -r file; do
    # Check if the file contains the search string
    if grep -qF "$search" "$file"; then
        # Replace the search string with the replace string in the file
        sed -i "s/$search/$replace/g" "$file"
        echo "Replaced '$search' with '$replace' in file: $file"
    fi
done
