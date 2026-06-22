#!/bin/bash
echo "Restoring Assets..."
set -e

mkdir -p ~/.local/share/fonts ~/.local/share/icons ~/.themes ~/Pictures/Wallpapers

cp -r assets/fonts/* ~/.local/share/fonts/ 2>/dev/null
cp -r assets/icons/* ~/.local/share/icons/ 2>/dev/null
cp -r assets/cursors/* ~/.local/share/icons/ 2>/dev/null
cp -r assets/themes/* ~/.themes/ 2>/dev/null
cp -r assets/wallpapers/* ~/Pictures/Wallpapers/ 2>/dev/null
fc-cache -fv
echo "Assets restored successfully!"
