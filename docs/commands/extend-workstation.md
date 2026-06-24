# Add More to an Existing Workstation

Use this when the workstation is already set up and you want to expand or
refresh one part of it.

## Commands

Run only the script that matches your change:

```bash
./scripts/setup-repositories.sh
./scripts/install-packages.sh
./scripts/restore-assets.sh
./scripts/restore-shell.sh
./scripts/restore-terminal.sh
./scripts/restore-gnome.sh
```

## Common Change Paths

- New package? Update the matching `inventory/*.txt` file, then run
  `./scripts/install-packages.sh`
- New font, icon, or theme? Add it under `assets/`, then run
  `./scripts/restore-assets.sh`
- Shell or Git change? Update `configs/shell/` or `configs/git/`, then run
  `./scripts/restore-shell.sh`
- Desktop change? Update `configs/desktop/`, then run
  `./scripts/restore-gnome.sh`

## Notes

- You do not need the full bootstrap for a small refresh.
- Re-run only the part you changed so you keep the process fast and focused.
