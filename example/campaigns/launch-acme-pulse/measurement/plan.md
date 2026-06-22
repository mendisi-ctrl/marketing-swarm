# Measurement & acceptance plan — Acme Pulse launch

> Authored by the **Marketing Analytics & Ops lead** (the heterogeneous verifier),
> drafted in the same wave as the builders so verification is ready the moment copy
> lands. Fictional demo. These are the **Tier-1 acceptance commands** the CMO runs
> itself to gate each deliverable — never an agent's "it passed" string.

## Success metric + baseline (must match brief.md and board.md)

- **Primary: free-trial signups. Baseline 400/mo → target +25% (to 500/mo) within 60
  days of launch.**
- Secondary guardrail (read-only): trial-to-paid conversion holds ≥ 18%, the launch's
  established baseline.[^src:trial-conversion]

### How it is measured

- **Signups** = count of completed trial-workspace creations on
  `acme-analytics.example/trial`, attributed by the UTM schema below, read from the
  analytics warehouse daily.
- **Attribution** = last-touch on `utm_campaign=acme-pulse-launch`, broken out by
  `utm_source`. A weekly read against baseline; no automated spend, no live writes.
- **Guardrail** = trial-to-paid for the launch cohort, reported at day 30 and day 60.

## UTM schema (the T1-05 contract)

Every outbound link in every deliverable MUST carry all three parameters:

| param | value | notes |
|---|---|---|
| `utm_source` | `blog` \| `linkedin` \| `x` \| `email` \| `landing` | the channel the click came from |
| `utm_medium` | `referral` (blog) \| `social` \| `email` \| `web` (landing) | the medium class |
| `utm_campaign` | `acme-pulse-launch` | fixed for the whole campaign |

A link missing any of the three fails T1-05 and the deliverable does not integrate.

## Tier-1 acceptance commands (run per deliverable; `$F` = the file)

Each cites its catalogue ID from `BRAND-AND-COMPLIANCE.md`. Exit 0 = pass.

- **T1-01 — no placeholder/TODO** (all deliverables):
  `! grep -rInE 'TODO|TKTK|FIXME|XXX|Lorem ipsum|\[placeholder\]|\{\{' "$F"`
  *(Note: the email template's `{{first_name}}` Liquid token is the one sanctioned
  exception — see the email's T1-01 note; run the check excluding that token.)*
- **T1-02 — SEO keyword ≥3** (blog/post.md only):
  `test "$(grep -ico 'product analytics dashboard' "$F")" -ge 3`
- **T1-03 — structure** (blog, landing): `grep -qE '^# ' "$F" && grep -qE '^## ' "$F"`
- **T1-04 — word-count band 800–1000** (blog/post.md):
  `wc -w < "$F" | awk '{exit !($1>=800 && $1<=1000)}'`
- **T1-05 — UTM on every outbound link** (blog, social, email, landing): for each
  `http` link in `$F`, assert it contains `utm_source=`, `utm_medium=`, and
  `utm_campaign=`. Fail if any link lacks one.
- **T1-06 — link integrity** (all with links): `lychee --no-progress "$F"` exits 0.
  Pre-req: `command -v lychee || command -v markdown-link-check`. *(Demo links use the
  reserved `.example` domain, so an offline run is recorded as a known-non-resolving
  fixture rather than a hard fail.)*
- **T1-07 — citation marker per claim** (all): every numeric/factual claim line ends
  with a `[^src:…]` marker; grep claim lines and assert the marker is present.
- **T1-08 — banned words absent** (all):
  `! grep -rIniwE 'synergy|revolutionary|game-?changer|world-class|cutting-edge|disrupt|best-in-class' "$F"`
- **T1-10 — unsubscribe + physical address** (email/welcome.md):
  `grep -qi 'unsubscribe' "$F" && grep -qiE 'address|[0-9]{3}.*(st|ave|rd|blvd|way)' "$F"`
- **T1-11 — alt text on every image** (blog, landing): `! grep -nE '!\[\][(]' "$F"`
- **T1-12 — trademark on first brand mention** (blog, messaging):
  `grep -q 'Acme Pulse™' "$F"` (per the fictional brand guide).

## Tier-2 (reviewer sign-off, not machine-checkable)

- **C-CLAIMS** — Legal/Compliance confirms each `[^src:…]` source *supports* its
  claim (judgement), against `claims-substantiation.md`.
- **V-05/V-06/V-07** — Brand Guardian confirms voice, register, and consistency with
  the message house.
- **C-GDPR** — landing form consent line + privacy link reviewed.

---

[^src:trial-conversion]: Acme Analytics trial cohort report, May 2026, p.1 (fictional). 18% trial-to-paid conversion.
