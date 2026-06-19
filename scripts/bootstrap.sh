cat << 'EOF' > scripts/bootstrap.sh
#!/bin/bash
echo "Starting Full Workstation Restoration!"

./scripts/setup-repositories.sh
./scripts/install-packages.sh
./scripts/restore-assets.sh
./scripts/restore-shell.sh
./scripts/restore-terminal.sh
./scripts/restore-gnome.sh

echo "Restoration Complete! You may need to restart your computer for all changes to take effect."
EOF
