# Findings — UK gaming headset sourcing

Run date: 2026-08-04. Six agents: 5 finders + 1 heterogeneous verifier.

## Evidence status — read this before using any price

This run hit a hard environment limit. **All outbound HTTPS except WebSearch is
denied by the session's network policy** — the proxy answers `403` to `CONNECT` for
every retail and manufacturer host, including `wikipedia.org`. Verified by the lead
directly, not merely reported by agents. Per `/root/.ccr/README.md` a policy denial
is reported, not routed around, so no agent attempted a workaround.

| Field | Status |
|-------|--------|
| Model, form factor, acoustic design | **Reliable** — cross-corroborated, manufacturer-sourced |
| Mic mechanism | **Reliable** — verifier worked manufacturer spec sheets and fact-sheet PDFs |
| ANC vs PNI | **Proven** — see headline finding |
| Product URLs | **Real** — from the search index, not constructed |
| **Price** | **INDICATIVE — not observed on a loaded page** |
| **Stock / next-day** | **NOT VERIFIED** — page-state facts, unobservable |

**A second trap, caught independently by three agents:** WebSearch's *generated prose
summary* fabricates figures. R3 caught a "£67 EPOS H6Pro" appearing in no underlying
result; R5 caught a summary claiming CeX gives a "5-year warranty" when CeX cover is
24 months; R4 caught a £34.99 Cloud Alpha price that may belong to a different
product on the same store. Result titles and URLs are real index data; the prose
layer is not. Nothing here rests on a prose summary alone.

## Headline finding — "noise cancelling" cannot be met as ANC at this budget

**No gaming headset under £75 has active noise cancellation.** Not "few" — none,
and for fifteen of the models audited this is a *proof* rather than absent evidence:
they are passive analogue 3.5mm headsets with **no battery and no power source**.
ANC requires powered feedforward/feedback mics and a DSP. It is physically
impossible in an unpowered 3.5mm headset.

For the powered models in range (Arctis 7, Barracuda X, Stealth 500, Trust GXT 491),
ANC is absent by manufacturer omission and confirmed by reviewers.

The single best citation for settling this: **JBL's own documentation states ANC
exists on exactly two models in the entire Quantum line — the 800 and the ONE.**
Neither is the Quantum 100/200/300.

Where ANC actually starts:

| ANC model | Price |
|-----------|-------|
| Razer Barracuda Pro | ~$219 |
| EPOS H3PRO Hybrid | £239 RRP (discontinued) |
| Sony INZONE H9 | ~$279.99 |
| Turtle Beach Stealth Pro | ~$329, 47dB attenuation |
| SteelSeries Arctis Nova Pro Wireless | ~$349.99 |

**Roughly 3× the £75 ceiling.** The mechanism behind the confusion, confirmed: ANC
"uses built-in microphones to detect external noise and generate opposing sound
waves"; a noise-cancelling mic "reduce[s] background noise when you're speaking to
teammates, not the noise you hear."

### The one genuine exception worth watching
The **EPOS H3PRO Hybrid** has real ANC and is discontinued — SoundGuys notes it
"frequently goes on sale for around $50." If it surfaces under £75 in clearance,
that is a *true* ANC hit. Stock-dependent and not reliably sourceable, but it should
not be reflexively rejected.

### Two traps this finding exists to prevent
1. **Creative Zen Hybrid** — genuine hybrid ANC, genuinely over-ear, plausibly under
   £75. **Built-in call mic only, no boom.** Anyone shopping "ANC + over-ear + under
   £75" lands here and shouldn't.
2. **Turtle Beach Stealth 700 Gen 3** — markets "A.I. noise cancellation" hard. It is
   *mic-side* noise reduction. Not earcup ANC.

Razer's own UK page says the quiet part out loud: **"advanced passive noise
cancellation."** Same acoustic design as every rival, honest label.

## Peer disagreement — resolved against the finder that was wrong

R4 accepted the **Razer BlackShark V2 X** as "adjustable — bendable, repositionable
boom." R1 rejected it as having no mechanism at all. The verifier settled it against
Razer's own page and Tom's Hardware: the HyperClear mic is bendable, **cannot be
removed, and has no flip-to-mute — muting is a button on the earcup.** R1 was right;
the row is rejected.

This is the verifier earning its seat: a £59.99 row with a confirmed price and a
brand-store citation was still wrong on the criterion that actually mattered.

**Generational trap:** the **BlackShark V3 X reverses this** — its mic *is*
detachable. "BlackShark = fixed mic" is wrong on the current model. Check the
generation.

## Tier 1 — new, UK-dispatched

### 1a. Detachable / removable mic — the truest match

| # | Model | Mic | ~£ | Link |
|---|-------|-----|-----|------|
| 1 | **HyperX Cloud Alpha** | Detachable | 35–60 | uk.hyperx.com/products/hyperx-cloud-alpha |
| 2 | HyperX Cloud II | Detachable | 65–80 ⚠ | uk.hyperx.com/products/hyperx-cloud-ii |
| 3 | HyperX Cloud III | Detachable, 10mm unidirectional | 70–85 ⚠ | hyperx.com/products/hyperx-cloud-iii-wired-gaming-headset |
| 4 | SteelSeries Arctis 1 Wired | Detachable ClearCast | 40–50 | amazon.co.uk/dp/B07PS3Y5BY |
| 5 | Turtle Beach Recon 500 | Removable TruSpeak (2.5mm) | 69.99 RRP | amazon.co.uk/dp/B0935CNYPK |
| 6 | Roccat Elo X Stereo | Detachable | 30–40 | amazon.co.uk/dp/B08GR786SC |
| 7 | JBL Quantum 100M2 | Detachable | 29.99 | uk.jbl.com/QUANTUM100M2.html |
| 8 | JBL Quantum 100 | Detachable | 20–30 | amazon.co.uk/dp/B083X24CFF |
| 9 | Trust GXT 490 Fayzo 7.1 USB | Detachable — folds away or removes | 40–55 | trust.com/en/product/25302-gxt-490-fayzo-71-usb-gaming-headset |
| 10 | Razer Barracuda X (2022) | Detachable | check | razer.com/gb-en |
| 11 | Razer BlackShark V3 X | Detachable HyperClear cardioid | check | razer.com/gb-en |
| 12 | Koss GMR540A ISO | Detachable + mute switch | ~60 | amazon.co.uk/dp/B0CRWD78RQ |
| 13 | Trust GXT 414 Zamak | Detachable | 35–45 | amazon.co.uk/dp/B07V2DS3HS |
| 14 | Creative Sound BlasterX H6 | Detachable ClearComms | ~60 | uk.creative.com/p/gaming-headsets/sound-blasterx-h6 |

### 1b. Adjustable mic — flip-up / retractable / lift-to-mute

Not removable, but the boom stows or lifts out of the way.

| # | Model | Mic | ~£ | Link |
|---|-------|-----|-----|------|
| 15 | SteelSeries Arctis Nova 1 | Fully retractable into earcup | 49.99 | steelseries.com/en-gb/gaming-headsets/arctis-nova-1 |
| 16 | HyperX Cloud Stinger 2 | Swivel-to-mute | 44.04 | uk.hyperx.com/products/hyperx-cloud-stinger-2-wired-gaming-headset |
| 17 | Corsair HS55 Stereo | Flip-to-mute | ~49 | amazon.co.uk/dp/B0B1QJW8BR |
| 18 | Logitech G432 | Flip-to-mute | ~49 | currys.co.uk/products/logitech-g432-7.1-gaming-headset-black-and-blue-10191018.html |
| 19 | Logitech G335 | Flip-to-mute | 40–50 | currys.co.uk/products/logitech-g335-gaming-headset-black-10227173.html |
| 20 | Turtle Beach Recon 200 Gen 2 | Flip-up | 49.99 | uk.turtlebeach.com/products/recon-200-gen-2-headset |
| 21 | Turtle Beach Recon 70 | Flip-up | 22.99–29.99 | uk.turtlebeach.com/products/recon-70-headset |
| 22 | JBL Quantum 200 | Flip-up mute | 35–45 | amazon.co.uk/dp/B083X3G4Y1 |
| 23 | EPOS H3 | Lift-to-mute, "closed acoustic" | ~70 ⚠ EOL | eposaudio.com |

**Best evidence-backed isolation on the whole list: HyperX Cloud Alpha** —
"isolation between 200 and 1000Hz is uncommonly good for a gaming headset…
incredible for blocking outside sound." It also has a detachable mic. If the buyer
wants the *isolation outcome* rather than the ANC label, this is the honest pick.

**Closed-back is necessary but not sufficient.** RTINGS notes thin "breathable"
gaming earcups leak substantially; the Arctis Nova 1 specifically "doesn't do the
most impressive job of blocking outside noise."

**Only confirmed next-day evidence in the run:** JBL UK states next working day if
ordered by 3pm. Argos and Currys click & collect are the strongest practical
same-day route but could not be confirmed live.

## Tier 2 — used, refurbished, or non-UK dispatch

CeX is the best source: UK-based, graded, **24-month** warranty, in-store collection.

| Model | Relaxation | Mic | Link |
|-------|-----------|-----|------|
| HyperX Cloud Alpha (Grade A) | Used, UK | Detachable | uk.webuy.com/product-detail/?id=SACCHYPCLOALPA |
| HyperX Cloud Alpha (Grade C) | Used, UK, cosmetic wear | Detachable | uk.webuy.com/product-detail/?id=SACCHYPCLOALPC |
| HyperX Cloud Alpha S (Grade A) | Used, UK | Detachable | uk.webuy.com/product-detail/?id=740617289916A |
| HyperX Cloud Alpha Wireless (Grade A) | Used, UK | Detachable | uk.webuy.com/product-detail/?id=196188046036A |
| SteelSeries Arctis 7+ Lightfall (Grade B) | Used, UK | Retractable | uk.webuy.com/product-detail/?id=5707119052542B |
| Corsair HS65 Wireless | Open box, UK | Flip-to-mute | ebuyer.com/2277580-open-box-corsair-hs65-wireless-gaming-headset-carbon-ebr1-ca-9011285-eu2 |
| HyperX Cloud (ex-display) | Ex-display, 90-day warranty | Detachable | novatech.co.uk/products/hyperx-cloud-stinger-headset-for-pcxboxps4/hx-hscs-bkem.html |
| Razer BlackShark V2 / V2 Pro | Used | Detachable | CeX / eBay UK Refurbished |
| Logitech G Pro X | Used | Detachable Blue VO!CE | CeX / eBay UK Refurbished |
| Corsair Virtuoso RGB / SE | Used | Detachable omnidirectional | CeX / eBay UK Refurbished |
| Astro A40 | Used | Removable | CeX / eBay UK Refurbished |
| SteelSeries Arctis 7 / Nova 7 | Used | Retractable | CeX / eBay UK Refurbished |
| EPOS GSP 370 | Used | Flip-to-mute | CeX / eBay UK Refurbished |
| Corsair HS80 RGB | Used | Flip-up (not detachable) | CeX / eBay UK Refurbished |
| **EPOS H3PRO Hybrid** | Clearance/EOL | Detachable | **The only genuine ANC option that can fall under £75** |

CeX URL pattern: `uk.webuy.com/product-detail/?id=<SKU>`, grade as the trailing
character — useful for enumerating A/B/C variants of any model above.

## Rejected — and why

**Fixed mic (no detach, no flip):** Razer BlackShark V2 X (mute is a button) ·
Razer Kraken V3 X · Trust GXT 323 Carus · Trust GXT 488 Forze-B ·
**Sony WH-1000XM4 / Bose QC35 II** — the obvious "£300 ANC headphone for £70 used"
temptation, but fixed mic arrays.

**Open-back — no isolation, fails the noise requirement outright:**
**Turtle Beach Atlas Air** (detachable flip-to-mute mic, so it passes every mic
filter and is the row most likely to be shipped wrongly — but "you'll clearly hear
environmental noise") · Sony INZONE H6 Air · EPOS H6Pro Open · Sennheiser GAME ONE.

**Not over-ear:** JBL Tune 670NC and Live 670NC are on-ear despite ANC.
Corsair HS55 **Surround** (B09W9BLZ25) is unresolved — Amazon UK's own title says
"On Ear", reviews of the same chassis say circumaural. Needs a human eye.

**Over £75:** Corsair HS65 Surround (~£79, and the mic does not detach) · Razer
BlackShark V2 (~£85) · HyperX Cloud Stinger 2 full version (~£78.50 — take the Core)
· all wireless HS55/HS65 variants · Arctis 1 Wireless (also out of stock).

**EOL / clearance-only risk:** Arctis 1, Arctis 5, Arctis 7, Cloud Stinger Core,
GSP 300, and the entire EPOS gaming line — EPOS has wound down its gaming portfolio.

## What would close the gap

Egress allowlisting for the retail hosts (`amazon.co.uk`, `argos.co.uk`,
`currys.co.uk`, `johnlewis.com`, `ao.com`, `scan.co.uk`, `overclockers.co.uk`,
`box.co.uk`, `ebuyer.com`, `cclonline.com`, `novatech.co.uk`, `game.co.uk`,
`very.co.uk`, `uk.webuy.com`) and the manufacturer hosts. Every URL is already
identified, so a re-run is fetch-and-read, not re-research — one pass converts every
indicative price into an observed one.

Correct UK store domains for a re-run (search kept returning US pages):
`uk.hyperx.com` (not hyperx.com/en-gb) · `uk.turtlebeach.com` · `uk.roccat.com` ·
`uk.jbl.com` · `corsair.com/uk/en/p/…` with `-eu` SKUs.
