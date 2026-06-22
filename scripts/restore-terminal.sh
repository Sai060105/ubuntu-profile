#!/bin/bash
echo "Restoring Terminal Configurations..."
set -e

mkdir -p ~/.config
cp -r configs/terminal/* ~/.config/ 2>/dev/null
echo "Terminal configurations restored successfully!"
