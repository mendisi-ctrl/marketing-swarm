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
| R1 | complete — blocked on egress, returned 15 pre-screened candidates |
| R2 | complete — blocked on egress, returned 14 candidates, 0 verified |
| R3 | complete — blocked on egress, returned 12 candidates, 0 verified |
| R4 | complete — confirmed zero sub-GBP75 ANC across 12 brands |
| R5 | complete — blocked on egress, returned Tier-2 spec screen |
| V1 | complete — overruled R4 on BlackShark V2 X mic |

## Wave 2 — Bluetooth requirement added

C0 (Bluetooth wireless) added mid-run. V1 and R4 resumed from transcript rather
than relaunched, so they carry wave-1 context; R6/R7/R8 are fresh finders.

| Agent | Seat | Owns (sources) | Status |
|-------|------|----------------|--------|
| V1 | Analytics & Ops (verifier) | Manufacturer specs — re-deriving the ANC answer under battery power, plus the 2.4GHz-vs-BT split | resumed |
| R4 | Product marketing | Brand-direct UK stores + Edifier HECATE (newly assigned) | resumed |
| R6 | Competitive analyst | Amazon UK, Argos, Currys, John Lewis, AO | launched |
| R7 | Competitive analyst | GAME, Very, Box, Scan, Overclockers, Ebuyer, CCL, Novatech, AWD-IT, Laptops Direct | launched |
| R8 | Competitive analyst | Used/refurb/open-box + non-UK dispatch | launched |

Disjointness holds: R6/R7/R8 partition retail with no overlap, R4 is brand-direct
only, V1 works manufacturer specs and touches no retail page.

## Wave 2 additions to the definition-of-done
7. Every row states **connectivity explicitly** — Bluetooth, 2.4GHz dongle, or both
   — sourced from a spec table, not a marketing bullet. Dongle-only fails C0.
8. A built-in beamforming mic with no boom fails C3, however good the ANC is.
9. Where known, note whether the BT link degrades to HFP/HSP when the boom mic is
   live (the telephone-quality-audio penalty).
