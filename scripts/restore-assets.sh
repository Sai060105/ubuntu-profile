#!/bin/bash
echo "========================================"
echo " Restoring Assets (Themes, Icons, Fonts)..."
echo "========================================"
set -e
# Check and copy Fonts
if [ -d "assets/fonts" ] && [ "$(ls -A assets/fonts)" ]; then
    echo "[OK] Fonts found in assets/fonts/. Copying to ~/.local/share/fonts/..."
    mkdir -p ~/.local/share/fonts
    cp -r assets/fonts/* ~/.local/share/fonts/
else
    echo "[WARNING] assets/fonts/ is empty or missing! Skipping fonts."
fi

# Check and copy Icons
if [ -d "assets/icons" ] && [ "$(ls -A assets/icons)" ]; then
    echo "[OK] Icons found in assets/icons/. Copying to ~/.icons/..."
    mkdir -p ~/.icons
    cp -r assets/icons/* ~/.icons/
else
    echo "[WARNING] assets/icons/ is empty or missing! Skipping icons."
fi

# Check and copy Themes
if [ -d "assets/themes" ] && [ "$(ls -A assets/themes)" ]; then
    echo "[OK] Themes found in assets/themes/. Copying to ~/.themes/..."
    mkdir -p ~/.themes
    cp -r assets/themes/* ~/.themes/
else
    echo "[WARNING] assets/themes/ is empty or missing! Skipping themes."
fi

echo "========================================"
echo "[SUCCESS] Asset restoration script finished!"
