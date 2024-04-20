#!/bin/bash

# Function to move files while appending if the target folder already exists
move_with_append() {
    source_dir=$1
    target_dir=$2

    # Loop through files in the source directory
    for file in "$source_dir"/*; do
        # Extract the file name
        filename=$(basename "$file")
        
        # Check if file already exists in target directory
        if [ -f "$target_dir/$filename" ]; then
            echo "File '$filename' already exists in '$target_dir', appending..."
            # Append the file using cat command
            cat "$file" >> "$target_dir/$filename"
        else
            # Move the file if it doesn't exist in the target directory
            mv "$file" "$target_dir"
        fi
    done
}

# URL of the first ZIP file
url1="https://mms.alliedmods.net/mmsdrop/2.0/mmsource-2.0.0-git1286-linux.tar.gz"

# Temporary directory for extraction
temp_dir1=$(mktemp -d)

# Download the first ZIP file
wget "$url1" -O file1.tar.gz

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Download successful for first file"

    # Extract contents to temporary directory
    tar -xzvf file1.tar.gz -C "$temp_dir1"

    # Move contents to target folder
    move_with_append "$temp_dir1" "${STEAMAPPDIR}/game/csgo"

    echo "Extraction and move for first file completed successfully"
else
    echo "Download failed for first file"
fi

# URL of the second ZIP file
url2="https://github.com/roflmuffin/CounterStrikeSharp/releases/download/v213/counterstrikesharp-with-runtime-build-213-linux-dfc9859.zip"

# Temporary directory for extraction
temp_dir2=$(mktemp -d)

# Download the second ZIP file
wget "$url2" -O file2.zip

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Download successful for second file"

    # Extract contents to temporary directory
    unzip file2.zip -d "$temp_dir2"

    # Move contents to target folder
    move_with_append "$temp_dir2" "${STEAMAPPDIR}/game/csgo"

    echo "Extraction and move for second file completed successfully"
else
    echo "Download failed for second file"
fi

# Clean up: remove the temporary directories and files
rm -rf "$temp_dir1" "$temp_dir2" file1.tar.gz file2.zip
