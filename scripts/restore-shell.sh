#!/bin/bash
echo "========================================"
echo " Restoring Shell and Git Configurations..."
echo "========================================"
set -e
# Zsh Configuration
if [ -f "configs/shell/.zshrc" ]; then
    echo "[OK] Found .zshrc in configs/shell/. Copying to ~/.zshrc..."
    cp configs/shell/.zshrc ~/.zshrc
else
    echo "[WARNING] configs/shell/.zshrc not found! Your Zsh config was not restored."
fi

# Bash Configuration
if [ -f "configs/shell/.bashrc" ]; then
    echo "[OK] Found .bashrc in configs/shell/. Copying to ~/.bashrc..."
    cp configs/shell/.bashrc ~/.bashrc
else
    echo "[WARNING] configs/shell/.bashrc not found!"
fi

# Git Configuration
if [ -f "configs/git/.gitconfig" ]; then
    echo "[OK] Found .gitconfig in configs/git/. Copying to ~/.gitconfig..."
    cp configs/git/.gitconfig ~/.gitconfig
else
    echo "[WARNING] configs/git/.gitconfig not found!"
fi

# p10k.zsh Configuration
if [ -f "configs/shell/.p10k.zsh" ]; then
    echo "[OK] Found .p10k.zsh in configs/shell/. Copying to ~/.p10k.zsh..."
    cp configs/shell/.p10k.zsh ~/.p10k.zsh
else
    echo "[WARNING] configs/shell/.p10k.zsh not found! Your Zsh config was not restored."
fi
# Custom zsh functions

if [ -d configs/zsh/functions ]; then
mkdir -p ~/.config/zsh/functions

```
cp -r configs/zsh/functions/* \
      ~/.config/zsh/functions/
```

fi

# Install Oh My Zsh

if [ ! -d ~/.oh-my-zsh ]; then
echo "Installing Oh My Zsh..."

```
git clone \
    https://github.com/ohmyzsh/ohmyzsh.git \
    ~/.oh-my-zsh
```

fi

# Install Oh My Zsh plugins and theme

ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone \
        https://github.com/zsh-users/zsh-autosuggestions \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# zsh-autocomplete
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autocomplete" ]; then
    git clone \
        https://github.com/marlonrichert/zsh-autocomplete \
        "$ZSH_CUSTOM/plugins/zsh-autocomplete"
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone \
        https://github.com/zsh-users/zsh-syntax-highlighting \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# powerlevel10k
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    git clone --depth=1 \
        https://github.com/romkatv/powerlevel10k.git \
        "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# Set zsh as default shell

if command -v zsh >/dev/null 2>&1; then
chsh -s "$(which zsh)"
fi
echo "========================================"
echo "[SUCCESS] Shell and Git restoration script finished!"
