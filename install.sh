#!/bin/bash

INSTALL_DIR="/usr/local/bin"
TARGET_NAME="pingumac"
SOURCE_PATH="$(pwd)/$TARGET_NAME"

# Check if the file exists
if [ ! -f "$SOURCE_PATH" ]; then
  echo "Error: $TARGET_NAME not found in current directory."
  exit 1
fi

# Kill any old file or symlink at the target location
if [ -e "$INSTALL_DIR/$TARGET_NAME" ] || [ -L "$INSTALL_DIR/$TARGET_NAME" ]; then
  echo "Removing old target in $INSTALL_DIR"
  rm -f "$INSTALL_DIR/$TARGET_NAME"
fi

# Sanity check
if [ "$SOURCE_PATH" != "$INSTALL_DIR/$TARGET_NAME" ]; then
  echo "Copying new binary to $INSTALL_DIR"
  cp -f "$SOURCE_PATH" "$INSTALL_DIR/$TARGET_NAME"
else
  echo "Skipping copy: source and destination are the same"
fi

# Remove old symlink if it exists
if [ -L "/bin/$TARGET_NAME" ]; then
  echo "Removing old symlink"
  rm -f "/bin/$TARGET_NAME"
fi

cp -f "$(pwd)/pingumac-updater.sh" /usr/local/bin/pingumac-updater
chmod +x /usr/local/bin/pingumac-updater

# Create new symlink
echo "Creating new symlink in /bin"
ln -s "$INSTALL_DIR/$TARGET_NAME" "/bin/$TARGET_NAME"

echo "Installation complete, you magnificent bastard."
