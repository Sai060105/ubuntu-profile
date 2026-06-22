#!/bin/bash
echo "========================================"
echo " Restoring GNOME Desktop Settings..."
echo "========================================"
set -e
# GNOME Dconf Settings
if [ -f "configs/desktop/dconf.ini" ]; then
    echo "[OK] Found dconf.ini. Loading GNOME settings..."
    dconf load / < configs/desktop/dconf.ini
    echo "[OK] GNOME settings applied."
else
    echo "[WARNING] configs/desktop/dconf.ini not found! Keyboard shortcuts and GNOME settings were NOT restored."
fi

# GNOME Extensions
if [ -d "configs/desktop/extensions" ] && [ "$(ls -A configs/desktop/extensions)" ]; then
    echo "[OK] GNOME Extensions found. Copying to ~/.local/share/gnome-shell/extensions/..."
    mkdir -p ~/.local/share/gnome-shell/extensions
    cp -r configs/desktop/extensions/* ~/.local/share/gnome-shell/extensions/
else
    echo "[WARNING] No extensions found in configs/desktop/extensions/! Skipping."
fi

echo "========================================"
echo "[SUCCESS] GNOME restoration script finished!"
