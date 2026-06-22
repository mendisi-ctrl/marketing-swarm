# Campaign brief — Launch: Acme Pulse

> **Fictional-disclaimer.** Acme Pulse, Acme Analytics, every metric, customer,
> quote, and source cited in this campaign are **fictional and for illustration
> only**. Nothing here describes a real product or company. The numbers exist so the
> demo's claims-substantiation file can back every claim end-to-end; they are not
> real benchmarks. Treat this campaign as a worked example of the `marketing-swarm`
> protocol, not as marketing for anything that exists.

## Objective

Drive awareness and free-trial activation for the launch of **Acme Pulse**, a
product-analytics dashboard by **Acme Analytics**, among product managers and growth
teams at small-to-mid software companies.

## Target persona

**"Priya, the PM at a 30–150-person SaaS company."** She owns activation and
retention, has product event data in a warehouse but no easy way to see funnels
without filing a ticket to data engineering, and is measured on weekly active users.
She is skeptical of hype, reads docs before demos, and decides in a 15-minute
evaluation whether a tool is worth a trial.

## Named success metric + baseline

- **Primary metric: free-trial signups.**
  **Baseline 400/mo → target +25% (to 500/mo) within 60 days of launch.**
- Secondary (read-only, not a gate): trial-to-paid conversion holds at or above its
  current 18% so the extra signups are not junk traffic.

This exact metric and baseline is the spine of the shared definition-of-done and
must match `measurement/plan.md` and `swarm/board.md` verbatim.

## Channels

- Launch **blog post** (owned, SEO entry point) — target keyword **"product
  analytics dashboard"**.
- **Landing page** (trial signup, the conversion surface).
- **Email** welcome/launch to the existing opt-in trial-interest list.
- **Social**: LinkedIn + X (one file per platform, disjoint).
- **PR**: a short press release (owner-gated, not published in this demo).

## Constraints (non-negotiable)

- **Claims.** Every external/factual/performance claim carries a `[^src:…]` marker
  and has a backing row in `claims-substantiation.md` (C-CLAIMS / T1-07). No claim
  ships without a source.
- **UTM.** Every outbound link carries `utm_source`, `utm_medium`,
  `utm_campaign` (T1-05).
- **Email compliance.** Unsubscribe line + physical postal address + truthful
  subject (CAN-SPAM / T1-10, C-CANSPAM).
- **Consent.** Signup forms carry a consent/privacy line + privacy-policy link
  (GDPR / C-GDPR).
- **Accessibility.** Every image has non-empty alt text (T1-11 / C-A11Y).
- **Voice.** Second person, confident-not-hype. **Banned words:** synergy,
  revolutionary, game-changer, world-class, cutting-edge, disrupt, best-in-class
  (T1-08 / V-03). No placeholder/TODO/Lorem text (T1-01).
- **Trademark.** "Acme Pulse" is the product; first mention in each long-form
  deliverable may carry ™ per the (fictional) brand guide (T1-12 / C-TM).
- **Publish/spend gate.** Nothing is published, sent, posted, wired, or paid. The
  swarm drafts and commits; the owner publishes.

## Best-of-N rank criteria (stated up front, per Phase 2)

For high-stakes creative (the launch **tagline** and the **press-release headline**),
run 2–3 independent candidates, then adjudicate by, in order:

**on-brand > accurate/compliant > clear > on-strategy.**

Tie-breaks: a compliance/claims tie → Legal/Compliance Reviewer; a voice tie → Brand
Guardian; a measurability tie → Marketing-Ops Lead. Record the reasoning; take the
winner wholesale (no Frankenstein-ing). Genuine deadlock → escalate to owner.

## Shared definition-of-done (derived from this brief)

A deliverable is done when: Tier-1 checks are green (T1-01 placeholder-free, T1-05
UTM, T1-07 citations, T1-08 banned words, plus its role-specific IDs); every claim
maps to a `claims-substantiation.md` row; voice passes the Brand Guardian checklist
(V-*); and changes land only in the agent's owned files. Derived deliverables are
consistent with `positioning/messaging.md` (V-07).
