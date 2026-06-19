cat << 'EOF' > scripts/restore-shell.sh
#!/bin/bash
echo "Restoring Shell and Git Configurations..."
cp configs/shell/.bashrc ~/.bashrc 2>/dev/null
cp configs/shell/.zshrc ~/.zshrc 2>/dev/null
cp configs/shell/.p10k.zsh ~/.p10k.zsh 2>/dev/null
cp configs/git/.gitconfig ~/.gitconfig 2>/dev/null
echo "Shell restored successfully!"
EOF
