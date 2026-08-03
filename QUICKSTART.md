# Quickstart — your first campaign swarm

A 10-minute path from install to a finished, verified campaign that stops at the
publish gate. For the full protocol read [`SKILL.md`](SKILL.md); to watch every phase
play out on one campaign read [`example/WALKTHROUGH.md`](example/WALKTHROUGH.md).

## 1. Install

Clone into your Claude Code skills directory:

```bash
git clone https://github.com/mendisi-ctrl/marketing-swarm.git ~/.claude/skills/marketing-swarm
```

Claude Code auto-discovers it live (no restart). Confirm by typing `/` and looking for
`marketing-swarm`. Optionally install the **curate hook** (a `Stop`-hook reminder so
the cross-campaign learning loop fires at session end) — snippet in
[`README.md`](README.md#self-learning-across-campaigns).

## 2. Trigger it

The skill activates on phrasings like *"run a marketing swarm"*, *"CMO swarm"*,
*"campaign team"*, or *"orchestrate a marketing team"* — **for a multi-part campaign**.
For a single deliverable (one blog post, one email), say so: the swarm is the wrong
tool and the CMO will just write it directly.

## 3. Give it a brief (the one input that matters)

A fuzzy brief is the #1 cause of a bad run. Hand it five things up front — the CMO
turns these into the shared definition-of-done every agent is measured against:

| Brief field | Example |
|---|---|
| **Objective** | Drive free-trial signups for the Acme Pulse launch |
| **Target persona** | "Priya", a product manager drowning in SQL tickets |
| **Named metric + baseline** | Free-trial signups: 400/mo → **+25% (500/mo) in 60 days** |
| **Channels** | Blog, LinkedIn + X, launch email, landing page, press release |
| **Constraints** | Brand voice (confident, not hype); banned words; every numeric claim cited; nothing published without my sign-off |

> If high-stakes creative is in scope (a tagline, positioning, a press headline), state
> the **ranking criteria** in the brief — default `on-brand > accurate/compliant >
> clear > on-strategy` — or best-of-N adjudication collapses into taste.

A ready-to-paste opener:

```
Run a marketing swarm for the Acme Pulse launch.
Objective: free-trial signups. Persona: "Priya", a PM buried in SQL tickets.
Metric: 400/mo → +25% (500/mo) in 60 days. Channels: blog, LinkedIn+X, launch
email, landing page, press release. Constraints: confident-not-hype voice, every
numeric claim cited to a source, CAN-SPAM on email, press release owner-gated.
Rank high-stakes creative on on-brand > accurate/compliant > clear > on-strategy.
```

## 4. What happens (and where you stay in the loop)

The CMO session runs five phases (full detail in `SKILL.md`):

1. **Council** — writes the brief, runs read-only research, then a four-persona review
   (Brand Guardian · Legal/Compliance · Marketing-Ops · Delivery/Audience). **A
   Legal/Compliance no-go halts the run** and is surfaced to you.
2. **Decomposition** — builds a *disjoint ownership map* (workstream → deliverable
   files → agent) and shows it before launching. This is your cheapest checkpoint:
   skim who owns what.
3. **Execution** — launches a *heterogeneous wave* (builder agents + the Analytics &
   Ops verifier, in worktree isolation). Agents commit but **never publish**. A peer
   critic reviews the wave against the shared definition-of-done; the lead integrates
   and re-runs every Tier-1 check itself on the merged tree.
4. **Cohesion** — a shared [team board](SKILL.md#team-board-anti-silo--swarmboardmd)
   (`swarm/board.md`) and a curated [lessons ledger](SKILL.md#lessons-ledger-cross-agent-memory--swarmlessonsmd)
   keep the swarm aligned.
5. **Context discipline** — heavy reading is fanned to agents; the CMO keeps only
   conclusions.

What you'll see land: drafted deliverables in a campaign folder, a filled
`swarm/board.md`, and a Gate-1 evidence note (the lead's own Tier-1 command output).

## 5. The publish/spend gate — the one hard stop

The swarm **drafts everything but publishes nothing**. Going live (a sent email,
posted social, a press wire), spending budget, touching production audience lists, or
any legally binding claim is the **owner gate** — the marketing analogue of a prod
write, and non-negotiable. At the gate the CMO hands you the ready-to-publish artifact
(final copy + channel + schedule + its substantiation file) as a message and continues
other workstreams. **You** publish.

## 6. After the run — let it learn

Run the **curate ritual** *outside* the swarm (the `Stop` hook reminds you): it
promotes verified, repeatable plays into [`PLAYBOOK.md`](PLAYBOOK.md), graduates proven
structural ones into `SKILL.md`, and logs each as a reversible commit in
[`LEARNING-LOG.md`](LEARNING-LOG.md). The next campaign starts ahead of this one.

## 7. See it end-to-end

[`example/WALKTHROUGH.md`](example/WALKTHROUGH.md) runs the whole protocol once on the
fictional **Acme Pulse** launch — brief → council (incl. a trust-but-verify catch) →
ownership map → wave → peer review → message-house handoff → board → publish gate →
curate. The deliverables it references are real files under
`example/campaigns/launch-acme-pulse/`, so it doubles as a verification fixture.

## Tips

- **Small swarm.** Don't staff all eight leads for a three-asset campaign — the CMO
  instantiates only what the ownership map needs ([`ROSTER.md`](ROSTER.md) is a menu,
  not a headcount).
- **Name the metric.** "Awareness" is not a metric; "free-trial signups +25% in 60
  days" is. Everything downstream derives from it.
- **Trust the checks, not the vibes.** Push every grep-able criterion (banned words,
  UTM params, unsubscribe line, alt-text, ™/®) into Tier-1 so the human review surface
  shrinks to the genuinely subjective.
