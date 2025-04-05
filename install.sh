#!/bin/bash

SCRIPT_NAME="pingumac"  # the command name users will type
TARGET_DIR="/usr/local/bin"
SOURCE_SCRIPT="pingumac"       # your actual script filename

# Get full path to the script
SCRIPT_PATH="$(realpath "$SOURCE_SCRIPT")"

# Check if the file exists
if [ ! -f "$SCRIPT_PATH" ]; then
    echo "Error: $SOURCE_SCRIPT not found!"
    exit 1
fi

# Make sure it's executable
chmod +x "$SCRIPT_PATH"

# Create symlink
sudo ln -sf "$SCRIPT_PATH" "$TARGET_DIR/$SCRIPT_NAME"

echo "$SCRIPT_NAME has been successfully installed!"
