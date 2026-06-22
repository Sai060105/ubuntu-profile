#!/bin/bash
echo "========================================"
echo " Restoring Terminal Configurations..."
echo "========================================"
set -e
mkdir -p ~/.config

# Kitty Configuration
if [ -d "configs/terminal/kitty" ] && [ "$(ls -A configs/terminal/kitty)" ]; then
    echo "[OK] Kitty configs found. Copying to ~/.config/kitty/..."
    cp -r configs/terminal/kitty ~/.config/
else
    echo "[WARNING] configs/terminal/kitty/ is empty or missing!"
fi

# Btop Configuration
if [ -d "configs/terminal/btop" ] && [ "$(ls -A configs/terminal/btop)" ]; then
    echo "[OK] Btop configs found. Copying to ~/.config/btop/..."
    cp -r configs/terminal/btop ~/.config/
else
    echo "[WARNING] configs/terminal/btop/ is empty or missing!"
fi

# cava Configuration
if [ -d "configs/terminal/cava" ] && [ "$(ls -A configs/terminal/cava)" ]; then
    echo "[OK] cava configs found. Copying to ~/.config/cava/..."
    cp -r configs/terminal/cava ~/.config/
else
    echo "[WARNING] configs/terminal/cava/ is empty or missing!"
fi

# fastfetch Configuration
if [ -d "configs/terminal/fastfetch" ] && [ "$(ls -A configs/terminal/fastfetch)" ]; then
    echo "[OK] fastfetch configs found. Copying to ~/.config/fastfetch/..."
    cp -r configs/terminal/fastfetch ~/.config/
else
    echo "[WARNING] configs/terminal/fastfetch/ is empty or missing!"
fi
echo "========================================"
echo "[SUCCESS] Terminal restoration script finished!"
