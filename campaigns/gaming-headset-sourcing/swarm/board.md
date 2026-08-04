# Team board — UK gaming headset sourcing

Lead-owned (CMO session). Agents read, never write.

## Ownership map (validated disjoint — no two agents share a source)

| Agent | Seat | Owns (sources) | Deliverable |
|-------|------|----------------|-------------|
| R1 | Competitive analyst | Amazon UK only | `findings/r1-amazon.md` |
| R2 | Competitive analyst | Argos, Currys, John Lewis, AO.com | `findings/r2-highstreet.md` |
| R3 | Competitive analyst | GAME, Very, Box.co.uk, Scan, Overclockers, Ebuyer, CCL, Novatech | `findings/r3-specialist.md` |
| R4 | Product marketing | Brand-direct UK stores (SteelSeries, HyperX, Turtle Beach, Corsair, Razer, Logitech G, EPOS, Trust, Creative, JBL, Roccat, Astro) | `findings/r4-brand-direct.md` |
| R5 | Competitive analyst | Used/refurb/open-box + non-UK dispatch (CeX, Amazon Renewed/Warehouse, eBay Refurbished, Back Market, GAME pre-owned, clearance) | `findings/r5-tier2.md` |
| V1 | Analytics & Ops (heterogeneous verifier) | Manufacturer spec sheets only — no retailer pages | `findings/v1-spec-verification.md` |

Disjointness: R1–R5 partition the retail surface with no overlap. V1 works a
different corpus entirely (manufacturer specs), which is what makes it a
heterogeneous verifier rather than a sixth finder.

## Shared definition-of-done (every agent, same target)
1. Every row carries a **live product URL** on the source the agent owns.
2. Every row states **price in GBP + date observed**.
3. Every row tags the mic as `detachable` / `flip-up` / `retractable` / `adjustable-boom` / `fixed`.
   `fixed` rows are rejected.
4. Every row tags noise handling as **ANC** or **PNI** — never the bare phrase
   "noise cancelling". ANC claims require a manufacturer-source citation.
5. Every row states **dispatch origin** and whether next-day/click & collect is offered.
6. No claim is carried from retailer marketing copy without the spec-sheet re-check (V1's job).

## Status
| Agent | Status |
|-------|--------|
| R1 | launched |
| R2 | launched |
| R3 | launched |
| R4 | launched |
| R5 | launched |
| V1 | launched |
