#!/bin/bash
echo "Restoring GNOME Desktop settings..."
set -e


rm -rf ~/.local/share/gnome-shell/extensions

mkdir -p ~/.local/share/gnome-shell/extensions

cp -r configs/desktop/extensions/* ~/.local/share/gnome-shell/extensions/

dconf load / < configs/desktop/dconf.ini
echo "GNOME settings restored successfully!"
