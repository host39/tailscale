# Tailscale

This repository is our own version of the official
[Tailscale Android app](https://github.com/tailscale/tailscale-android).
We keep it in sync with every official release and add our own features on top.

## Repository layout

| Path | What it is |
|------|------------|
| `android/` | The official Tailscale Android app, plus our custom changes. Managed with `git subtree`. |
| `scripts/sync-upstream.sh` | Pulls a new official release into `android/`. |
| `README.md` | This file. The source of truth for what we have changed and why. |
