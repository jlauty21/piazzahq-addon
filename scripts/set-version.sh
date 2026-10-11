#!/usr/bin/env bash
# Point the add-on at a stable Piazza HQ release:  bash scripts/set-version.sh 1.92.3
# The add-on pulls ghcr.io/jlauty21/piazzahq:<version>, so that image tag must already exist (the app repo's Docker workflow publishes it on a stable release).
# Betas are never used here: x.y.z only.
set -euo pipefail
cd "$(dirname "$0")/.."
V="${1:-}"
[[ "$V" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "usage: bash scripts/set-version.sh x.y.z (a STABLE version, no -beta)" >&2; exit 2; }
CFG=piazzahq/config.yaml
sed -i -E "s/^version: \".*\"/version: \"$V\"/" "$CFG"
grep -q "^version: \"$V\"" "$CFG" || { echo "could not update $CFG" >&2; exit 1; }
# a new section at the top of the changelog (the Supervisor shows it on the update screen)
TMP="$(mktemp)"
{ echo "# Changelog"; echo; echo "## $V"; echo; echo "- Updated to Piazza HQ $V. The release notes are on https://piazzahq.com and in the app's What's New."; echo; tail -n +3 piazzahq/CHANGELOG.md; } > "$TMP"
mv "$TMP" piazzahq/CHANGELOG.md
echo "Add-on now points at ghcr.io/jlauty21/piazzahq:$V. Check the image exists, commit and push to publish the update."
