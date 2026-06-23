# Changelog

All notable changes to the `marketing-swarm` skill. Versions follow the parent
`agent-swarm` convention (the doc *is* the skill; a release is a meaningful protocol
change).

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
