# Bootstrap the Full Workstation

Use this when you want the entire workstation restored in one pass.

## Commands

```bash
chmod +x scripts/*.sh
./scripts/bootstrap.sh
```

## What It Runs

The bootstrap script runs these actions in order:

1. `./scripts/setup-repositories.sh`
2. `./scripts/install-packages.sh`
3. `./scripts/restore-assets.sh`
4. `./scripts/restore-shell.sh`
5. `./scripts/restore-terminal.sh`
6. `./scripts/restore-gnome.sh`

## When To Use

- After cloning the repo on a fresh Ubuntu install
- After a clean reinstall of the OS
- After you want to re-apply the full profile

## Notes

- Run it from the repository root.
- Expect prompts for package installation or shell changes.
