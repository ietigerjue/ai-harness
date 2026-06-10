#!/usr/bin/env bash
set -euo pipefail
SUB_SKILLS=(harness-init harness-new-project harness-archive harness-handoff harness-status)
echo "Removing AI Harness skills..."
for dir in "$HOME/.claude/skills" "$HOME/.codex/skills"; do
  if [[ -d "$dir" ]]; then
    for s in "${SUB_SKILLS[@]}"; do
      rm -rf "$dir/$s" 2>/dev/null && echo "  removed $dir/$s" || true
    done
    rm -rf "$dir/ai-harness" 2>/dev/null && echo "  removed $dir/ai-harness" || true
  fi
done
echo "Uninstall complete. Memory Base folders are not touched."
