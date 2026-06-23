#!/bin/bash
echo "Installing Packages..."
set -e

sudo apt update
xargs sudo apt install -y < inventory/apt-packages.txt
xargs -I {} sudo snap install {} < inventory/snap-packages.txt

while read -r pkg; do
[ -z "$pkg" ] && continue
cargo install "$pkg"
done < inventory/cargo.txt

echo "Packages installed successfully!"
