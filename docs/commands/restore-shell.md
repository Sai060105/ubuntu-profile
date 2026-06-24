# Restore Shell Config

Use this to restore the shell, Git, and Powerlevel10k setup.

## Commands

```bash
./scripts/restore-shell.sh
```

## What It Restores

- `~/.zshrc`
- `~/.bashrc`
- `~/.gitconfig`
- `~/.p10k.zsh`
- Custom Zsh function files from `configs/zsh/functions/`

## What Else It Does

- Installs Oh My Zsh when it is missing
- Installs the configured Zsh plugins and theme
- Changes the login shell to `zsh` when `zsh` is available

## When To Use

- When you update shell behavior in `configs/shell/`
- When you update Git preferences in `configs/git/`
- When you want to refresh your prompt and plugins

## Notes

- This script can replace existing shell configuration.
- Review config files before applying them to another machine.
