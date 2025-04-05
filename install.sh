#!/bin/bash

SCRIPT_NAME="pingumac"  # the command name users will type
TARGET_DIR="/usr/local/bin"
SOURCE_SCRIPT="pingumac"       # your actual script filename
INSTALL_SCRIPT="install.sh"

# Get full path to the script
SCRIPT_PATH="$(realpath "$SOURCE_SCRIPT")"
INSTALL_SCRIPT_PATH="$(realpath "$INSTALL_SCRIPT")"

# Check if the file exists
if [ ! -f "$SCRIPT_PATH" ]; then
    echo "Error: $SOURCE_SCRIPT not found!"
    exit 1
fi

# Make sure it's executable
chmod +x "$SCRIPT_PATH"
chmod +x "$INSTALL_SCRIPT_PATH"

# Create symlink
sudo ln -sf "$SCRIPT_PATH" "$TARGET_DIR/$SCRIPT_NAME"
sudo ln -sf "$INSTALL_SCRIPT_PATH" "$TARGET_DIR/install.sh"

echo "$SCRIPT_NAME has been successfully installed!"
