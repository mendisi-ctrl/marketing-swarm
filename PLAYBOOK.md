# Playbook — portable cross-campaign swarm plays

This file is the swarm's **cross-campaign memory**: a small, curated set of *reusable
procedural plays* — parameterised orchestration patterns that have proven themselves
across more than one campaign. It is the skill's realisation of Karpathy's
**system-prompt learning**: an editable, version-controlled notebook the swarm writes
for itself, so a fresh run in *any* campaign starts ahead of every prior run instead
of relearning from zero.

It is distinct from the campaign-local lessons ledger (`swarm/lessons.md`), which is
ephemeral and dies with each campaign. The ledger is the **feeder**; this playbook is
the **durable, portable** layer. Only *generalizable, procedural* plays live here —
never campaign-specific facts (those stay in the ledger).

**The unit is a PLAY, not a war-story.** A play is procedural and parameterised
("when *X* holds → do *Y*"), because procedural knowledge transfers across campaigns
while episodic incident-narratives do not. If an entry only makes sense for one
product, it does not belong here.

**Read wholesale.** At this size the whole playbook is pasted into every agent prompt
(Phase 1 load + Phase 3 standing clause 3). Retrieval/top-k selection is deliberately
deferred until the playbook outgrows the cap (see `IMPROVEMENTS.md`).

## Entry schema

Each play records exactly these fields (canonical — kept byte-identical with the
`SKILL.md` Phase 3 clause):

`id | tags+archetype | play (imperative, parameterised, ≤3 lines) | trigger/symptom | verified root cause | the play/rule | provenance | helpful | harmful | status | origins (≥2) | first-seen | last-seen`

- **status** — `staging` (seen, not yet portable-proven) → `verified` (met the
  promotion gate) → `procedural` (graduated into `SKILL.md`; retire from here once it
  has).
- **provenance** — the verified evidence behind the play. The lead re-derives this; it
  is never copied verbatim from an agent report (untrusted-input boundary).
- **helpful / harmful** — hand-maintained tallies. `harmful ≥ helpful` ⇒ decay it.
- **origins** — sanitized references to the ≥2 *independent* campaigns the play held
  in (no names or secrets — e.g. "a B2B product launch", "a lifecycle email refresh").

## Promotion gate (verify, not just count)

A play leaves `staging` and becomes `verified` only when **both** hold:

1. It **recurred in ≥2 independent campaigns** (recorded in `origins`), and
2. It **passed a verify-gate** — it satisfies an `evals/` routing scenario, or the
   lead signs it off against re-derived evidence.

Origins may be **community-contributed**: a sanitized play-report from a cloner's
campaign (via the repo's play-report issue template) counts as one independent
origin once the maintainer has re-derived it — contributed reports are external
input under the anti-poisoning rule, never copied in verbatim.

Recurrence alone is not verification. A `verified` play that is *structural* (a
missing rule, not a fact) may graduate to `procedural` by being written into
`SKILL.md` itself (then deleted here). Every promotion/graduation/decay is a reversible
git commit logged in `LEARNING-LOG.md`.

## Consolidation ("sleep")

Hard cap **~15 entries**. On overflow, *before adding*: merge near-duplicates, decay
any entry with `harmful ≥ helpful` or that has gone stale, and graduate any
`procedural` candidate into `SKILL.md` (which frees a slot). Net size never grows past
the cap — this file is injected into every prompt, so it is a context-budget item.
Updates are incremental deltas, never a monolithic rewrite.

---

## Plays

### P1 — derive all channel copy from one approved message house

- **tags+archetype:** `#positioning #shared-file` · campaign / consistency
- **play:** When a campaign spans multiple channels, author the message house
  (`positioning/messaging.md`) FIRST via the sequential shared-file handoff, then have
  every channel deliverable derive from it — never let channel agents independently
  invent positioning in parallel.
- **trigger/symptom:** social, email, and blog copy each state a slightly different
  value prop; the Brand Guardian flags inconsistency at the pre-publish gate.
- **verified root cause:** parallel channel agents with no shared source of truth each
  re-derive positioning, so divergence is structural, not a quality lapse.
- **the play/rule:** message house is the one sanctioned shared-file (driver/navigator
  handoff); it is integrated before any derived deliverable wave launches.
- **provenance:** marketing-swarm v1.0.0 design — LLM-council finding (consistency-with-
  message-house, checklist item V-07).
- **helpful:** 1 · **harmful:** 0
- **status:** staging
- **origins:** building the marketing-swarm skill *(1 of ≥2 — needs a second
  independent campaign before it can promote)*
- **first-seen:** 2026-06-22 · **last-seen:** 2026-06-22

### P2 — substantiate before the Legal gate, not after

- **tags+archetype:** `#compliance #claims` · campaign / safety
- **play:** When a deliverable makes a comparative, performance, or superlative claim
  ("#1", "fastest", "best"), require a row in `claims-substantiation.md` mapping the
  claim to a primary source BEFORE the Legal/Compliance seat reviews — a missing
  citation is a Tier-1 fail (T1-07), not a Legal judgement call.
- **trigger/symptom:** the Legal reviewer blocks at the pre-publish gate over a claim
  whose source nobody recorded, forcing a late scramble or a pulled deliverable.
- **verified root cause:** substantiation treated as a post-hoc review step rather than
  an authoring acceptance criterion lets uncited claims reach the gate.
- **the play/rule:** citation-presence is a builder's Tier-1 done-when; source-supports-
  claim is the Legal seat's Tier-2 sign-off. Two tiers, both up front.
- **provenance:** marketing-swarm v1.0.0 design — Brand & Compliance council seat.
- **helpful:** 1 · **harmful:** 0
- **status:** staging
- **origins:** building the marketing-swarm skill *(1 of ≥2)*
- **first-seen:** 2026-06-22 · **last-seen:** 2026-06-22

### P3 — anonymize and axis-rank peer review; keep ranking and synthesis separate

- **tags+archetype:** `#peer-review #best-of-n` · campaign / quality
- **play:** When Phase 2.5 peer cross-review or best-of-N adjudication runs, strip
  author identity from deliverables before reviewers see them, have peers rank on
  defined axes (accuracy, on-brief insight) instead of free-form critique, and keep
  roles split: peers rank, the CMO synthesizes as chairman.
- **trigger/symptom:** reviewers anchor on who wrote a draft rather than what it
  says; free-form critiques converge on the same few notes; best-of-N picks collapse
  toward one model's house style.
- **verified root cause:** identity and unstructured critique bias ranking;
  same-model self-review collapses onto the same ideas — heterogeneity (different
  model families; persona briefs as an UNVERIFIED fallback extrapolation) is the
  entropy source.
- **the play/rule:** anonymize → axis-rank → chairman synthesis, with genuinely
  heterogeneous reviewers for high-stakes creative.
- **provenance:** 2026-08-03 research digest — Karpathy llm-council protocol +
  Dwarkesh interview (research-sourced; lead-approved in interactive curate session).
- **helpful:** 0 · **harmful:** 0
- **status:** staging
- **origins:** research-sourced *(0 of ≥2 campaigns — must recur in ≥2 independent
  campaigns AND pass a verify-gate before promotion)*
- **first-seen:** 2026-08-03 · **last-seen:** 2026-08-03

### P4 — four-component briefs; schema-validate every shared-artifact handoff

- **tags+archetype:** `#delegation #handoff` · campaign / reliability
- **play:** When delegating any subagent task, make the brief self-contained with
  four mandatory components — objective, output format, tools/sources, task
  boundaries — and end every agent's turn with a written handoff summary to the team
  board (the board as destination is a workflow derivation, not sourced). When a shared artifact (message house, brand lock) crosses a handoff,
  validate it against a versioned schema as a Tier-1 check.
- **trigger/symptom:** an agent returns work in the wrong shape or scope; a
  downstream deliverable silently diverges from the message house after an
  upstream edit nobody re-validated.
- **verified root cause:** subagents are stateless and briefs under-specify; schema
  drift fails silently and prose-reading Tier-2 reviewers won't catch structural
  divergence.
- **the play/rule:** brief = objective + format + tools/sources + boundaries;
  handoff = board summary + versioned-schema Tier-1 validation.
- **provenance:** 2026-08-03 research digest — Anthropic multi-agent research
  system, Improvado schema-drift case, context-amnesia protocol (research-sourced;
  lead-approved in interactive curate session).
- **helpful:** 0 · **harmful:** 0
- **status:** staging
- **origins:** research-sourced *(0 of ≥2 campaigns — must recur in ≥2 independent
  campaigns AND pass a verify-gate before promotion)*
- **first-seen:** 2026-08-03 · **last-seen:** 2026-08-03
