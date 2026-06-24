# Restore GNOME Config

Use this to restore GNOME desktop settings and extensions.

## Commands

```bash
./scripts/restore-gnome.sh
```

## What It Restores

- Dconf settings from `configs/desktop/dconf.ini`
- GNOME Shell extensions from `configs/desktop/extensions/`

## When To Use

- After changing GNOME settings snapshots
- After adding or updating an extension in the repo
- On a new workstation after the core packages are installed

## Notes

- The dconf import applies desktop settings immediately.
- Log out and back in if extension state does not update right away.
