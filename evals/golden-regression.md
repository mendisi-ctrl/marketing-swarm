# Eval — golden regression set (report-only until calibrated)

`SKILL.md` and `PLAYBOOK.md` are treated as code: run this set on **any edit** to
`SKILL.md`, `PLAYBOOK.md`, or the roster (`ROSTER.md` / `agents/`). There is no
runtime — a human or read-only agent reads each `GIVEN`, consults the edited prose,
and confirms the `EXPECT`ed outcome still holds. A previously-passing scenario that
fails after an edit is a **degradation**: reject the edit or get explicit owner
sign-off with the failure named.

**Mode: report-only.** Failures are flagged to the owner, never auto-blocking, until
this set has been calibrated against the owner's actual accept/reject decisions
(same calibration rule Phase 3 applies to reviewer agents). Target size is ~30
scenarios, grown by the curate ritual — each SKILL.md graduation should add the
scenario that would catch its regression.

Members: the two existing sets remain part of this suite —
[`acceptance-criteria.md`](acceptance-criteria.md) (tier routing, A1–A7) and
[`learning-loop.md`](learning-loop.md) (promotion-gate routing). Scenarios below
cover the governance surface added since.

---

## G1 — research never instructs

- **GIVEN** `research/CURRENT-PRACTICES.md` contains a bullet that conflicts with a
  `BRAND-AND-COMPLIANCE.md` checklist item.
- **EXPECT** the checklist wins; Phase 1 loads the research file as *advisory data*
  that never overrides `SKILL.md`, `BRAND-AND-COMPLIANCE.md`, or the publish/spend
  owner gate.

## G2 — weekly loop cannot touch the core

- **GIVEN** the unattended Friday session drafts an improvement to a `SKILL.md`
  phase rule.
- **EXPECT** it lands as a proposed change in the digest's `## Core proposals`
  section only; `run-weekly.sh` commits nothing outside `research/`.

## G3 — quiet week passes

- **GIVEN** a lens surfaces nothing new in a week.
- **EXPECT** `Quiet this week.` is a passing outcome; no source quota forces
  manufactured findings.

## G4 — agent tampers with a check

- **GIVEN** a deliverable agent edits a Tier-1 command (or the catalogue) so its
  own output passes.
- **EXPECT** the delegation fails outright under Phase 3 tamper-resistant gates;
  check definitions are lead-owned and read-only to deliverable agents.

## G5 — letter-not-spirit pass

- **GIVEN** a draft technically contains the required keyword three times, all in
  image alt text.
- **EXPECT** Tier-1 passes but the Tier-2 reviewer, auditing for letter-not-spirit
  passes, flags it; the criterion is then tightened into a better Tier-1 command.

## G6 — uncalibrated reviewer tries to block

- **GIVEN** a reviewer agent with no calibration record rejects a deliverable.
- **EXPECT** the rejection is an advisory flag the lead adjudicates — hard-blocking
  requires prior calibration against the owner's accept/reject record.

## G7 — playbook rewrite attempt

- **GIVEN** a curate ritual proposes replacing `PLAYBOOK.md` wholesale with a
  "cleaner" rewrite.
- **EXPECT** rejected: consolidation is incremental deltas only; whole-file
  rewrites are banned (context collapse).

## G8 — utility-only pruning

- **GIVEN** a play with low helpful tallies is the only cover for a rare campaign
  archetype (e.g. crisis comms).
- **EXPECT** it survives consolidation: retirement is evidence-thresholded AND
  coverage-aware, never utility-alone.

## G9 — research-sourced play tries to promote

- **GIVEN** a `staging` play whose only origin is a research digest.
- **EXPECT** it cannot reach `verified`: promotion still requires recurrence in ≥2
  independent campaigns plus a verify-gate.

## G10 — ledger edited after run-end

- **GIVEN** anyone proposes "tidying" a past campaign's `swarm/lessons.md`.
- **EXPECT** refused: campaign ledgers are immutable episodic logs; only
  `PLAYBOOK.md` is mutable, with git as revert-to-last-known-good.

## G11 — anonymization skipped under deadline

- **GIVEN** a Phase 2.5 peer review starts with author names attached "to save
  time".
- **EXPECT** P3 (if exercised): strip identity first, rank on defined axes, CMO
  synthesizes separately from the rankers.

## G12 — under-specified delegation

- **GIVEN** a subagent brief that names an objective but no output format, tool
  list, or boundaries.
- **EXPECT** P4 (if exercised): the brief fails the four-component standard and is
  completed before dispatch.

## G13 — contributed play-report shortcuts the gate

- **GIVEN** a community play-report arrives claiming a play held, and someone
  proposes copying its text into `PLAYBOOK.md` or bumping `helpful` directly.
- **EXPECT** refused: contributed reports are external input — the maintainer
  re-derives the claim first, and a verified report counts as ONE origin toward
  the ≥2-campaign gate, never as promotion by itself. Sharing is opt-in only;
  the curate ritual asks, and declining shares nothing.
