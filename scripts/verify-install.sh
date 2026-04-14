#!/usr/bin/env bash
# Brand Toolkit - Installation Verification
# Usage: ~/.claude/plugins/brand-toolkit/scripts/verify-install.sh

set -euo pipefail

PASS="[OK]"
FAIL="[ISSUE]"
errors=0

# Where this script lives
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PLUGIN_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PLUGIN_NAME="$(basename "$PLUGIN_DIR")"

# Expected skills (one SKILL.md each)
EXPECTED_SKILLS=(
  "brand-ad-copy"
  "brand-audit"
  "brand-competitor-scan"
  "brand-landing-page"
  "brand-messaging"
  "brand-positioning"
  "brand-radar"
  "brand-visual-identity"
  "brand-voice"
  "start"
)

echo ""
echo "Brand Toolkit install check"
echo "==========================="
echo ""

# 1. Check plugin.json
if [ -f "$PLUGIN_DIR/.claude-plugin/plugin.json" ]; then
  echo "  $PASS plugin.json found"
else
  echo "  $FAIL plugin.json missing"
  echo "       Expected at: $PLUGIN_DIR/.claude-plugin/plugin.json"
  errors=$((errors + 1))
fi

# 2. Check skills directory
if [ -d "$PLUGIN_DIR/skills" ]; then
  echo "  $PASS skills/ directory found"
else
  echo "  $FAIL skills/ directory missing"
  echo "       Expected at: $PLUGIN_DIR/skills/"
  errors=$((errors + 1))
fi

# 3. Count and check individual skills
found=0
missing_skills=()
for skill in "${EXPECTED_SKILLS[@]}"; do
  if [ -f "$PLUGIN_DIR/skills/$skill/SKILL.md" ]; then
    found=$((found + 1))
  else
    missing_skills+=("$skill")
  fi
done

if [ ${#missing_skills[@]} -eq 0 ]; then
  echo "  $PASS $found/$found skills detected"
else
  echo "  $FAIL $found/${#EXPECTED_SKILLS[@]} skills detected"
  for ms in "${missing_skills[@]}"; do
    echo "       Missing: $ms"
  done
  errors=$((errors + 1))
fi

# 4. Check if installed in the auto-load directory
CLAUDE_PLUGINS_DIR="$HOME/.claude/plugins"
if [ "$(cd "$PLUGIN_DIR" && pwd)" = "$(cd "$CLAUDE_PLUGINS_DIR/brand-toolkit" 2>/dev/null && pwd)" ] 2>/dev/null; then
  echo "  $PASS Installed in ~/.claude/plugins/ (auto-loads every session)"
else
  echo "  $FAIL Not in ~/.claude/plugins/"
  echo "       Claude Code won't auto-load this plugin."
  echo "       Fix: move or clone to $CLAUDE_PLUGINS_DIR/brand-toolkit"
  echo "       Or use: claude --plugin-dir $PLUGIN_DIR (loads for one session only)"
  errors=$((errors + 1))
fi

# 5. Check directory name
if [ "$PLUGIN_NAME" = "brand-toolkit" ]; then
  echo "  $PASS Directory name is correct (brand-toolkit)"
else
  echo "  $FAIL Directory name is '$PLUGIN_NAME' (expected 'brand-toolkit')"
  echo "       GitHub sometimes appends '-main' or a branch name when downloading."
  echo "       Fix: rename the directory to 'brand-toolkit'"
  errors=$((errors + 1))
fi

# Summary
echo ""
if [ $errors -eq 0 ]; then
  echo "  Ready to use. Open Claude Code and run /brand-toolkit:start"
else
  echo "  Found $errors issue(s). Fix them and run this script again."
fi
echo ""
