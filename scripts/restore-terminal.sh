#!/bin/bash
echo "Restoring Terminal Configurations..."
mkdir -p ~/.config
cp -r configs/terminal/* ~/.config/ 2>/dev/null
echo "Terminal configurations restored successfully!"
