#!/bin/bash

# --- Configuration ---
# Set a default organization name if you usually use the same one, or leave it empty to prompt
DEFAULT_ORG="" 
# Set a default destination network path if you usually copy to the same location
DEFAULT_DEST_PATH="" 
# --------------------

# Prompt for Organization Name
if [ -z "$DEFAULT_ORG" ]; then
    read -p "Enter your Organisation (e.g., ckcb): " ORG
else
    ORG="$DEFAULT_ORG"
    echo "Using default Organisation: $ORG"
fi

# Construct source directory based on organization
SOURCE_DIR="${ORG}_photos"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' not found."
    echo "Please ensure photos have been downloaded for organization '$ORG'."
    exit 1
fi

# Prompt for Destination Network Folder
if [ -z "$DEFAULT_DEST_PATH" ]; then
    read -p "Enter the mounted network folder path (e.g., /mnt/network_share/Ouderportaal): " DEST_PATH
else
    DEST_PATH="$DEFAULT_DEST_PATH"
    echo "Using default destination path: $DEST_PATH"
fi

# Check if the destination path exists and is a directory
if [ ! -d "$DEST_PATH" ]; then
    echo "Error: Destination path '$DEST_PATH' does not exist or is not a directory."
    echo "Please ensure the network folder is correctly mounted."
    exit 1
fi

echo "Moving photo contents from '$SOURCE_DIR' to '$DEST_PATH'..."
# Use mv to move the files *from within* the source directory
mv -v "$SOURCE_DIR"/* "$DEST_PATH"

if [ $? -eq 0 ]; then
    echo "✅ Photo contents moved successfully!"
else
    echo "❌ An error occurred during moving files."
fi

echo "Source directory '$SOURCE_DIR' left intact (may be empty)."