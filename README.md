# Ubuntu Profile

A complete Ubuntu workstation restoration framework that recreates a fully configured development environment from a fresh Ubuntu installation.

The workflow is intentionally simple:

```text
Fresh Ubuntu Install
        ↓
Clone Repository
        ↓
Run Bootstrap Script
        ↓
Workstation Restored
```

---

# Features

## Shell Configuration

* Zsh and Bash configuration
* Powerlevel10k setup
* Git configuration

## Terminal Environment

* Kitty
* Fastfetch
* Btop
* Cava

## Desktop Configuration

* GNOME settings
* GNOME extensions
* WhiteSur theme
* Bibata cursor theme

## Assets

* Fonts
* Icons
* Themes
* Wallpapers

## Package Management

* APT packages
* Snap packages
* Third-party repositories

---

# Repository Structure

```text
ubuntu-profile/
├── assets/
│   ├── cursors/
│   ├── fonts/
│   ├── icons/
│   ├── themes/
│   └── wallpapers/
│
├── configs/
│   ├── desktop/
│   ├── git/
│   ├── shell/
│   ├── system/
│   └── terminal/
│
├── docs/
├── inventory/
├── scripts/
└── snapshots/
```

---

# Requirements

Recommended operating system:

* Ubuntu 24.04 LTS

Install the required dependencies:

```bash
sudo apt update
sudo apt install -y git curl
```

---

# Installation

## Clone Repository

Using SSH:

```bash
git clone git@github.com:Sai060105/ubuntu-profile.git
cd ubuntu-profile
```

## Make Scripts Executable

```bash
chmod +x scripts/*.sh
```

## Run Bootstrap

```bash
./scripts/bootstrap.sh
```

---

# Bootstrap Workflow

The master bootstrap script restores the workstation in the following order.

## 1. Configure External Repositories

Script:

```bash
./scripts/setup-repositories.sh
```

Actions:

* Configure Docker repository
* Configure Brave repository

---

## 2. Install Packages

Script:

```bash
./scripts/install-packages.sh
```

Actions:

* Install APT packages
* Install Snap packages

---

## 3. Restore Assets

Script:

```bash
./scripts/restore-assets.sh
```

Restores:

* Fonts
* Icons
* Themes
* Wallpapers
* Cursor themes

---

## 4. Restore Shell Configuration

Script:

```bash
./scripts/restore-shell.sh
```

Restores:

```text
.zshrc
.bashrc
.p10k.zsh
.gitconfig
```

---

## 5. Restore Terminal Configuration

Script:

```bash
./scripts/restore-terminal.sh
```

Restores:

* Kitty
* Fastfetch
* Btop
* Cava

---

## 6. Restore GNOME Configuration

Script:

```bash
./scripts/restore-gnome.sh
```

Restores:

* GNOME settings
* GNOME extensions
* Desktop preferences

---

# Manual Script Usage

Individual components can be restored independently.

## Assets

```bash
./scripts/restore-assets.sh
```

## Shell

```bash
./scripts/restore-shell.sh
```

## Terminal

```bash
./scripts/restore-terminal.sh
```

## GNOME

```bash
./scripts/restore-gnome.sh
```

## Packages

```bash
./scripts/install-packages.sh
```

---

# Package Inventories

## APT Packages

```text
inventory/apt-packages.txt
```

## Snap Packages

```text
inventory/snap-packages.txt
```

---

# Updating Configurations

After making changes to the workstation, update the repository backups.

## Export GNOME Settings

```bash
dconf dump / > configs/desktop/dconf.ini
```

## Update APT Package Inventory

```bash
apt-mark showmanual > inventory/apt-packages.txt
```

## Update Snap Package Inventory

```bash
snap list | awk 'NR>1 {print $1}' > inventory/snap-packages.txt
```

## Commit Changes

```bash
git add .
git commit -m "Update workstation configuration"
git push
```

---

# Notes

* Intended for personal workstation recovery and replication.
* Review package inventories before installation.
* Review configuration files before applying them to another system.
* Test changes before using them on production machines.

---

# License

Personal Use.
