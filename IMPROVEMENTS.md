# Improvements — prioritized backlog

A council-reviewed backlog for `marketing-swarm`. Ship confirmed high-leverage items;
record deferred and rejected ones here with the reason, so a future session doesn't
re-litigate a settled call. Mirror the parent `agent-swarm` discipline: **earn a new
mechanism with data** — add it only when real campaign use shows the need.

## Deferred (good idea, not yet earned)

- **Per-role executable prompt snippets that auto-spawn.** v1.0.0 ships `agents/` as
  *reference templates the CMO fills*, not an auto-spawning registry, to preserve the
  task-shaped disjoint-ownership invariant. If logs show the CMO re-writing the same
  role prompt verbatim every campaign, graduate the stable parts into the template.
  *(Defer until ≥2 campaigns show identical re-writes.)*
- **Top-k playbook retrieval.** The playbook is pasted wholesale into every prompt at
  its ~15-entry cap. Retrieval/selection is deferred until it outgrows the cap (same
  call agent-swarm made).
- **A programmatic JSON acceptance schema** for the two-tier done-when (machine-
  parseable Tier-1/Tier-2 records). Markdown + the catalogue IDs are enough at v1.0.0;
  revisit if a campaign needs a dashboard over acceptance results.
- **A dedicated `CHECKS.md`** split out from `BRAND-AND-COMPLIANCE.md`. Folded together
  for v1.0.0 (progressive disclosure). Split only if the body crosses the size
  threshold agent-swarm used for `ENVIRONMENT.md` (~the point the file stops being
  scannable).
- **Channel-MCP integrations** (real publish via Slack/Gmail/social MCPs). v1.0.0
  deliberately stops at the publish/spend gate with a drafted handoff; live publishing
  stays owner-gated. Wire MCPs only behind that gate, never around it.

## Rejected (with reason)

- **A live auto-publish phase.** Rejected: publishing is the irreversible-prod-write
  analogue (a sent email / wired press release cannot be recalled). It must stay an
  owner gate; automating it would break the autonomy contract's hard stop.
- **Importing `agent-swarm`'s `SKILL.md` by reference instead of adapting it.**
  Rejected: cross-skill `@import` is fragile (install-order dependency, nested-
  reference risk — the same finding agent-swarm's own backlog records). marketing-swarm
  is standalone; it credits the parent but does not depend on it at runtime.
- **Concurrent co-editing of the message house.** Rejected for the same reason
  agent-swarm rejects concurrent co-editing of a source file: the speed gain evaporates
  under semantic-conflict and lost-work tax. Use the sequential driver/navigator
  handoff instead.

## How to improve this skill

Use the skill on itself, as agent-swarm did: run Phase 1 (a small council of read-only
persona agents) over `SKILL.md`, **verify every load-bearing claim directly**, ship the
confirmed items, and log the deferred/rejected ones here. Every protocol change is a
commit; the cross-campaign learning loop (`LEARNING-LOG.md`) is the autonomous,
reversible path for graduating proven plays into `SKILL.md`.
