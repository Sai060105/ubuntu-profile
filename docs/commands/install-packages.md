# Install Packages

Use this to install the packages listed in the `inventory/` files.

## Commands

```bash
./scripts/install-packages.sh
```

## What It Installs

- Apt packages from `inventory/apt-packages.txt`
- Snap packages from `inventory/snap-packages.txt`
- Cargo packages from `inventory/cargo.txt`
- `pokemon-colorscripts` from `acxz/pokescript` when it is missing

## When To Use

- On a new workstation after the repositories are configured
- After adding new packages to the inventory files
- After you want to restore a missing package group

## Notes

- `cargo install` will add binaries to the current user account.
- This script uses `sudo` for apt, snap, and the color script installer.
