#!/bin/bash
echo "Restoring Shell and Git Configurations..."
set -e

cp configs/shell/.bashrc ~/.bashrc 2>/dev/null
cp configs/shell/.zshrc ~/.zshrc 2>/dev/null
cp configs/shell/.p10k.zsh ~/.p10k.zsh 2>/dev/null

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

cp configs/git/.gitconfig ~/.gitconfig 2>/dev/null
echo "Shell restored successfully!"
