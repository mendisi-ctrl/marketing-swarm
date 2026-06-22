# Eval — two-tier acceptance-criterion routing

Worked scenarios that **specify the two-tier done-when by example**: for a given
acceptance criterion, is it **Tier-1** (machine-checkable — attaches a command from
the `BRAND-AND-COMPLIANCE.md` catalogue + expected output, run by the lead) or
**Tier-2** (checklist-gated — a named reviewer persona signs off with cited
evidence)? There is no runtime; a human or read-only agent reads each `GIVEN` and
confirms `SKILL.md` Phase 2 + the catalogue produce the `EXPECT`ed tier and routing.

A scenario **passes** when the tier + the attached check/persona match `EXPECT`. The
governing rule (SKILL.md): *push every grep-able sub-criterion DOWN to Tier-1 so the
Tier-2 reviewer only judges the genuinely subjective remainder.*

---

## A1 — SEO keyword presence → Tier-1

- **GIVEN** acceptance criterion: *"the blog post targets the keyword 'product
  analytics' at least 3 times."*
- **EXPECT** **Tier-1**, catalogue `T1-02`: attach
  `test "$(grep -ico 'product analytics' post.md)" -ge 3` → exit 0. No reviewer
  needed; the lead runs it and reads the exit code.

## A2 — holistic brand voice → Tier-2

- **GIVEN** acceptance criterion: *"the copy sounds confident-not-hype and on-brand."*
- **EXPECT** **Tier-2**, checklist `V-06`/`V-05`, signed off by the **Brand Guardian**
  with cited lines. Not machine-checkable — it is a judgement. (But the *banned-words*
  portion of "not hype" splits off to Tier-1, see A3.)

## A3 — banned words → Tier-1 (split off from A2)

- **GIVEN** the banned-words/jargon portion of the voice check (`synergy`,
  `revolutionary`, `game-changer`, …).
- **EXPECT** **Tier-1**, catalogue `T1-08`:
  `! grep -rIniwE 'synergy|revolutionary|game-?changer|world-class|cutting-edge|disrupt|best-in-class' "$F"`.
  This is the rule in action: the mechanical slice of a Tier-2 checklist (`V-03`) is
  pushed down to Tier-1 so the reviewer judges only the subjective remainder.

## A4 — claim citation vs claim truth → split across tiers

- **GIVEN** acceptance criterion: *"every performance claim is substantiated."*
- **EXPECT** a **split**: citation *presence* is **Tier-1** (`T1-07` — each claim line
  carries a `[^src:…]` marker, plus a row exists in `claims-substantiation.md`); whether
  the cited source *actually supports* the claim is **Tier-2**, signed off by the
  **Legal/Compliance Reviewer** (`C-CLAIMS`). Presence is scriptable; support is
  judgement.

## A5 — email CAN-SPAM essentials → Tier-1

- **GIVEN** acceptance criterion: *"the launch email is CAN-SPAM compliant."*
- **EXPECT** the mechanical essentials are **Tier-1** (`T1-10` — `grep -qi 'unsubscribe'`
  AND a physical-address match); the holistic "compliant" judgement (truthful subject,
  accurate from-name, consent basis) is **Tier-2** (`C-CANSPAM`, Legal seat). Most of
  this criterion is machine-checkable — push it to Tier-1.

## A6 — UTM tracking on outbound links → Tier-1

- **GIVEN** acceptance criterion: *"every outbound link is tracked."*
- **EXPECT** **Tier-1**, catalogue `T1-05`: assert every `http` link carries
  `utm_source`, `utm_medium`, `utm_campaign`. The single cheapest high-value gate and
  the most common real-world campaign defect — never leave it to a reviewer's eye.

## A7 — asset spec conformance → Tier-1

- **GIVEN** acceptance criterion: *"the LinkedIn image meets channel spec."*
- **EXPECT** **Tier-1**, catalogue `T1-14`: `identify -format '%wx%h' asset.png` equals
  `1200x627` (the channel spec-table value). Deterministic; no reviewer.

## A8 — on-strategy / persona resonance → Tier-2 (do not oversell measurability)

- **GIVEN** acceptance criterion: *"this campaign will move free-trial signups for the
  target persona."*
- **EXPECT** **Tier-2**, signed off by the **Marketing-Ops / Measurability Lead**
  against the measurement plan (named metric + baseline must already exist in the
  brief, per SKILL.md). Resonance and "will it move the metric" are judgements
  pre-launch — be honest that this is gated, not green. The *tracking that lets you
  measure it later* is Tier-1 (A6); the prediction is Tier-2.
