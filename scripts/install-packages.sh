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

if ! command -v pokemon-colorscripts >/dev/null 2>&1; then
    echo "[INFO] Installing pokemon-colorscripts from acxz/pokescript..."
    tmp_dir="$(mktemp -d)"
    git clone https://github.com/acxz/pokescript.git "$tmp_dir/pokescript"
    (cd "$tmp_dir/pokescript" && sudo ./install.sh)
    rm -rf "$tmp_dir"
else
    echo "[OK] pokemon-colorscripts already installed."
fi

echo "Packages installed successfully!"
