#!/bin/bash

if pgrep -x "pingumac" > /dev/null; then
    echo "Abort: pingumac is currently running. Close it first."
    exit 1
fi

TMP_DIR="/tmp/pingumac_update_$$"
REPO_URL="https://github.com/pinguka173/Pingu-MAC-Changer.git"
INSTALL_SCRIPT="install.sh"
REPO_NAME="Pingu-MAC-Changer"

echo "[*] Fetching latest version from GitHub..."

mkdir -p "$TMP_DIR"
git clone "$REPO_URL" "$TMP_DIR/$REPO_NAME" || {
    echo "Git clone failed. GitHub's probably down."
    rm -rf "$TMP_DIR"
    exit 1
}

cd "$TMP_DIR/$REPO_NAME" || {
    echo "Failed to enter repo directory."
    rm -rf "$TMP_DIR"
    exit 1
}

if [ ! -f "$INSTALL_SCRIPT" ]; then
    echo "install.sh not found in the repo."
    rm -rf "$TMP_DIR"
    exit 1
fi

chmod +x "$INSTALL_SCRIPT"
echo "[*] Running installer..."
./"$INSTALL_SCRIPT"

echo "[✓] Update complete."
rm -rf "$TMP_DIR"