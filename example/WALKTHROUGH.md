# Worked demo — running `marketing-swarm` on the Acme Pulse launch

> **Everything here is fictional.** **Acme Pulse** (a product-analytics dashboard) and
> **Acme Analytics** (its maker) do not exist; every metric, customer, quote, and
> "primary source" was invented for this walkthrough so the demo can show a claim
> traced end-to-end to a substantiation row. Nothing below is real benchmarking or
> marketing for any real product. This file is the narrative spine; the artifacts it
> references live under `campaigns/launch-acme-pulse/` and `swarm/`.

This walks the five-phase protocol from `SKILL.md` once, on one campaign, so a reader
can see how the pieces connect: brief → council → ownership map → heterogeneous wave →
peer review → message-house handoff → board → publish gate → curate loop.

---

## Phase 1 — Council protocol

**Brief first.** The CMO's first artifact is `campaigns/launch-acme-pulse/brief.md`:
objective (awareness + free-trial activation for the Acme Pulse launch), target
persona ("Priya, the PM"), and the named success metric with baseline — **free-trial
signups: baseline 400/mo → target +25% (500/mo) within 60 days**. The shared
definition-of-done derives from this brief; the best-of-N rank criteria are stated in
it up front.

**Explore (read-only).** Three parallel exploration agents would run via
`deep-research`: market/competitor landscape, audience/persona evidence, and
brand-voice + **source product facts**. In this demo the "source product facts" are
the fictional internal docs catalogued in `claims-substantiation.md`.

**Council verdict.** One Plan agent convenes four named personas; each gives a short
verdict with file paths:

- **Brand Guardian:** GO-with-changes. Voice is on-register; flagged that "the same
  day you ask" must stay a capability claim, not a guarantee. Pointed at
  `positioning/messaging.md` voice notes.
- **Legal/Compliance Reviewer:** GO-with-changes (not a no-go). Every numeric claim
  must have a substantiation row before draft; the email needs unsubscribe + a postal
  address; the press release is owner-gated. Pointed at `claims-substantiation.md` and
  `email/welcome.md`.
- **Marketing-Ops / Measurability Lead:** GO. The metric is named and baselined and is
  attributable via a single `utm_campaign`. Authored the UTM schema into
  `measurement/plan.md`.
- **Delivery / Audience Advocate:** GO-with-changes. Sequencing is feasible; asked the
  blog to lead with the "no SQL ticket" pain Priya actually feels, not a feature list.

**Joint verdict: GO with-changes.** Blocking changes: substantiation rows exist before
any claim is drafted; email compliance; press release stays owner-gated. Nice-to-have:
the blog's lead reframed to the pain.

**Trust-but-verify.** Before acting, the CMO re-checked each load-bearing claim against
the source docs (not the council's paraphrase). This caught one over-reach: an
exploration note had paraphrased the onboarding study as "first funnel in **5**
minutes". The source (`[^src:onboarding-study]`, median 8m40s) supports "**under 10**
minutes" only. The conservative wording was locked into the message house before any
deliverable derived from it — exactly the confidently-wrong product claim this step
exists to catch.

---

## Phase 2 — Decomposition discipline

**Ownership map (disjoint).** The lead's first post-brief artifact. One owner per
deliverable file, validated disjoint before launch (shown in full on
`swarm/board.md`):

| workstream | owner | owned file(s) |
|---|---|---|
| Message house | PMM / Messaging Strategist | `positioning/messaging.md` |
| Blog / SEO | Content Mgr / Long-form + SEO | `blog/post.md` |
| Social | Social Mgr / Social Copywriter | `social/linkedin.md`, `social/x.md` |
| Email | Lifecycle Mgr / Email Marketer | `email/welcome.md` |
| Landing | Demand-Gen / Landing-CRO | `landing/page.md` |
| PR | PR Mgr / Media Relations | `pr/press-release.md` |
| Measurement + claims | **Analytics & Ops (verifier)** | `measurement/plan.md`, `claims-substantiation.md` |

No two agents share a file. Social splits one-file-per-platform — a clean disjoint
split, so no shared-file handoff is needed there.

**Heterogeneous wave.** The wave launches builders **and** the Analytics & Ops verifier
together. The verifier doesn't draft copy — it authors the Tier-1 acceptance commands
and the UTM schema into `measurement/plan.md` *while* builders draft, so verification
is ready the instant copy lands rather than invented afterward.

**Best-of-N for the launch tagline.** High-stakes creative, so 2–3 independent
candidates in separate worktrees, then the council adjudicates on the brief's stated
ranking `on-brand > accurate/compliant > clear > on-strategy`:

- **A — "See your product data the same day you ask."**
- **B — "Funnels and retention, without the SQL ticket."**
- **C — "Product analytics that doesn't wait on data engineering."**

Adjudication: all three are compliant (no banned words, no unsubstantiated claim) and
clear. On **on-brand**, A best matches the confident-not-hype register and the
"activation owner answers their own question" core idea; B leads with a feature pair
and reads narrower; C names a team ("data engineering") in a faintly adversarial way
the Brand Guardian flagged against V-06. A wins on the top criterion, so it is taken
**wholesale** into `positioning/messaging.md` — no Frankenstein-ing B's "SQL ticket"
phrase into A. (The same best-of-N ran for the press-release headline; the winner is
marked in `pr/press-release.md`.)

---

## Phase 2.5 — Peer cross-review

A dedicated critic (the Brand Guardian seat, on a strong model) reviews against the
**shared definition-of-done**, at two checkpoints.

**Plan-time record.** Before any builder ran, agents reviewed each other's proposed
angles. The blog's proposed "feature tour" opening collided with the Delivery
Advocate's "lead with the pain" note; the critic resolved it to a single aligned plan
(open on the ticket-wait pain, features after). Converging here was cheaper than
discovering it in a finished draft.

**Pre-publish record (a caught flaw + resolution).**
- **Checked:** `git diff base..branch` for each deliverable against the DoD; ran T1-05
  (UTM), T1-07 (citations), T1-08 (banned words) as evidence.
- **Agreement:** blog, social, email passed all greps.
- **Disagreement → flaw caught:** the critic found `landing/page.md` stated "first
  funnel in under 10 minutes" with **no `[^src:…]` marker** — an uncited claim line
  that fails T1-07, even though the identical claim was cited in the blog and the
  message house.
- **Resolution:** resolved by re-reading the source (trust-but-verify), not by vote.
  The landing owner was re-tasked to copy the `[^src:onboarding-study]` marker **and**
  its footnote definition verbatim from the message house; the critic re-ran T1-07
  green. The durable rule was distilled into the ledger as **L-01**
  (`swarm/lessons.md`).
- **Verdict:** GO once L-01 was applied across all derived deliverables.

---

## Phase 3 — Team execution model

**Message house first, via the sequential shared-file handoff.**
`positioning/messaging.md` is the one file that must change deeply and indivisibly, so
it is **not** concurrently co-edited. The lead set a driver order (recorded in the
board's shared-file register): pmm-messaging drafts → brand-guardian-critic reviews
voice at the handoff → analytics-verifier confirms every `[^src:…]` marker has a
`claims-substantiation.md` row. Only one writer at a time; the baton passed via
SendMessage with a review gate at each handoff. No baton moved on an uncleared review.

**Then derived deliverables.** Every other file derives its claims and framing from the
finished message house (V-07). The blog, social, email, landing, and PR all reuse the
same six `[^src:…]` markers — never a new claim invented locally. That is what makes
the campaign a coherent verification fixture: one source of truth, reused.

**Standing clauses in every prompt.** Each agent got: the base-SHA guard (verify
`a1b2c3d4`; if diverged, `git status` first, never `reset --hard` over real work);
"read `swarm/board.md` first and on every resume"; the pasted-in playbook + the
campaign ledger (`swarm/lessons.md`); and the peer-monitoring notice. **Agents commit
with the session trailer; they never publish and never push.**

The lead integrates by cherry-picking in dependency order — **message house first**,
then everything derived from it — re-runs Tier-1 + Tier-2 on the merged tree, and posts
lead-generated Gate-1 evidence on the integration PR.

---

## Phase 4 — Cohesion mechanics

- **Team board:** `swarm/board.md` — the filled blackboard. Header carries campaign ·
  metric+baseline · DoD · base SHA · wave; then the ownership rows, the per-agent
  status rows, and the shared-file register showing the message-house driver order.
  The CMO is the sole scribe; every agent reads it.
- **Lessons ledger:** `swarm/lessons.md` — three seeded, verified lessons (L-01
  uncited reused claim; L-02 UTM on *every* link incl. unsubscribe; L-03 the
  `{{first_name}}` Liquid token is the one sanctioned `{{`). Each was re-confirmed by
  the lead before it became an entry — no agent self-report becomes a lesson.

---

## Phase 5 — Publish/spend gate + close

**The gate.** Integration is internal and done; **publishing is the owner's.** The
campaign **STOPS before publishing** — nothing is posted, sent, wired, or paid. Per
Phase 4, the gate becomes an async handoff: the CMO drafts the ready-to-publish
artifacts + the substantiation file into a message to the owner and continues no
further. The PR (`pr/press-release.md`) is the sharpest example — issuing a press
statement is a hard stop case.

**Drafted owner-handoff message (the artifact left at the gate):**

> **To:** owner · **Re:** Acme Pulse launch — ready to publish, awaiting your approval
> **Status:** all deliverables integrated, Tier-1 green (evidence on the integration
> PR, timestamped 2026-06-22), every claim mapped in `claims-substantiation.md`,
> Brand-Guardian and Legal sign-offs recorded.
> **Awaiting your go on the publish/spend actions I cannot take:**
> 1. Publish `blog/post.md` to the live blog.
> 2. Push `landing/page.md` from preview to the live trial URL.
> 3. Send `email/welcome.md` to the opt-in launch list (CAN-SPAM verified: unsubscribe
>    + postal address present).
> 4. Post `social/linkedin.md` and `social/x.md`.
> 5. **Issue `pr/press-release.md`** (press statement — explicit owner approval
>    required; headline is the best-of-N winner).
> No paid spend is staged. Reply "go" per item or all; I will not publish until you do.

**How the curate loop runs after.** Once the owner publishes (or declines), the
cross-campaign learning loop runs **outside** the swarm, as a session-end ritual — never
an in-run phase, because editing the skill repo while worktrees are live would break the
isolation invariants. It reflects over this campaign's verified ledger (L-01/L-02/L-03),
distils the procedural-and-generalizable ones (e.g. L-01 "reuse the marker AND its
footnote when reusing a claim"), and **promotes** a play to `PLAYBOOK.md` only after it
has independently recurred in ≥2 campaigns AND passed a verify-gate. Each promote /
graduate / decay is logged to `LEARNING-LOG.md` with its commit SHA for `git revert`.
Recurrence alone is not verification; one campaign is not ≥2.

---

## Map of artifacts referenced

- `campaigns/launch-acme-pulse/brief.md` — objective, persona, metric+baseline, rank criteria
- `campaigns/launch-acme-pulse/positioning/messaging.md` — the shared driver (message house)
- `campaigns/launch-acme-pulse/blog/post.md` — launch blog
- `campaigns/launch-acme-pulse/social/{linkedin,x}.md` — per-platform posts
- `campaigns/launch-acme-pulse/email/welcome.md` — welcome/launch email (CAN-SPAM)
- `campaigns/launch-acme-pulse/landing/page.md` — landing page (GDPR consent)
- `campaigns/launch-acme-pulse/pr/press-release.md` — owner-gated press release
- `campaigns/launch-acme-pulse/measurement/plan.md` — verifier's metric + Tier-1 commands
- `campaigns/launch-acme-pulse/claims-substantiation.md` — every claim → its source
- `swarm/board.md` · `swarm/lessons.md` — the team board and the lessons ledger
