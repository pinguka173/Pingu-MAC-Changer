#!/bin/bash
set -e

SCRIPT_NAME="pingumac"
TARGET_DIR="/usr/local/bin"
SOURCE_SCRIPT="pingumac"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPT_PATH="$SCRIPT_DIR/$SOURCE_SCRIPT"

if [ ! -f "$SCRIPT_PATH" ]; then
    echo "Error: $SOURCE_SCRIPT not found!"
    exit 1
fi

chmod +x "$SCRIPT_PATH"

echo "Installing $SCRIPT_NAME to $TARGET_DIR..."

sudo ln -sf "$(realpath "$SCRIPT_PATH")" "$TARGET_DIR/$SCRIPT_NAME"

echo "$SCRIPT_NAME has been successfully installed!"