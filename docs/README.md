# Documentation Index

This folder explains how the workstation restore system is organized and how
to use it in two different situations:

- Rebuild a fresh Ubuntu workstation
- Update an existing workstation with new packages, configs, or assets

## Start Here

- [Fresh workstation setup](workflows/fresh-workstation.md)
- [Existing workstation updates](workflows/extend-workstation.md)
- [Command reference](commands/README.md)
- [Inventory guide](inventories.md)

## What Each Area Means

- `scripts/` contains the runnable restore actions.
- `inventory/` contains machine-specific package and system snapshots.
- `configs/` contains the configuration that gets restored.
- `assets/` contains fonts, icons, themes, and other visual assets.

## Recommended Flow

1. Read the fresh workstation guide if this is a new PC.
2. Read the existing workstation guide if you are only adding or changing a
   small part of the setup.
3. Use the command pages for exact commands, one action at a time.
4. Update the matching inventory or config file before rerunning a restore
   script when you want the change to persist in the repo.

## Current Scope

This repo already covers the main workstation restore path. Some inventory files
are snapshots only and are not yet wired into scripts. The docs call those out
so the repo stays honest about what is automated and what is reference data.
