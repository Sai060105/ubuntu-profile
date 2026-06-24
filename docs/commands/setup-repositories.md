# Set Up Repositories

Use this when you need the third-party apt sources that the workstation relies
on.

## Commands

```bash
./scripts/setup-repositories.sh
```

## What It Does

- Verifies `add-apt-repository` is available
- Adds the Fastfetch PPA if it is not already present
- Refreshes the apt package index

## When To Use

- Before package installation on a fresh machine
- After removing repository configuration
- Whenever you want to verify the repo source is still present
