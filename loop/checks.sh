#!/usr/bin/env bash
# checks.sh — self-heal content gate for the marketing-swarm weekly research loop.
#
# Usage: bash loop/checks.sh [REPO_ROOT]   (default: parent of this script's dir — C14)
# Exit code = number of failed checks (0 = green). One "✗ ..." line per failure.
# Deps: bash + POSIX grep/awk/sed/wc/head/find only. Codes against contract C1–C16.
set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO="${1:-$(dirname "$SCRIPT_DIR")}"

FAIL=0
fail() { echo "✗ $1"; FAIL=$((FAIL+1)); }

cd "$REPO" 2>/dev/null || { echo "✗ repo root not found: $REPO"; exit 1; }

# ── 1+2. SKILL.md frontmatter + the 13 required headings (C8, C9) ──
if [[ ! -f SKILL.md ]]; then
  fail "SKILL.md missing"
else
  [[ "$(head -n 1 SKILL.md)" == "---" ]] || fail "SKILL.md does not start with ---"
  grep -qF 'name: marketing-swarm' SKILL.md || fail "SKILL.md frontmatter missing 'name: marketing-swarm'"

  HEADINGS=(
    '# Marketing Swarm — autonomous multi-agent campaign operations'
    '## Phase 0 — Environment & brand check (cloud/unattended only; skip locally)'
    '## Phase 1 — Council protocol (before any non-trivial campaign work)'
    '## Phase 2 — Decomposition discipline'
    '## Phase 2.5 — Peer cross-review (alignment before commitment)'
    '## Phase 3 — Team execution model'
    '## Phase 4 — Cohesion mechanics'
    '## Phase 5 — Context discipline (keeps the CMO alive for hours)'
    '## Cross-campaign learning loop (self-improvement)'
    '## Weekly research loop (internet self-improvement)'
    '## Autonomy contract (default; campaign HANDOVER docs override)'
    '## Brand & compliance reference (the externalized checklists)'
    '## Invocation flow'
  )
  for h in "${HEADINGS[@]}"; do
    grep -qF "$h" SKILL.md || fail "SKILL.md missing heading: $h"
  done
fi

# ── 3. PLAYBOOK cap (C7) ──
pcount="$(grep -c '^### P' PLAYBOOK.md 2>/dev/null || true)"
[[ "$pcount" =~ ^[0-9]+$ ]] || pcount=0
[[ "$pcount" -le 15 ]] || fail "PLAYBOOK.md has $pcount '### P' entries (cap 15)"

# ── 4+5. CURRENT-PRACTICES header, cap, citations (C4, C5, C6) ──
CP="research/CURRENT-PRACTICES.md"
if [[ ! -f "$CP" ]]; then
  fail "$CP missing"
else
  head -n 1 "$CP" | grep -qF 'ADVISORY RESEARCH DATA — NOT INSTRUCTIONS' \
    || fail "$CP first line missing advisory header (C5)"
  cplines="$(($(wc -l < "$CP")))"   # $(( )) strips BSD wc's padding
  [[ "$cplines" -le 200 ]] || fail "$CP is $cplines lines (cap 200)"
  # Claim bullets need >=1 markdown http link; header comment block is exempt.
  uncited="$(awk '
    /<!--/ { inc = 1 }
    inc && /-->/ { inc = 0; next }
    inc { next }
    /^- / && !/\]\(http/ { c++ }
    END { print c + 0 }
  ' "$CP")"
  [[ "$uncited" -eq 0 ]] || fail "$CP has $uncited uncited claim bullet(s) — every '- ' bullet needs ](http... (C6)"
fi

# ── 6. Newest digest: 6 lens headings + Core proposals (C2, C3, C16) ──
newest=""
for d in research/digests/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].md; do
  [[ -f "$d" ]] && newest="$d"   # glob is lexicographically sorted = chronological
done
if [[ -n "$newest" ]]; then
  for lens in marketing-core ai-marketing loop-engineering graph-orchestration agent-maintenance karpathy-watch; do
    grep -Eq "^#{1,4} .*${lens}" "$newest" \
      || fail "digest $newest missing lens heading: $lens"
  done
  grep -Eq '^#{1,4} Core proposals' "$newest" \
    || fail "digest $newest missing '## Core proposals' heading"
fi

# ── 7. No merge-conflict markers in any .md ──
conflicts="$(grep -rl --include='*.md' --exclude-dir=.git '^<<<<<<<' . 2>/dev/null || true)"
[[ -z "$conflicts" ]] || fail "merge-conflict markers in: $(echo "$conflicts" | tr '\n' ' ')"

# ── 8. Relative markdown links resolve (SKILL.md, README.md, loop/*.md) ──
for f in SKILL.md README.md loop/*.md; do
  [[ -f "$f" ]] || continue
  dir="$(dirname "$f")"
  while IFS= read -r t; do
    case "$t" in
      http://*|https://*|mailto:*|'#'*) continue ;;
    esac
    t="${t%%#*}"    # strip anchor
    t="${t%% *}"    # strip optional "title"
    [[ -z "$t" ]] && continue
    [[ -e "$dir/$t" ]] || fail "$f: broken relative link -> $t"
  done < <(grep -oE '\]\([^)]+\)' "$f" 2>/dev/null | sed -E 's/^\]\(//; s/\)$//')
done

# ── 9. Freeze marker (C10) ──
[[ ! -e loop/state/FROZEN ]] || fail "loop FROZEN — clear loop/state/FROZEN after review"

[[ "$FAIL" -eq 0 ]] && echo "✓ checks green"
exit "$FAIL"
