#!/bin/bash
echo "========================================"
echo " Starting Repository Setup..."
set -e
echo "========================================"
echo "[INFO] Preparing third-party repositories."

sudo apt update
sudo apt install -y ca-certificates curl gpg software-properties-common

sudo install -d -m 0755 /etc/apt/sources.list.d /usr/share/keyrings

ensure_source_file() {
    local path="$1"
    local marker="$2"

    if [ -f "$path" ] && grep -qF "$marker" "$path"; then
        echo "[OK] $(basename "$path") already present."
        return 0
    fi

    return 1
}

install_brave_repo() {
    local keyring="/usr/share/keyrings/brave-browser-archive-keyring.gpg"
    local source_file="/etc/apt/sources.list.d/brave-browser-release.sources"

    if [ ! -f "$keyring" ]; then
        echo "[INFO] Installing Brave archive key..."
        sudo curl -fsSLo "$keyring" https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    fi

    if ! ensure_source_file "$source_file" "brave-browser-apt-release.s3.brave.com"; then
        echo "[INFO] Installing Brave APT source..."
        sudo tee "$source_file" >/dev/null <<'EOF'
Types: deb
URIs: https://brave-browser-apt-release.s3.brave.com/
Suites: stable
Components: main
Signed-By: /usr/share/keyrings/brave-browser-archive-keyring.gpg
EOF
    fi
}

install_vscode_repo() {
    local keyring="/usr/share/keyrings/microsoft.gpg"
    local source_file="/etc/apt/sources.list.d/vscode.sources"
    local tmp_key

    if [ ! -f "$keyring" ]; then
        echo "[INFO] Installing Microsoft signing key..."
        tmp_key="$(mktemp)"
        sudo curl -fsSLo "$tmp_key" https://packages.microsoft.com/keys/microsoft.asc
        sudo gpg --dearmor --yes --output "$keyring" "$tmp_key"
        rm -f "$tmp_key"
    fi

    if ! ensure_source_file "$source_file" "packages.microsoft.com/repos/code"; then
        echo "[INFO] Installing VS Code APT source..."
        sudo tee "$source_file" >/dev/null <<'EOF'
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF
    fi
}

if ! grep -Rqs "zhangsongcui3371/fastfetch" /etc/apt/sources.list /etc/apt/sources.list.d 2>/dev/null; then
    echo "[OK] Adding fastfetch PPA..."
    sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
else
    echo "[OK] fastfetch PPA already present."
fi

install_brave_repo
install_vscode_repo

sudo apt update
echo "========================================"
echo "[SUCCESS] Repository setup step finished!"
