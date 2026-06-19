#!/bin/bash
echo "Restoring Assets..."
mkdir -p ~/.local/share/fonts ~/.local/share/icons ~/.themes ~/Pictures/Wallpapers

cp -r assets/fonts/* ~/.local/share/fonts/ 2>/dev/null
cp -r assets/icons/* ~/.local/share/icons/ 2>/dev/null
cp -r assets/cursors/* ~/.local/share/icons/ 2>/dev/null
cp -r assets/themes/* ~/.themes/ 2>/dev/null
cp -r assets/wallpapers/* ~/Pictures/Wallpapers/ 2>/dev/null
echo "Assets restored successfully!"
EOF
