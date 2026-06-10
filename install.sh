#!/usr/bin/env bash
#
# AI Harness / install.sh
#
# Symlinks the 5 sub-skills into Claude Code and/or Codex skill directories.
# Re-runnable safely (overwrite after confirmation).
#
# Usage:
#   bash install.sh                 # Claude Code install, symlink mode (default)
#   bash install.sh --copy          # Claude Code install, copy mode
#   bash install.sh --codex         # Codex install
#   bash install.sh --all           # install for Claude Code and Codex

set -euo pipefail

SUB_SKILLS=(
  harness-init
  harness-new-project
  harness-archive
  harness-handoff
  harness-status
)

CLAUDE_SKILLS=("${SUB_SKILLS[@]}")
CODEX_SKILLS=(awesome-agent-memorybase "${SUB_SKILLS[@]}")

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
MODE="symlink"
TARGET_AGENT="claude"

for arg in "$@"; do
  case "$arg" in
    --copy) MODE="copy" ;;
    --claude) TARGET_AGENT="claude" ;;
    --codex) TARGET_AGENT="codex" ;;
    --all) TARGET_AGENT="all" ;;
    --help|-h)
      echo "Usage: bash install.sh [--copy] [--claude|--codex|--all]"
      echo ""
      echo "Install AI Harness skills for Claude Code and/or Codex."
      echo ""
      echo "Options:"
      echo "  --copy     Copy files instead of symlinking"
      echo "  --claude   Install for Claude Code only (default)"
      echo "  --codex    Install for Codex only"
      echo "  --all      Install for both Claude Code and Codex"
      exit 0
      ;;
    *)
      echo "Unknown argument: $arg"
      exit 1
      ;;
  esac
done

# Sanity check
if [[ ! -f "$SCRIPT_DIR/SKILL.md" ]]; then
  echo "Missing: SKILL.md — are you running from the awesome-agent-memorybase root?"
  exit 1
fi
for s in "${SUB_SKILLS[@]}"; do
  if [[ ! -f "$SCRIPT_DIR/skills/$s/SKILL.md" ]]; then
    echo "Missing: skills/$s/SKILL.md"
    exit 1
  fi
done

skill_source() {
  local skill="$1"
  if [[ "$skill" == "awesome-agent-memorybase" ]]; then
    echo "$SCRIPT_DIR"
  else
    echo "$SCRIPT_DIR/skills/$skill"
  fi
}

install_skills() {
  local label="$1"
  local target_dir="$2"
  shift 2
  mkdir -p "$target_dir"
  echo "Installing AI Harness for $label (mode: $MODE)"
  echo "  source: $SCRIPT_DIR"
  echo "  target: $target_dir/"
  echo ""
  for s in "$@"; do
    local src dst
    src=$(skill_source "$s")
    dst="$target_dir/$s"
    [[ -e "$dst" || -L "$dst" ]] && rm -rf "$dst"
    if [[ "$MODE" == "symlink" ]]; then
      ln -s "$src" "$dst"
      echo "  symlinked: $s"
    else
      cp -R "$src" "$dst"
      echo "  copied:    $s"
    fi
  done
}

if [[ "$TARGET_AGENT" == "claude" || "$TARGET_AGENT" == "all" ]]; then
  install_skills "Claude Code" "$HOME/.claude/skills" "${CLAUDE_SKILLS[@]}"
fi
if [[ "$TARGET_AGENT" == "codex" || "$TARGET_AGENT" == "all" ]]; then
  install_skills "Codex" "$HOME/.codex/skills" "${CODEX_SKILLS[@]}"
fi

echo ""
echo "Install complete!"
echo ""
echo "Next: open Claude Code or Codex in any directory and say: 初始化记忆库"
echo ""
if [[ "$MODE" == "symlink" ]]; then
  echo "Mode: symlink — edits to source take effect immediately."
fi
echo ""
