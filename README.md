# Tailscale Android (custom build)

This repository is our own version of the official
[Tailscale Android app](https://github.com/tailscale/tailscale-android).
We keep it in sync with every official release and add our own features on top.

## Repository layout

| Path | What it is |
|------|------------|
| `android/` | The official Tailscale Android app, plus our custom changes. Managed with `git subtree`. |
| `scripts/sync-upstream.sh` | Pulls a new official release into `android/`. |
| `README.md` | This file. The source of truth for what we have changed and why. |

## Current upstream version

| Field | Value |
|-------|-------|
| Upstream repo | https://github.com/tailscale/tailscale-android |
| Branch | `release-branch/1.106` |
| Version | 1.106.1 |
| Upstream commit | `0a7686abf190c2d950287cac71f4b3f711e1f3b4` |
| Synced on | 2026-11-26 |

## Our custom changes

This list describes **what** we want the app to do differently from the official
app, in plain language. It is not a technical changelog. Each entry should be
written so that someone (or an AI assistant) can read it after an upstream
update and confirm the behavior is still there, re-implementing it if needed.

For each change, record:

- **Name**: a short title.
- **Goal**: what the feature does and why we want it.
- **Expected behavior**: how to tell it is working (what a user sees or can do).
- **Status**: Planned, In progress, Done, or Removed.
- **Notes** (optional): hints about where it lives in the code, known conflicts with upstream, etc.

_No custom changes yet._

<!--
Template, copy for each new change:

### 1. <Name>
- **Goal**:
- **Expected behavior**:
- **Status**: Planned
- **Notes**:
-->

## How to update to a new official release

Run these steps whenever Tailscale publishes a new Android release. They are
written so an AI assistant can follow them directly.

1. Start from a clean `main` branch and create a working branch, for example
   `sync/1.108`.
2. Run `scripts/sync-upstream.sh` (or `scripts/sync-upstream.sh release-branch/X.Y`
   for a specific release). It does a shallow fetch of the upstream release and
   merges it into `android/` as a single squashed commit.
3. Resolve any merge conflicts. When upstream and our changes touch the same
   code, keep the upstream behavior **and** re-apply our change on top of it,
   so that every item in "Our custom changes" still meets its expected behavior.
4. Go through every item in "Our custom changes" with status Done or In progress
   and verify it still works on the new version. Fix anything that broke.
5. Build the app (see `android/README.md` for upstream build instructions) and
   make sure it compiles and runs.
6. Update the "Current upstream version" table above.
7. Add a line to the "Sync history" below, noting anything that needed rework.
8. Merge the working branch into `main`.

## Sync history

| Date | Upstream version | Notes |
|------|------------------|-------|
| 2026-11-26 | 1.106.1 (`release-branch/1.106`) | Initial import. No custom changes yet. |
