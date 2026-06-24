# Restore Terminal Config

Use this to restore terminal app configuration without touching the rest of the
workstation.

## Commands

```bash
./scripts/restore-terminal.sh
```

## What It Restores

- Kitty configuration
- Btop configuration
- Cava configuration
- Fastfetch configuration

## When To Use

- After editing files under `configs/terminal/`
- When only terminal settings changed
- On a new workstation after shell restoration

## Notes

- The script copies config folders into `~/.config/`.
- If an app does not reflect the new settings, restart the app.
