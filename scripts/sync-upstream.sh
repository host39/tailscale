#!/usr/bin/env bash
# Pull a new upstream Tailscale Android release into android/ using git subtree.
#
# Usage:
#   scripts/sync-upstream.sh                      # newest release-branch/X.Y upstream
#   scripts/sync-upstream.sh release-branch/1.108 # a specific branch or tag
#   scripts/sync-upstream.sh main                 # bleeding edge (not recommended)
#
# Only a shallow (depth 1) fetch is done, and upstream history is squashed
# into a single commit, so our repository stays small.
set -euo pipefail

UPSTREAM_URL="https://github.com/tailscale/tailscale-android"
PREFIX="android"

cd "$(git rev-parse --show-toplevel)"

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Working tree is not clean. Commit or stash first." >&2
  exit 1
fi

REF="${1:-}"
if [[ -z "$REF" ]]; then
  REF="$(git ls-remote --heads "$UPSTREAM_URL" 'release-branch/*' \
    | awk '{print $2}' | sed 's#refs/heads/##' | sort -V | tail -1)"
fi
echo "Syncing $PREFIX/ with $UPSTREAM_URL @ $REF"

git fetch --depth=1 "$UPSTREAM_URL" "$REF"
SHA="$(git rev-parse FETCH_HEAD)"

git subtree pull --prefix="$PREFIX" FETCH_HEAD --squash \
  -m "Sync $PREFIX/ with upstream tailscale-android $REF ($SHA)"

echo
echo "Done. Upstream $REF is at $SHA."
echo "Next: update the 'Current upstream version' table in README.md,"
echo "then walk the 'Our custom changes' list and confirm each one still works."
