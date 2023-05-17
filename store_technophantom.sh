#!/bin/bash

SCRIPT_NAME="technophantom"
INSTALL_PATH="/usr/local/bin"
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$SCRIPT_NAME"
if [[ $EUID -ne 0 ]]; then
	echo "This script requires root privileges. Please run it as root or using sudo."
	exit 1
fi
if [[ ! -f "$SCRIPT_PATH" ]]; then
	echo "Error: The script file '$SCRIPT_NAME' does not exist."
	exit 1
fi
if [[ -f "$INSTALL_PATH/$SCRIPT_NAME" ]]; then
	echo "The script '$SCRIPT_NAME' is already installed in '$INSTALL_PATH'."
	exit 0
fi
cp "$SCRIPT_PATH" "$INSTALL_PATH/$SCRIPT_NAME"
chmod +x "$INSTALL_PATH/$SCRIPT_NAME"
if [[ -f "$INSTALL_PATH/$SCRIPT_NAME" ]]; then
	echo "Copy of '$SCRIPT_NAME' successfully stored in '$INSTALL_PATH'."
else
	echo "Error: Failed to store copy of '$SCRIPT_NAME' in '$INSTALL_PATH'."
	exit 1
fi
exit 0

