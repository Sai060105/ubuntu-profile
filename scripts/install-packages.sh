#!/bin/bash
echo "Installing Packages..."
sudo apt update
xargs sudo apt install -y < inventory/apt-packages.txt
xargs -I {} sudo snap install {} < inventory/snap-packages.txt
echo "Packages installed successfully!"
