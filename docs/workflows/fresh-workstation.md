# Fresh Workstation Setup

Use this path when you are setting up a new PC from a clean Ubuntu install.

## Recommended Sequence

1. Install Ubuntu
2. Clone this repository
3. Install the bootstrap dependencies
4. Make the scripts executable
5. Run the full bootstrap

## Commands

```bash
sudo apt update
sudo apt install -y git curl

git clone https://github.com/Sai060105/ubuntu-profile.git
cd ubuntu-profile

chmod +x scripts/*.sh
./scripts/bootstrap.sh
```

## What To Expect

- Third-party repositories are configured first
- Packages are installed next
- Assets, shell config, terminal config, and GNOME config are restored after
  that

## After The Run

- Log out and back in if the shell or desktop does not pick up changes
- Reboot if the system asks for it or if you want a clean desktop session

## Good Follow-Ups

- Review [the command reference](../commands/README.md) if one step failed
- Check the inventories to see which package groups were applied
