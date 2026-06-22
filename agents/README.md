# Agent role templates — reference prompts, not a registry

These files are **reference prompt templates the CMO fills per campaign**, not an
auto-spawning registry. There is one file per role named in [`../ROSTER.md`](../ROSTER.md):
`cmo.md`, the eight `leads/*.md`, and the twenty-nine `members/*.md`.

**The ownership map decides who runs — not this tree.** Per `SKILL.md` Phase 2 the
CMO builds a disjoint ownership map (workstream → deliverable files → agent) for the
specific campaign, and instantiates ONLY the leads and members that map needs.
Staffing all eight leads for one blog post is the anti-pattern (anti-over-staffing).
The roster is a menu; the map is the headcount.

**Leads vs members:**
- **Leads** (`leads/*.md`) are **persistent specialists** — spawned once and continued
  via `SendMessage` across waves, so they hold campaign context (voice, running
  creative decisions). Re-ground a resumed lead from its team-board row (`SKILL.md`
  Phase 4), don't relaunch it.
- **Members** (`members/*.md`) are **per-task subagents** — launched under a lead in a
  wave (one parallel message, `isolation: worktree`, background), each owning a
  disjoint deliverable file with a two-tier done-when. They commit, never publish, and
  are closed when their deliverable merges.

**How to fill a template:** every file ends with a *delegation prompt skeleton* full
of `<placeholders>` (e.g. `<campaign>`, `<base-SHA>`, `<owned-deliverable-file>`,
`<target-keyword>`, `<word-count band>`). The CMO (for leads) or the lead (for
members) replaces each `<placeholder>` with the campaign-specific value from the
brief / ownership map before pasting the prompt into an `Agent` (or `SendMessage`)
launch. Done-whens cite concrete catalogue IDs from
[`../BRAND-AND-COMPLIANCE.md`](../BRAND-AND-COMPLIANCE.md) (`T1-*`, `V-*`, `C-*`) —
keep those; tune only the parameters.

**Every member prompt inherits the three standing clauses** from `SKILL.md` Phase 3,
restated in each member file: (1) **peer-monitoring** — a peer critic reads your
deliverable against the shared definition-of-done before anything ships; (2) **read
the board first** — after the base-SHA check, read `swarm/board.md`, and re-read on
every resume; (3) **lessons** — honour the pasted-in `PLAYBOOK.md` (cross-campaign)
and `swarm/lessons.md` (this campaign). The lead pastes both ledgers in wholesale,
playbook first.

**Don't edit these as a campaign artifact.** They are durable templates; campaign
specifics live in the brief, the board, and the ledger. Graduate a stable per-campaign
edit back into a template only once it's earned with data (see `IMPROVEMENTS.md`).
