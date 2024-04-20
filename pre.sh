#!/bin/bash

# URL of the tgz file
url="https://mms.alliedmods.net/mmsdrop/2.0/mmsource-2.0.0-git1286-linux.tar.gz"

# Temporary directory for extraction
temp_dir=$(mktemp -d)

# Download the tgz file
wget "$url" -O file.tar.gz

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Download successful"

    # Extract contents to temporary directory
    tar -xzvf file.tar.gz -C "$temp_dir"

    # Move contents to target folder
    mv "$temp_dir"/* "${STEAMAPPDIR}/game/csgo"

    # Clean up: remove the downloaded tgz file
    rm file.tar.gz

    echo "Extraction and move completed successfully"
else
    echo "Download failed"
fi

# Clean up: remove the temporary directory
rm -rf "$temp_dir"

url="https://github.com/roflmuffin/CounterStrikeSharp/releases/download/v213/counterstrikesharp-with-runtime-build-213-linux-dfc9859.zip"
# Temporary directory for extraction
temp_dir=$(mktemp -d)

# Download the ZIP file
wget "$url" -O file.zip

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Download successful"

    # Extract contents to temporary directory
    unzip file.zip -d "$temp_dir"

    # Move contents to target folder
    mv "$temp_dir"/* "${STEAMAPPDIR}/game/csgo"

    # Clean up: remove the downloaded ZIP file
    rm file.zip

    echo "Extraction and move completed successfully"
else
    echo "Download failed"
fi

# Clean up: remove the temporary directory
rm -rf "$temp_dir"
