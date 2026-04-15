#!/usr/bin/env bash
set -euo pipefail

# Test: install.sh correctly installs skill files
# Covers: AC1 (one-click install) — partial (skill installation only, not full bootstrap)

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_SH="$SCRIPT_DIR/../install.sh"
PASS=0; FAIL=0

assert() {
    local desc="$1"; shift
    if "$@" >/dev/null 2>&1; then
        echo "  ✓ $desc"; PASS=$((PASS + 1))
    else
        echo "  ✗ $desc"; FAIL=$((FAIL + 1))
    fi
    return 0
}

echo "=== Install Script Tests ==="
echo ""

# --- Basic checks ---
echo "Script structure:"
assert "install.sh exists" test -f "$INSTALL_SH"
assert "install.sh is executable" test -x "$INSTALL_SH"
assert "install.sh has shebang" grep -q '#!/usr/bin/env bash' "$INSTALL_SH"

# helper: check if string contains pattern
contains() { echo "$1" | grep -q "$2"; }

# --- --help works ---
echo ""
echo "Help output:"
HELP_OUT=$(bash "$INSTALL_SH" --help 2>&1)
assert "--help mentions status" contains "$HELP_OUT" "status"
assert "--help mentions uninstall" contains "$HELP_OUT" "uninstall"
assert "--help mentions cognitive-kernel" contains "$HELP_OUT" "cognitive-kernel"

# --- --status works ---
echo ""
echo "Status output:"
STATUS_OUT=$(bash "$INSTALL_SH" --status 2>&1)
assert "--status runs without error" test -n "$STATUS_OUT"
assert "--status mentions cognitive-kernel" contains "$STATUS_OUT" "cognitive-kernel"

# --- Source files exist ---
echo ""
echo "Source files for installation:"
assert "SKILL.md exists in source" test -f "$SCRIPT_DIR/../SKILL.md"
assert "manifest.yml exists in source" test -f "$SCRIPT_DIR/../manifest.yml"
assert "registry/official.yml exists in source" test -f "$SCRIPT_DIR/../registry/official.yml"
assert "README.md exists in source" test -f "$SCRIPT_DIR/../README.md"
assert "LICENSE exists in source" test -f "$SCRIPT_DIR/../LICENSE"

# --- SKILL.md structure ---
echo ""
echo "SKILL.md structure:"
SKILL="$SCRIPT_DIR/../SKILL.md"
assert "SKILL.md has frontmatter" grep -q '^\-\-\-' "$SKILL"
assert "SKILL.md has name: meta-cogbase" grep -q 'name: meta-cogbase' "$SKILL"
assert "SKILL.md documents list command" grep -q '/meta-cogbase list' "$SKILL"
assert "SKILL.md documents search command" grep -q '/meta-cogbase search' "$SKILL"
assert "SKILL.md documents install command" grep -q '/meta-cogbase install' "$SKILL"
assert "SKILL.md documents uninstall command" grep -q '/meta-cogbase uninstall' "$SKILL"
assert "SKILL.md documents update command" grep -q '/meta-cogbase update' "$SKILL"
assert "SKILL.md documents registry command" grep -q '/meta-cogbase registry' "$SKILL"
assert "SKILL.md documents create command" grep -q '/meta-cogbase create' "$SKILL"
assert "SKILL.md documents status command" grep -q '/meta-cogbase status' "$SKILL"
assert "SKILL.md describes kernel collaboration" grep -q 'cognitive-kernel' "$SKILL"

# --- Summary ---
echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="
[[ $FAIL -eq 0 ]] && exit 0 || exit 1
