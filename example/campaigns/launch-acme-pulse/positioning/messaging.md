# Message house — Acme Pulse

> Fictional demo. Acme Pulse, Acme Analytics, and every figure below are illustrative
> only. See `brief.md` for the full disclaimer. This is the **shared driver file**:
> authored first via the sequential shared-file handoff (Phase 3), every other
> deliverable derives its claims and framing from here (V-07). Do not invent claims
> in a derived deliverable — add them here first, with a source.

## Positioning statement

For product managers and growth teams who have event data but no fast way to see it,
**Acme Pulse™** is a product-analytics dashboard that turns warehouse event data into
funnels, retention curves, and activation reports without writing SQL — so the people
who own activation can answer their own questions the same day. Acme Pulse connects to
the warehouse you already have rather than asking you to copy data into a new one.

## Message pillars

### Pillar 1 — Answers without a SQL ticket
Priya can build a funnel or a retention chart herself, in the browser, instead of
filing a request to data engineering and waiting. Self-serve is the default, not a
power-user mode.
- Proof: In Acme's onboarding study, new users built their first funnel in **under 10
  minutes** without writing SQL. [^src:onboarding-study]
- Proof: Acme Pulse ships **42 prebuilt report templates** for activation, retention,
  and funnel analysis, so the common questions start from a template, not a blank
  canvas. [^src:template-count]

### Pillar 2 — Works on the warehouse you already have
Acme Pulse reads from your existing warehouse (Postgres, BigQuery, Snowflake) rather
than requiring a separate data pipeline, so there is no second copy of your data to
govern.
- Proof: Acme Pulse connects to **3 supported warehouses** — Postgres, BigQuery, and
  Snowflake — at general availability. [^src:warehouse-support]
- Proof: A median connected workspace was returning queries within **one business
  day** of connecting its warehouse in Acme's setup-time study. [^src:setup-time]

### Pillar 3 — Built for the activation owner, priced for the team
The dashboard is designed around activation and retention questions, and the trial is
self-serve so a team can evaluate it without a sales call.
- Proof: The free trial is **14 days, no credit card required**. [^src:trial-terms]
- Proof: In Acme's trial cohort, **18% of free trials converted to paid**, the
  baseline this launch aims to hold while growing signups. [^src:trial-conversion]

## Proof points → sources

Every marker above resolves to a row in `claims-substantiation.md`. The same markers
are reused verbatim in derived deliverables; do not create a new marker without a new
substantiation row.

| marker | claim (short form) |
|---|---|
| `[^src:onboarding-study]` | First funnel built in under 10 minutes, no SQL |
| `[^src:template-count]` | 42 prebuilt report templates |
| `[^src:warehouse-support]` | 3 supported warehouses (Postgres, BigQuery, Snowflake) |
| `[^src:setup-time]` | Median workspace querying within one business day |
| `[^src:trial-terms]` | 14-day free trial, no credit card |
| `[^src:trial-conversion]` | 18% trial-to-paid conversion (baseline) |

## Launch tagline (best-of-N winner — see WALKTHROUGH.md Phase 2)

**"See your product data the same day you ask."**

Chosen wholesale over two alternatives on `on-brand > accurate/compliant > clear >
on-strategy`. It is on-voice (confident, second-person-implied, no banned words),
makes no unsubstantiated claim, and is plain. Adjudication recorded in the walkthrough.

## Boilerplate

Acme Analytics builds product-analytics tools for teams that own activation and
retention. Acme Pulse, the company's product-analytics dashboard, turns existing
warehouse event data into funnels and retention reports without SQL. Acme Analytics is
a fictional company created for the `marketing-swarm` demonstration.

## Voice notes (for derived deliverables)

- Second person, active voice (V-01). Confident, not hype (V-06).
- Preferred terms: "product-analytics dashboard", "activation owner", "warehouse you
  already have". Avoid the banned list (V-03 / T1-08).
- Every number above is a claim — carry its `[^src:…]` marker wherever it appears.
