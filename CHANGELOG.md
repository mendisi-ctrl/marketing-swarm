# Changelog

All notable changes to the `marketing-swarm` skill. Versions follow the parent
`agent-swarm` convention (the doc *is* the skill; a release is a meaningful protocol
change).

## [1.4.0] — 2026-08-03

Community learning channel — opt-in, artifact-level, human-gated. No telemetry.

### Added
- **Curate step 7 — Contribute (opt-in, clones only)**: after a cloner's campaign,
  the curate ritual asks once whether to share the run's sanitized play(s)
  upstream; declining shares nothing. Play reports carry procedural play text, a
  held/failed/neutral verdict, and a one-line sanitized context — never campaign
  names, numbers, claims, or personal data.
- **Play-report issue template** (`.github/ISSUE_TEMPLATE/play-report.md`) with a
  no-confidential-content confirmation and the external-input disclosure.
- **Community origins**: a maintainer-verified play report counts as one
  independent origin toward the ≥2-campaign promotion gate (PLAYBOOK gate +
  CONTRIBUTING updated) — two strangers' campaigns can now graduate a play.
- **`G13`** golden scenario: contributed reports cannot shortcut the gate —
  re-derive first, one origin only, opt-in always.
- README "Community learning" section stating out loud what is shared and what
  never is.

## [1.3.0] — 2026-08-03

First research-sourced protocol release: the seven verification-supported proposals
from the week-0 digest (`research/digests/2026-08-03.md` §Core proposals), applied in
a user-approved interactive curate session — the propose-only core gate working as
designed. The three unsupported proposals (invented statistics, unsourced numeric
rules) were rejected and remain digest-only.

### Added
- **Tamper-resistant gates** (Phase 3): Tier-1 check definitions are lead-owned and
  read-only to deliverable agents (editing a check fails the delegation); Tier-2
  reviewers audit for letter-not-spirit Tier-1 passes; reviewer agents hard-block
  only after calibration against the owner's accept/reject record.
- **Curation governance** (cross-campaign learning loop): helped/hurt/neutral
  verdicts at retro; evidence-thresholded, coverage-aware retirement (never prune on
  utility alone); immutable episodic ledgers vs the single mutable `PLAYBOOK.md`;
  generator/curator role separation made explicit.
- **Golden regression set** (`evals/golden-regression.md`): 12 scenarios (G1–G12,
  target ~30) run report-only on any edit to `SKILL.md`/`PLAYBOOK.md`/roster;
  `loop/RESEARCH-LOOP.md` gains a maintenance contract (quarterly audit, ~40 KB
  `SKILL.md` size budget, versioned playbook releases).
- **`P3`** (staging) — anonymized, axis-ranked council review with chairman
  synthesis (llm-council pattern). **`P4`** (staging) — four-component delegation
  briefs + schema-validated shared-artifact handoffs. Both research-sourced: the
  ≥2-campaign promotion gate still applies.

### Noted
- The two research-layer proposals (measurement triangulation, 2026 channel
  updates) were already fully reflected in `research/CURRENT-PRACTICES.md` by the
  week-0 distillation — recorded in `LEARNING-LOG.md`, no further edit needed.

## [1.2.0] — 2026-08-03

### Added
- **Weekly internet research loop** (`loop/RESEARCH-LOOP.md`) — the skill's second
  learning channel: six fixed lenses (marketing-core, ai-marketing,
  loop-engineering, graph-orchestration, agent-maintenance, karpathy-watch), dated
  digests in `research/digests/`, distilled into `research/CURRENT-PRACTICES.md`
  (advisory data, never instructions).
- **Self-heal gate** (`loop/checks.sh`) — every run gated; two consecutive red runs
  freeze the loop (`loop/state/FROZEN` + a macOS notification).
- **launchd entrypoint** (`loop/run-weekly.sh`) — Friday 07:30, headless `claude`
  with **no Bash** in its tool allowlist; auto-commit fenced to `research/**` (any
  other modified path rejects the whole run); best-effort push.
- **Propose-only core tier** — improvements to `SKILL.md` or anything outside
  `research/` land as proposed diffs in the digest's §Core proposals, applied only
  in an interactive curate session (an unattended job never rewrites its own
  instruction file from web input).
- **`research/` layer** seeded with a week-0 digest produced by an 8-agent research
  workflow.
- Wired through `SKILL.md`: Phase 1 now loads `research/CURRENT-PRACTICES.md` as
  *advisory research data* alongside the playbook, plus the new
  §Weekly research loop section; cloner setup + kill-switches in `README.md`.

## [1.1.0] — 2026-06-23

### Added
- **Visual brand lock** (`creative/brand-lock.md`) — the imagery analogue of the
  message house: the one signed visual source every image derives from, produced by
  the Brand & Creative Director **before any generation wave runs**. Integrated in
  dependency order alongside the message house.
- **Campaign-wide imagery gate** — the Brand & Creative Director signs off every image
  campaign-wide, including images embedded in *other* members' deliverables. It
  **gates (reviews), never edits** a peer's file, preserving strict disjoint ownership.
- **Gemini image-gen tooling** — the `gemini` CLI (headless `-p`) as the brand-aware
  brain that builds/critiques prompts against the brand lock and runs the conformance
  pass, paired with the nano-banana Gemini image MCP as the pixel generator/editor.
  (The `gemini` CLI has no one-shot image flag; the pair is documented as such.)
- **`T1-15`** — every generated/embedded image registered in `assets/manifest.md`
  with a `brand-lock:` ref + a signed `creative/brand-lock.md` (machine-checkable).
- **`V-08`** — visual brand-lock conformance (Tier-2), signed off by the imagery gate.
- Wired through `SKILL.md` (Phase 2 + creative tooling + integration order),
  `ROSTER.md`, `BRAND-AND-COMPLIANCE.md`, and the Brand & Creative Director, Art
  Director, and Video/Motion Designer agent templates.

## [1.0.0] — 2026-06-22

Initial release. The marketing-team sibling of `agent-swarm`: same five-phase
orchestration architecture and isolation invariants, marketing business logic.

### Added
- **`SKILL.md`** — the operating protocol: CMO lead session; team-lead persistent
  specialists; team-member subagents; the five phases (Council → Decomposition →
  Peer cross-review → Team execution → Cohesion) adapted for campaigns.
- **Two-tier "done-when"** — Tier-1 machine-checkable commands + Tier-2 checklist-
  gated reviewer sign-off, with the rule to push every grep-able sub-criterion down
  to Tier-1.
- **Council personas** — Brand Guardian, Legal/Compliance Reviewer (the hard gate),
  Marketing-Ops/Measurability Lead, Delivery/Audience Advocate; mapped to skill seats
  (`/security-review`, `/code-review`, `/verify`, `/loop`, `deep-research`, Figma).
- **Best-of-N** ranked on `on-brand > accurate/compliant > clear > on-strategy`.
- **Publish/spend owner gate** — the non-negotiable hard stop (marketing analogue of
  a prod write): no live publishing, paid spend, press/IR statements, or live-PII
  access without owner approval.
- **`ROSTER.md`** + **`agents/`** — the org-chart menu (CMO + 8 leads + 29 members,
  including the **Marketing Development Rep (MDR)**) with a dedicated reusable prompt
  template per role.
- **`BRAND-AND-COMPLIANCE.md`** — externalized checklists + the Tier-1 runnable command
  catalogue (T1-01…T1-14) + Tier-2 checklist IDs (V-*, C-*) + channel asset-spec table
  + claims-substantiation requirement.
- **`PLAYBOOK.md`** — cross-campaign procedural plays (seeded with P1, P2 in
  `staging`) + the ≥2-campaign + verify promotion gate.
- **`LEARNING-LOG.md`** — append-only audit trail for the autonomous curate loop.
- **`evals/learning-loop.md`** + **`evals/acceptance-criteria.md`** — routing
  regression tests for the learning loop and the two-tier acceptance model.
- **`example/`** — a complete worked-demo campaign (the fictional "Acme Pulse"
  launch) exercising all five phases, with a filled team board and lessons ledger.
