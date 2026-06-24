# Inventory Guide

The `inventory/` folder contains snapshots and package lists that describe the
current workstation state.

## Actively Used By Scripts

- `inventory/apt-packages.txt`
- `inventory/snap-packages.txt`
- `inventory/cargo.txt`

## Reference Snapshots

- `inventory/os-info.txt`
- `inventory/system-info.txt`
- `inventory/hardware-info.txt`
- `inventory/services.txt`
- `inventory/user-services.txt`
- `inventory/environment-variables.txt`
- `inventory/gnome-extensions.txt`
- `inventory/themes.txt`
- `inventory/fonts.txt`
- `inventory/icons.txt`
- `inventory/repos.txt`
- `inventory/repositories.txt`
- `inventory/custom-shortcuts.txt`
- `inventory/cronjobs.txt`
- `inventory/flatpak-packages.txt`

## How To Use Them

- Update the package lists when you add or remove software from the restore
  scripts.
- Treat the snapshot files as documentation of the current workstation rather
  than as inputs to automation unless a script explicitly uses them.

## Practical Rule

If a file under `inventory/` is backing a script, changing it changes the next
restore. If it is a snapshot file, changing it mainly updates the record of the
current machine.
