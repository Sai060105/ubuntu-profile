# Existing Workstation Updates

Use this path when the workstation already exists and you only want to add or
refresh part of the setup.

## Typical Cases

- Add more packages
- Update terminal configuration
- Refresh GNOME settings
- Add or replace fonts, icons, or themes
- Change shell behavior or Git defaults

## Commands

Run only the matching script for the change you made:

```bash
./scripts/setup-repositories.sh
./scripts/install-packages.sh
./scripts/restore-assets.sh
./scripts/restore-shell.sh
./scripts/restore-terminal.sh
./scripts/restore-gnome.sh
```

## How To Extend The Repo First

1. Update the matching file under `inventory/`, `configs/`, or `assets/`.
2. Re-run the matching restore script.
3. Commit both the content change and the doc update together.

## Examples

- Add a new apt package to `inventory/apt-packages.txt`, then run
  `./scripts/install-packages.sh`
- Add a new icon pack to `assets/icons/`, then run
  `./scripts/restore-assets.sh`
- Change GNOME settings in `configs/desktop/dconf.ini`, then run
  `./scripts/restore-gnome.sh`

## Notes

- You do not need to run the full bootstrap for a small change.
- If the change affects login behavior or the desktop session, log out and back
  in after the script finishes.
