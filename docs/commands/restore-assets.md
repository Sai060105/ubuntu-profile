# Restore Assets

Use this to copy fonts, icons, and themes into the current user's home
directories.

## Commands

```bash
./scripts/restore-assets.sh
```

## What It Restores

- Fonts to `~/.local/share/fonts/`
- Icons to `~/.icons/`
- Themes to `~/.themes/`

## When To Use

- After adding new asset files to `assets/`
- When you want to refresh visual assets without touching packages
- On a new workstation after the package phase

## Notes

- Missing or empty asset folders are skipped safely.
- Restart apps or log out and back in if font or icon changes do not appear.
