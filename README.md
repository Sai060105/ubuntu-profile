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

## Assets

* Fonts
* Icons
* Theme, wallpaper, and cursor directory placeholders

## Package Management

* APT packages
* Snap packages
* Cargo packages
* Third-party repository inventories

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
├── inventory/
└── scripts/
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
git clone https://github.com/Sai060105/ubuntu-profile.git
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

* Adds the fastfetch PPA
* Restores the Brave and VS Code APT sources
* Refreshes the package index after repository changes

---

## 2. Install Packages

Script:

```bash
./scripts/install-packages.sh
```

Actions:

* Install APT packages
* Install Snap packages
* Install Cargo packages
* Install `pokemon-colorscripts` from `acxz/pokescript`

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

It also installs Oh My Zsh, the configured Zsh plugins, and Powerlevel10k when
they are not already installed, then changes the default shell to Zsh when Zsh
is available.

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

# Command Reference

Run these commands from the repository root.

## Restore Commands

| Action | Command |
| --- | --- |
| Restore the complete workstation | `./scripts/bootstrap.sh` |
| Run the repository setup placeholder | `./scripts/setup-repositories.sh` |
| Install APT, Snap, and Cargo packages | `./scripts/install-packages.sh` |
| Restore fonts, icons, and themes | `./scripts/restore-assets.sh` |
| Restore Zsh, Bash, Git, and Powerlevel10k | `./scripts/restore-shell.sh` |
| Restore Kitty, Btop, Cava, and Fastfetch | `./scripts/restore-terminal.sh` |
| Restore GNOME settings and extensions | `./scripts/restore-gnome.sh` |

The restore scripts copy files into the current user's home directory and may
replace existing configuration. Review the files before running them on a
different machine. Package installation and changing the default shell may
prompt for a password.

## GNOME Extension Commands

List all installed extension UUIDs:

```bash
gnome-extensions list
```

List only enabled extensions:

```bash
gnome-extensions list --enabled
```

Enable, disable, open preferences for, or inspect an extension:

```bash
gnome-extensions enable EXTENSION_UUID
gnome-extensions disable EXTENSION_UUID
gnome-extensions prefs EXTENSION_UUID
gnome-extensions info EXTENSION_UUID
```

For example:

```bash
gnome-extensions enable clipboard-indicator@tudmotu.com
gnome-extensions prefs Vitals@CoreCoding.com
```

The repository currently bundles these user-installed extensions:

```text
blur-my-shell@aunetx
burn-my-windows@schneegans.github.com
clipboard-indicator@tudmotu.com
CoverflowAltTab@palatis.blogspot.com
dash-to-dock@micxgx.gmail.com
dynamic-music-pill@andbal
gsconnect@andyholmes.github.io
openbar@neuromorph
search-light@icedman.github.com
Vitals@CoreCoding.com
```

Ubuntu-provided extensions such as Desktop Icons NG, Tiling Assistant, Ubuntu
AppIndicators, and Ubuntu Dock are recorded in the inventory but are not copied
into the repository as user extensions.

# Updating the Repository From the Workstation

After changing the workstation, use the relevant commands below to refresh the
backups. Run them from the repository root and review `git diff` before
committing.

## GNOME Settings and Extensions

Export all GNOME/dconf settings, including extension preferences and custom
keyboard shortcuts:

```bash
dconf dump / > configs/desktop/dconf.ini
```

Copy newly installed or updated user extensions into the repository:

```bash
mkdir -p configs/desktop/extensions
cp -a ~/.local/share/gnome-shell/extensions/. configs/desktop/extensions/
```

Refresh the inventory of user and system extensions:

```bash
gnome-extensions list | sort > inventory/gnome-extensions.txt
```

To capture GNOME changes in one pass:

```bash
dconf dump / > configs/desktop/dconf.ini
mkdir -p configs/desktop/extensions
cp -a ~/.local/share/gnome-shell/extensions/. configs/desktop/extensions/
gnome-extensions list | sort > inventory/gnome-extensions.txt
```

`cp -a` adds and updates extension files but intentionally does not delete old
extension directories from the repository. Remove an obsolete directory only
after confirming that the extension is no longer needed.

## Shell and Git Configuration

```bash
cp ~/.zshrc configs/shell/.zshrc
cp ~/.bashrc configs/shell/.bashrc
cp ~/.gitconfig configs/git/.gitconfig
```

If Powerlevel10k has a generated configuration:

```bash
cp ~/.p10k.zsh configs/shell/.p10k.zsh
```

## Terminal Configuration

```bash
mkdir -p configs/terminal/{kitty,btop,cava,fastfetch}
cp -a ~/.config/kitty/. configs/terminal/kitty/
cp -a ~/.config/btop/. configs/terminal/btop/
cp -a ~/.config/cava/. configs/terminal/cava/
cp -a ~/.config/fastfetch/. configs/terminal/fastfetch/
```

## Assets

Copy only the asset categories that changed:

```bash
mkdir -p assets/{fonts,icons,themes,wallpapers,cursors}
cp -a ~/.local/share/fonts/. assets/fonts/
cp -a ~/.local/share/icons/. assets/icons/
cp -a ~/.themes/. assets/themes/
```

Wallpaper and cursor locations vary by installation, so copy the selected files
from their actual locations into `assets/wallpapers/` and `assets/cursors/`.

## Package Inventories

APT packages:

```bash
apt-mark showmanual > inventory/apt-packages.txt
```

Snap packages:

```bash
snap list | awk 'NR > 1 {print $1}' > inventory/snap-packages.txt
```

Cargo-installed commands:

```bash
cargo install --list | sed -n 's/ v.*:$//p' > inventory/cargo.txt
```

Flatpak applications:

```bash
flatpak list --app --columns=application > inventory/flatpak-packages.txt
```

## System Inventories

```bash
uname -a > inventory/system-info.txt
cat /etc/os-release > inventory/os-info.txt
fc-list : family | cut -d: -f2- | sed 's/^ //' | sort -u > inventory/fonts.txt
systemctl list-unit-files --state=enabled > inventory/services.txt
systemctl --user list-unit-files --state=enabled > inventory/user-services.txt
sudo lshw -short > inventory/hardware-info.txt
(crontab -l 2>/dev/null || printf 'No cronjobs found\n') > inventory/cronjobs.txt
```

Record the available icon and theme directory names:

```bash
find ~/.local/share/icons ~/.icons -mindepth 1 -maxdepth 1 -type d -printf '%f\n' 2>/dev/null | sort -u > inventory/icons.txt
find ~/.local/share/themes ~/.themes /usr/share/themes -mindepth 1 -maxdepth 1 -type d -printf '%f\n' 2>/dev/null | sort -u > inventory/themes.txt
```

Export custom GNOME keyboard shortcuts separately when a focused inventory is
useful. They are already included in the full `dconf.ini` export:

```bash
dconf dump /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ > inventory/custom-shortcuts.txt
```

Capture configured APT source entries for reference:

```bash
grep -RhE '^(deb |URIs:)' /etc/apt/sources.list /etc/apt/sources.list.d/ 2>/dev/null > inventory/repositories.txt
```

`repos.txt` and `repositories.txt` are snapshots of the configured sources.
`setup-repositories.sh` restores the Brave and VS Code sources directly and
still adds the fastfetch PPA.

Environment variables can contain tokens or other secrets. Inspect the output
before saving or committing it:

```bash
printenv | sort
```

## Review Changes

```bash
git status --short
git diff --stat
git diff
```

Pay special attention to `dconf.ini` and extension directories because they can
contain machine-specific state or large generated files.

## Commit Changes

```bash
git add README.md assets configs inventory scripts
git diff --cached
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
