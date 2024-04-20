#!/bin/bash

# URL of the tgz file
url="https://mms.alliedmods.net/mmsdrop/2.0/mmsource-2.0.0-git1286-linux.tar.gz"

# Directory to move the contents into
target_folder="game/csgo"

# Download the tgz file
wget "$url" -O file.tar.gz

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Download successful"

    # Extract contents
    tar -xzvf file.tar.gz

    # Move contents to target folder
    mv * "$target_folder"

    # Clean up: remove the downloaded tgz file
    rm file.tar.gz

    echo "Extraction and move completed successfully"
else
    echo "Download failed"
fi

