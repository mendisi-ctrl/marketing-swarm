# Lessons ledger — campaign-local (launch-acme-pulse)

> Fictional demo. Lead-curated, verified-only ledger (Phase 4). An entry is added
> ONLY after the CMO independently re-confirmed both the failure and that the fix
> resolves it. Hard cap ~5–10; pasted into every new agent's prompt (Phase 3 clause
> 3). Format: `id | lesson | trigger/symptom | verified root cause | the fix/rule |
> evidence ref | date | status`.

| id | lesson | trigger/symptom | verified root cause | the fix/rule | evidence ref | date | status |
|---|---|---|---|---|---|---|---|
| L-01 | Carry the `[^src:…]` marker on a claim wherever it appears, not just in the message house. | Landing page stated "first funnel in under 10 minutes" with no marker; same claim was cited in the blog. | Derived deliverables paraphrased the message house but dropped the footnote; T1-07 grep flagged an uncited claim line on the landing page. | When you reuse a numeric/factual claim from `positioning/messaging.md`, copy its `[^src:…]` marker AND its footnote definition verbatim. Re-run T1-07 before reporting done. | board.md row `brand-guardian-critic`; WALKTHROUGH.md Phase 2.5 pre-publish record | 2026-06-22 | active |
| L-02 | UTM all three params on EVERY link, including unsubscribe and privacy links — not just CTAs. | Early email draft had UTMs on the trial CTA but a bare unsubscribe URL; a links-without-utm sweep failed T1-05. | Authors treat "outbound link" as "the CTA"; compliance/footer links are outbound too. | T1-05 applies to every `http(s)` link in the file. Verifier's UTM sweep greps all links, not just the primary CTA. | measurement/plan.md T1-05; email/welcome.md | 2026-06-22 | active |
| L-03 | The email Liquid token `{{first_name}}` is the ONLY sanctioned `{{` in the campaign; everything else is a TODO stub. | Generic T1-01 placeholder check (`\{\{`) failed on the email's personalization token. | T1-01's `\{\{` pattern legitimately catches stub markers, but a real templating token also matches. | Run T1-01 on the email with the `{{first_name … }}` token excluded; assert no OTHER `{{`. Document the exception in the deliverable and measurement plan. | measurement/plan.md T1-01 note; email/welcome.md | 2026-06-22 | active |
