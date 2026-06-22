# Landing page — Acme Pulse free trial

> Fictional demo. Figures carry `[^src:…]` markers backed in
> `claims-substantiation.md`. Hero has alt text (T1-11); links UTM'd (T1-05); signup
> form carries a consent/privacy line + privacy-policy link (GDPR / C-GDPR); banned
> words absent (T1-08). Owner-gated: drafted, not published live.

## Hero

![Acme Pulse dashboard showing an activation funnel next to a 12-week retention curve](./assets/acme-pulse-hero.png "Acme Pulse: funnel and retention side by side")

**H1: See your product data the same day you ask.**

Subhead: Acme Pulse is a product-analytics dashboard that turns your existing
warehouse event data into funnels and retention reports — no SQL, no data-engineering
ticket. New users built their first funnel in under 10 minutes.[^src:onboarding-study]

**Primary CTA button:** Start your free trial →
Links to: https://www.acme-analytics.example/trial?utm_source=landing&utm_medium=web&utm_campaign=acme-pulse-launch

## Why Acme Pulse

- **Answers without a ticket.** Build funnels and retention charts yourself, in the
  browser. Start from one of 42 prebuilt report templates.[^src:template-count]
- **Your warehouse, not a copy.** Connects to 3 supported warehouses — Postgres,
  BigQuery, and Snowflake.[^src:warehouse-support]
- **Self-serve trial.** 14 days, no credit card required.[^src:trial-terms]

## Signup form

Fields: Work email · Company · Warehouse (Postgres / BigQuery / Snowflake)

**Submit button:** Create my free trial workspace

**Consent / privacy line (GDPR — C-GDPR):**
By creating a workspace you agree to the
[Privacy Policy](https://www.acme-analytics.example/privacy?utm_source=landing&utm_medium=web&utm_campaign=acme-pulse-launch)
and to Acme Analytics processing your email and company details to set up and support
your trial. We will not share your data with third parties for their own marketing,
and you can request deletion at any time. Marketing emails are opt-in and you can
unsubscribe whenever you like.

## Secondary links

- [Read the warehouse connection docs](https://docs.acme-analytics.example/pulse/connect?utm_source=landing&utm_medium=web&utm_campaign=acme-pulse-launch)
- [See the product tour](https://www.acme-analytics.example/pulse?utm_source=landing&utm_medium=web&utm_campaign=acme-pulse-launch)

---

[^src:onboarding-study]: Acme Pulse Onboarding Study, Q1-2026, p.4 (fictional). Median time to first funnel 8m40s; reported as "under 10 minutes".
[^src:template-count]: Acme Pulse GA release notes v1.0, "Report library" (fictional). 42 prebuilt report templates at GA.
[^src:warehouse-support]: Acme Pulse GA docs, "Supported warehouses" (fictional). Postgres, BigQuery, Snowflake.
[^src:trial-terms]: Acme Pulse pricing page snapshot, 2026-06-15 (fictional). 14-day trial, no credit card.
