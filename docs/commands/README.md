# Command Reference

Run these commands from the repository root unless noted otherwise.

## Action Pages

- [Bootstrap the full workstation](bootstrap.md)
- [Set up repositories](setup-repositories.md)
- [Install packages](install-packages.md)
- [Restore assets](restore-assets.md)
- [Restore shell config](restore-shell.md)
- [Restore terminal config](restore-terminal.md)
- [Restore GNOME config](restore-gnome.md)
- [Add more to an existing workstation](extend-workstation.md)

## Useful Checks

```bash
gnome-extensions list
gnome-extensions list --enabled
```

## Safety Notes

- The restore actions can overwrite files in your home directory.
- Package installation may request `sudo` access.
- Shell restoration can change the default login shell if `zsh` is installed.
