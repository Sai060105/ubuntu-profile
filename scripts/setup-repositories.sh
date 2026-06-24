#!/bin/bash
echo "========================================"
echo " Starting Repository Setup..."
set -e
echo "========================================"
echo "[INFO] Preparing third-party repositories."

if ! command -v add-apt-repository >/dev/null 2>&1; then
    echo "[ERROR] add-apt-repository is not available. Install software-properties-common first."
    exit 1
fi

if ! grep -Rqs "zhangsongcui3371/fastfetch" /etc/apt/sources.list /etc/apt/sources.list.d 2>/dev/null; then
    echo "[OK] Adding fastfetch PPA..."
    sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
else
    echo "[OK] fastfetch PPA already present."
fi

sudo apt update
echo "========================================"
echo "[SUCCESS] Repository setup step finished!"
