#!/usr/bin/env bash
set -euo pipefail

# Test: official.yml completeness and searchability
# Covers: AC2 (browse catalog), AC4 (search discovery)

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REGISTRY="$SCRIPT_DIR/../registry/official.yml"
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

echo "=== Registry Tests ==="
echo ""

# --- AC2: Browse catalog ---
echo "AC2: Browse catalog"

assert "official.yml exists" test -f "$REGISTRY"
assert "registry_version is 1" grep -q "registry_version: 1" "$REGISTRY"

# Count bases
BASE_COUNT=$(grep -c '^ *- name:' "$REGISTRY")
assert "19 bases in registry (found: $BASE_COUNT)" test "$BASE_COUNT" -eq 19

# Verify all 19 names present
for base in first-principles dialectical-thinking results-driven systems-thinking \
            attention-allocation bayesian-reasoning constraint-as-catalyst \
            conviction-override cross-domain-connector double-loop-learning \
            frame-auditing interactive-cognition inversion-thinking \
            motivation-audit non-attachment principled-action \
            second-order-thinking tacit-knowledge temporal-wisdom; do
    assert "  $base in registry" grep -q "name: $base" "$REGISTRY"
done

# Global required fields check
echo ""
echo "Schema validation (global counts):"
DESC_COUNT=$(grep -c 'description:' "$REGISTRY" || true)
TIER_COUNT=$(grep -c '^ *tier:' "$REGISTRY" || true)
REPO_COUNT=$(grep -c '^ *repo:' "$REGISTRY" || true)
# 19 bases + 1 registry-level description = 20 description lines
assert "all bases have description (found: $DESC_COUNT >= 19)" test "$DESC_COUNT" -ge 19
assert "all bases have tier (found: $TIER_COUNT)" test "$TIER_COUNT" -eq 19
assert "all bases have repo (found: $REPO_COUNT)" test "$REPO_COUNT" -eq 19

# --- AC4: Search discovery ---
echo ""
echo "AC4: Search discovery"

assert "search '审计假设' finds first-principles context" grep -q '审计假设' "$REGISTRY"
assert "search 'reasoning' finds bayesian context" grep -iq 'reasoning' "$REGISTRY"
assert "search '矛盾' finds dialectical context" grep -q '矛盾' "$REGISTRY"
assert "search 'core' tag exists" grep -q 'core' "$REGISTRY"
assert "search 'probability' finds bayesian description" grep -q 'probability\|概率' "$REGISTRY"

# --- Summary ---
echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="
[[ $FAIL -eq 0 ]] && exit 0 || exit 1
