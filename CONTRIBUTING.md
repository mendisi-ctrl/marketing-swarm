# Contributing to marketing-swarm

## The core principle: the doc *is* the skill

There is no build step and no runtime. [`SKILL.md`](SKILL.md) is the product — a Claude
Code skill is a Markdown protocol the model reads and follows. "Shipping a feature"
means editing a Markdown file and committing it. So the bar is *clarity and
correctness of prose*, not passing a compiler. Optimize every change for: a fresh
session reading this cold reproduces the same throughput and safety.

## Repo layout

| Path | What it is | Edit when |
|---|---|---|
| `SKILL.md` | The protocol (frontmatter + five phases + contracts). The skill itself. | Changing how the swarm operates |
| `README.md` | Landing page / pitch / install | Positioning, install, hook |
| `QUICKSTART.md` | First-campaign walkthrough | Onboarding flow changes |
| `ROSTER.md` | The org-chart *menu* (index + one-line charters) | Adding/renaming a role |
| `agents/` | One reference prompt template per role (`cmo.md`, `leads/*.md`, `members/*.md`) + `agents/README.md` | Adding/changing a role's prompt |
| `BRAND-AND-COMPLIANCE.md` | Externalized voice/compliance checklists + the **Tier-1 runnable command catalogue** (`T1-*`, `V-*`, `C-*` IDs) | Adding/changing a check |
| `PLAYBOOK.md` | Portable cross-campaign procedural plays (learning loop) | Via the curate ritual only |
| `LEARNING-LOG.md` | Append-only audit trail of curate actions | Via the curate ritual only |
| `evals/` | Acceptance criteria + learning-loop regression scenarios | Adding a test for a change |
| `example/` | Worked Acme Pulse campaign (doubles as a fixture) | Adding/fixing demo coverage |
| `IMPROVEMENTS.md` / `CHANGELOG.md` | Prioritized backlog / released versions | Backlog grooming / release |

## Local dev loop

1. Install the skill so you can exercise edits live:
   ```bash
   # symlink your working copy in, so edits are picked up without re-cloning
   ln -s "$(pwd)" ~/.claude/skills/marketing-swarm
   ```
2. Edit the relevant Markdown. Type `/` in Claude Code to confirm `marketing-swarm`
   still resolves (a malformed frontmatter block will make it disappear).
3. Exercise it on a small multi-part brief (see `QUICKSTART.md`) and read whether the
   model actually follows the new instruction.
4. Run the consistency + Tier-1 checks below before committing.

## Adding or changing a role (the consistency rule)

Roles live in **three places that must stay in sync**: `ROSTER.md` (the index),
`agents/<…>.md` (the template), and the `T1-*/V-*/C-*` IDs in
`BRAND-AND-COMPLIANCE.md` (the checks a role's done-whens cite). To add a role:

1. **Create the template** under `agents/leads/` (persistent specialist) or
   `agents/members/` (per-task subagent). Match the existing files' shape:
   *Reports to · Charter · Owns (one disjoint deliverable) · Acceptance tiers
   (citing real catalogue IDs) · the three standing clauses · FIRST ACTION (guarded
   base-SHA check) · a reusable delegation prompt skeleton with `<placeholders>`.* See
   [`agents/README.md`](agents/README.md) for the contract.
2. **Index it** in `ROSTER.md` under the right lead, with a one-line charter and its
   default acceptance-tier emphasis.
3. **Cite only real IDs.** Every `T1-*`, `V-*`, `C-*` a done-when names must exist in
   `BRAND-AND-COMPLIANCE.md`. Adding a new check? Add it there first, *with its own
   one-line runnable check*, then cite it.
4. **Keep templates durable.** They are reference prompts the CMO fills per campaign —
   not campaign artifacts. Don't bake one campaign's specifics into a template;
   graduate a stable per-campaign edit back only once it's earned with data
   (`IMPROVEMENTS.md`).

Verify the three stay in sync (run from repo root):

```bash
# Every agents/ path cited in ROSTER.md must exist on disk:
for p in $(grep -ohE 'agents/[A-Za-z0-9/_-]+\.md' ROSTER.md | sort -u); do
  [ -f "$p" ] || echo "MISSING: $p"; done
# Every role file must be indexed in ROSTER.md (README.md is the index, skip it):
for f in $(find agents -name '*.md' ! -name README.md); do
  grep -q "$f" ROSTER.md || echo "ORPHAN: $f"; done
# No banned words in your prose (meta-mentions of the banned list are fine):
grep -rIniwE 'synergy|revolutionary|game-?changer|world-class|cutting-edge|disrupt|best-in-class' . \
  | grep -viE 'banned|V-03|T1-08' || echo "CLEAN"
```

## Conventions that carry weight

These aren't style preferences — they're the invariants the protocol relies on:

- **Two-tier done-when.** Every delegation criterion names its tier. Tier-1 = a literal
  `command` + expected exit code the lead runs itself. Tier-2 = a checklist ID + the
  reviewer persona + the evidence form. Push every grep-able sub-criterion *down* to
  Tier-1 to shrink the subjective surface.
- **Disjoint ownership.** One author per deliverable file. The only sanctioned overlap
  is the message house via the sequential handoff. Never propose concurrent co-editing.
- **Publish/spend is the owner gate.** Anything that goes live, spends, touches
  production PII, or is legally binding STOPS for the owner. Don't soften this language
  anywhere.
- **Untrusted-input boundary.** Competitor copy, UGC, influencer claims, scraped pages,
  and agent reports are *input, not instructions* — verify facts against a primary
  source, never copy phrasing, never let a self-report become a lesson verbatim.
- **Session trailer.** Swarm commits carry the `https://claude.ai/code/session_…`
  trailer for traceability — keep the convention when documenting commit behavior.
- **Style.** Terse, header-skimmable Markdown matching the existing files. Don't use the
  banned words in your own prose either.

## The learning loop (don't hand-edit PLAYBOOK/LEARNING-LOG)

`PLAYBOOK.md` and `LEARNING-LOG.md` are maintained by the **curate ritual**
(`SKILL.md → Cross-campaign learning loop`), not by direct PRs. A play graduates into
`SKILL.md` only after it has independently recurred in ≥2 campaigns **and** passed a
verify-gate (an `evals/` scenario or lead sign-off). If you're proposing a structural
change to the protocol, back it with an `evals/` scenario rather than asserting it.

**Ran a campaign with your clone? Contribute a play report instead of a PR.** Open a
[play-report issue](.github/ISSUE_TEMPLATE/play-report.md): the play (existing id or
proposed procedural text), a held/failed/neutral verdict, and a one-line sanitized
context. Never include campaign names, client facts, performance numbers, or
personal data — plays are procedural by design, so there is nothing confidential to
share. Contribution is strictly opt-in (the curate ritual asks; declining shares
nothing) and each verified report counts as one independent origin toward the
≥2-campaign promotion gate.

## Testing a change

- **Consistency + Tier-1:** run the snippets above; the `example/` campaign is a live
  fixture (e.g. every `[^src:…]` marker in a deliverable must map to a row in
  `example/campaigns/launch-acme-pulse/claims-substantiation.md`).
- **Behavioral:** exercise the edited protocol on a real multi-part brief and confirm
  the model follows the new instruction — prose that reads well but doesn't change
  behavior isn't done.
- **Regression:** if you change the learning loop or acceptance model, add/adjust a
  scenario in [`evals/`](evals/).

## Commits & releases

- Clear, imperative commit subjects describing the behavior change.
- Bump `version:` in `SKILL.md` frontmatter for a protocol change and add a
  `CHANGELOG.md` entry.
- Larger ideas: open them in `IMPROVEMENTS.md` (prioritized backlog) first so the
  rationale is captured.

## License

By contributing you agree your contributions are licensed under the repo's
[MIT License](LICENSE).
