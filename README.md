# marketing-swarm

A **Claude Code skill** that runs a *CMO lead session* orchestrating a swarm of
marketing sub-agents — with the safety rails that keep parallel agents from stepping
on each other and the verification discipline that keeps their output trustworthy and
compliant.

It is the **marketing-team sibling of [`agent-swarm`](../SKILL.md)**: the same
battle-tested five-phase orchestration architecture and isolation invariants, with
the software-engineering business logic swapped for a marketing org. Where agent-swarm
runs builders + a verifier across code workstreams, marketing-swarm runs a CMO over
team leads (Brand, Content, PMM, Demand-Gen, Lifecycle, Social, PR, Analytics) and
their team-member subagents across campaign deliverables.

Credit where due: the orchestration mechanics (council, ownership map, peer
cross-review, team board, lessons ledger, cross-project learning loop, autonomy
contract) are adapted directly from `agent-swarm`. marketing-swarm is standalone — it
does not require agent-swarm to be installed — but a reader fluent in one is fluent
in the other.

## Why this exists

Naïve "spawn 10 marketers" parallelism produces off-brand copy, unsubstantiated
claims, duplicated work, and a lead drowning in drafts. This skill is the opposite
stance: **small swarm, strict deliverable ownership, heavy verification, and a
non-negotiable publish/spend gate.** Parallelize only what is independent *and*
checkable.

## The protocol at a glance

| Phase | What it covers |
|-------|----------------|
| **1 — Council** | Write the campaign brief (objective + persona + named metric + baseline) → explore (read-only research agents) → council review with named personas (Brand Guardian, Legal/Compliance — the hard gate, Marketing-Ops, Delivery/Audience) → re-verify every load-bearing claim against source docs. |
| **2 — Decomposition** | Anti-serial-collapse (ownership map of deliverables first), heterogeneous waves (builders + a verifier in the same wave), a **two-tier "done-when"** per delegation (Tier-1 machine-checkable + Tier-2 checklist-gated), best-of-N for high-stakes creative (tagline/positioning/press). |
| **2.5 — Peer cross-review** | Working agents critique each other's actual deliverables against one shared definition-of-done, plan-time and pre-publish; plus *peer-monitoring awareness*. |
| **3 — Team execution** | One agent per workstream in an isolated worktree, strict disjoint deliverable ownership (with a bounded *sequential handoff* for the message house), base-SHA check first, agents commit but never publish/push, lead integrates + verifies + single push + evidence. |
| **4 — Cohesion** | Persistent team-lead specialists (continue, don't relaunch), model-shaped swarm, gates as async handoffs, read-only research probes, a shared *team board* and a curated *cross-agent lessons ledger*. |
| **5 — Context discipline** | Fan heavy reading out to agents; the CMO keeps only conclusions and never reads raw agent transcripts. |

Plus an **autonomy contract** whose hard stop is the **publish/spend owner gate**
(the marketing analogue of a prod write — a sent email or wired press release cannot
be recalled), a defined **roster** ([`ROSTER.md`](ROSTER.md)) with per-role prompt
templates under [`agents/`](agents/), the **brand & compliance reference**
([`BRAND-AND-COMPLIANCE.md`](BRAND-AND-COMPLIANCE.md)), and a worked
[`example/`](example/) campaign.

## The two-tier "done-when" (the core adaptation)

Marketing deliverables aren't code, so a single "machine-checkable acceptance
criterion" doesn't always fit. marketing-swarm splits it:

- **Tier 1 — machine-checkable**: the lead runs a command and reads the exit code —
  SEO keyword presence, word-count band, no-placeholder grep, link integrity, UTM
  presence, asset specs, banned-words, unsubscribe/disclaimer presence. (Catalogue in
  `BRAND-AND-COMPLIANCE.md`.)
- **Tier 2 — checklist-gated**: a named reviewer persona signs off with cited
  evidence — holistic brand voice, whether a cited source actually supports a claim,
  compliance adequacy, on-strategy resonance.

Every done-when names which tier each criterion is in, and every grep-able
sub-criterion is pushed down to Tier 1 to shrink the subjective surface.

## Self-learning across campaigns

The swarm gets better the more campaigns you run. A portable
[`PLAYBOOK.md`](PLAYBOOK.md) holds reusable **procedural plays** that proved
themselves across ≥2 campaigns; it's injected into every agent so a fresh run starts
ahead of prior runs. The campaign-local lessons ledger feeds it; a post-run **curate
ritual** — run *outside* the swarm, so it never breaks worktree isolation —
autonomously promotes verified plays, graduates proven structural ones into
`SKILL.md`, and logs every action to [`LEARNING-LOG.md`](LEARNING-LOG.md), each a
reversible commit (`git revert` is the kill-switch).

**Install the curate hook** so the loop fires automatically instead of rotting. Add a
`Stop` hook to your Claude Code `settings.json` (a markdown skill has no runtime to
self-trigger, so the hook is a reminder nudge at session end):

```json
{
  "hooks": {
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'marketing-swarm: if a campaign swarm ran this session, run the cross-campaign curate ritual (SKILL.md -> Cross-campaign learning loop) before ending.'"
          }
        ]
      }
    ]
  }
}
```

Cloners install the hook themselves — a repo cannot install one for you.

## Install

Clone directly into your Claude Code skills directory:

```bash
git clone <this-repo-url> ~/.claude/skills/marketing-swarm
```

Claude Code will auto-discover it (live — no restart needed; confirm by typing `/`
and looking for `marketing-swarm`). The skill activates on triggers like
*"marketing swarm"*, *"run a campaign swarm"*, *"CMO swarm"*, *"campaign team"*, or
*"orchestrate a marketing team"*.

To update later:

```bash
cd ~/.claude/skills/marketing-swarm && git pull
```

## Improving it

Edit `SKILL.md` and commit — the doc *is* the skill. See
[`IMPROVEMENTS.md`](IMPROVEMENTS.md) for a prioritized backlog and
[`CHANGELOG.md`](CHANGELOG.md) for released versions. The skill also improves itself
across campaigns — see "Self-learning across campaigns" above.

## License

[MIT](LICENSE).
