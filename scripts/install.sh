#!/usr/bin/env bash
# Install the full design pack to ~/.agents/skills/ (preserves sibling paths).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${AGENTS_SKILLS_DIR:-$HOME/.agents/skills}"
mkdir -p "$DEST"
for skill in design impeccable stop-slop design-taste-frontend web-animation-design scrollcraft prototype; do
  src="$ROOT/skills/design/$skill"
  if [[ -d "$src" ]]; then
    rm -rf "$DEST/$skill"
    cp -R "$src" "$DEST/$skill"
    echo "installed: $skill -> $DEST/$skill"
  fi
done
echo "Done. Orchestrator: $DEST/design/SKILL.md"
