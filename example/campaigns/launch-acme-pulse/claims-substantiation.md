# Claims substantiation — Acme Pulse launch

> Fictional demo. The "primary sources" below are **fictional internal documents**
> invented for this worked example so every claim is traceable end-to-end. They are
> not real studies. See `brief.md` for the disclaimer.

The Legal/Compliance Reviewer (C-CLAIMS) gates against this file. **Rule: a claim
with no row here does not ship.** The CMO re-confirms each source rather than copying
an agent's claim verbatim (untrusted-input boundary). Presence of the `[^src:…]`
marker is Tier-1 (T1-07); whether the source supports the claim is Tier-2 judgement.

Every claim is stated **modestly and internally consistently** so the (fictional)
source backs it exactly — no rounding up, no "best", no comparative superlative.

## Source register (fictional primary sources)

| source id | fictional primary source | what it establishes |
|---|---|---|
| `[^src:onboarding-study]` | Acme Pulse Onboarding Study, Q1-2026, p.4 | New users built first funnel in median 8m40s (reported as "under 10 minutes") |
| `[^src:template-count]` | Acme Pulse GA release notes v1.0, "Report library" | 42 prebuilt report templates shipped at GA |
| `[^src:warehouse-support]` | Acme Pulse GA docs, "Supported warehouses" | Postgres, BigQuery, Snowflake supported at GA (3) |
| `[^src:setup-time]` | Acme Pulse Setup-Time Study, Q1-2026, p.2 | Median workspace querying within 1 business day of connect |
| `[^src:trial-terms]` | Acme Pulse pricing page snapshot, 2026-06-15 | Trial = 14 days, no credit card required |
| `[^src:trial-conversion]` | Acme Analytics trial cohort report, May 2026, p.1 | 18% of free trials converted to paid (the held baseline) |

## Claim → deliverable → source map

Every line carrying a `[^src:…]` marker in any deliverable has a row here.

| claim (as it appears) | deliverable + location | primary source (fictional) | verified by | date |
|---|---|---|---|---|
| First funnel in under 10 minutes, no SQL | messaging.md Pillar 1; blog/post.md §"Answers without a ticket"; landing/page.md hero subhead; email/welcome.md body; social/linkedin.md | `[^src:onboarding-study]` Onboarding Study Q1-2026 p.4 | Legal/Compliance Reviewer | 2026-06-22 |
| 42 prebuilt report templates | messaging.md Pillar 1; blog/post.md §"Answers without a ticket"; landing/page.md feature list | `[^src:template-count]` GA release notes v1.0 | Legal/Compliance Reviewer | 2026-06-22 |
| 3 supported warehouses (Postgres, BigQuery, Snowflake) | messaging.md Pillar 2; blog/post.md §"Works on the warehouse you already have"; landing/page.md feature list; social/x.md | `[^src:warehouse-support]` GA docs "Supported warehouses" | Legal/Compliance Reviewer | 2026-06-22 |
| Median workspace querying within one business day of connecting | messaging.md Pillar 2; blog/post.md §"Works on the warehouse you already have" | `[^src:setup-time]` Setup-Time Study Q1-2026 p.2 | Legal/Compliance Reviewer | 2026-06-22 |
| 14-day free trial, no credit card required | messaging.md Pillar 3; blog/post.md §"Try it"; landing/page.md CTA + form; email/welcome.md; social/linkedin.md; social/x.md; pr/press-release.md | `[^src:trial-terms]` pricing page snapshot 2026-06-15 | Legal/Compliance Reviewer | 2026-06-22 |
| 18% trial-to-paid conversion (baseline) | messaging.md Pillar 3; measurement/plan.md; pr/press-release.md | `[^src:trial-conversion]` trial cohort report May 2026 p.1 | Legal/Compliance Reviewer | 2026-06-22 |

## Footnote definitions (shared; derived deliverables reuse these verbatim)

[^src:onboarding-study]: Acme Pulse Onboarding Study, Q1-2026, p.4 (fictional). Median time to first funnel 8m40s; reported as "under 10 minutes".
[^src:template-count]: Acme Pulse GA release notes v1.0, "Report library" (fictional). 42 prebuilt report templates at GA.
[^src:warehouse-support]: Acme Pulse GA docs, "Supported warehouses" (fictional). Postgres, BigQuery, Snowflake.
[^src:setup-time]: Acme Pulse Setup-Time Study, Q1-2026, p.2 (fictional). Median workspace querying within one business day of connecting.
[^src:trial-terms]: Acme Pulse pricing page snapshot, 2026-06-15 (fictional). 14-day trial, no credit card.
[^src:trial-conversion]: Acme Analytics trial cohort report, May 2026, p.1 (fictional). 18% trial-to-paid conversion.
