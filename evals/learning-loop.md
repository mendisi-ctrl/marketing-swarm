# Eval — cross-campaign learning loop routing

Worked scenarios that **specify the promotion gate by example**. There is no runtime
to execute these; a human or a read-only agent reads each `GIVEN` and confirms the
loop's prose in `SKILL.md` produces the `EXPECT`ed routing. This is the verify-gate's
own regression test — run it after any edit to the learning-loop section.

A scenario **passes** when the routing decision the protocol prescribes matches
`EXPECT`.

---

## S1 — campaign-specific lesson stays local (no promotion)

- **GIVEN** a verified ledger entry: *"Acme Pulse's free-trial CTA converts better as
  'Start tracking' than 'Sign up' for this audience."*
- **WHEN** the curate step runs.
- **EXPECT** it stays in `swarm/lessons.md` and is **not** promoted: it names a
  specific product, audience, and CTA → episodic + campaign-specific, fails the
  "procedural & generalizable" distill test. Dies with the campaign.

## S2 — generalizable play promotes only on ≥2 origins + verify

- **GIVEN** a play *"when a campaign spans multiple channels, author the message house
  first via the shared-file handoff and derive all channel copy from it"* (P1) that has
  now appeared with verified evidence in **two independent** campaigns and satisfies
  this eval's procedural shape.
- **WHEN** the curate step runs.
- **EXPECT** it is **promoted** to `PLAYBOOK.md` as `status: verified` (≥2 `origins` +
  verify-gate met), with provenance and `helpful: ≥1`. A logged `promote` line is
  written to `LEARNING-LOG.md` with the commit SHA.

## S3 — single-origin play does NOT promote yet

- **GIVEN** the same kind of play but seen in **only one** campaign so far
  (`status: staging`, one `origin`) — exactly the state of P1 and P2 at v1.0.0.
- **WHEN** the curate step runs.
- **EXPECT** it **remains `staging`** in `PLAYBOOK.md` — recurrence gate (≥2
  independent origins) not met. No promotion, no protocol edit. (Recurrence ≠
  verification, and one origin ≠ recurrence.)

## S4 — harmful play decays

- **GIVEN** a `PLAYBOOK.md` entry whose tally has reached `harmful: 2 | helpful: 1`
  after following it caused an off-strategy campaign in a later run.
- **WHEN** the curate step runs (or the cap is hit).
- **EXPECT** it is **retired** (`decay`) — `harmful ≥ helpful` — and a `decay` line is
  logged with the SHA. Net playbook size does not grow.

## S5 — verified structural play graduates into the protocol

- **GIVEN** a `verified` play that is *structural* (a missing rule, not a fact) — e.g.
  *"always pull a deliverable from the publish set the moment a claim fails the Legal
  gate"* — and has held across ≥2 origins.
- **WHEN** the curate step runs.
- **EXPECT** it is **graduated**: written into `SKILL.md` as protocol (a reversible
  commit), then **deleted** from `PLAYBOOK.md` (freeing a slot). A `graduate` line is
  logged with the SHA.

## S6 — curation runs outside the swarm (isolation invariant)

- **GIVEN** a campaign swarm is mid-run with active worktrees.
- **WHEN** would the curate/self-edit step execute?
- **EXPECT** **never mid-run.** Injection (read-only playbook load) happens during the
  run; promotion/edit happens only in the post-run curate ritual, outside any
  worktree, fired by the session-end hook. (Guards the worktree-isolation invariant:
  single-campaign worktrees, agents commit-not-push, lead sole scribe.)
