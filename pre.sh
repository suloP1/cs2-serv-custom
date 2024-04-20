#!/bin/bash

# Function to download and extract ZIP file
download_and_extract() {
    local url="$1"
    local target_folder="$2"

    # Download ZIP file
    wget -qO temp.zip "$url"

    # Check if download was successful
    if [ $? -eq 0 ]; then
        echo "Download successful"
        
        # Extract contents
        unzip -q temp.zip -d "$target_folder"
        
        # Clean up: remove the downloaded ZIP file
        rm temp.zip
        
        echo "Extraction completed successfully"
    else
        echo "Download failed"
    fi
}

# URL of the ZIP file
cs2_cfg_url="https://github.com/suloP1/cs2-serv-custom/raw/main/cs2-serv-customisation.zip"
counterstrikesharp_url="https://github.com/roflmuffin/CounterStrikeSharp/releases/download/v213/counterstrikesharp-with-runtime-build-213-linux-dfc9859.zip"

# Directory to move the contents into
target_folder="/home/steam/cs2-dedicated"  # Update to your desired target folder

# Download and extract CS2 config bundle
download_and_extract "$cs2_cfg_url" "$target_folder"

# Download and extract CounterStrikeSharp
download_and_extract "$counterstrikesharp_url" "$target_folder"
