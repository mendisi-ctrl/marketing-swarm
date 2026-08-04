# Findings — wave 2, Bluetooth required

Run date: 2026-08-04. Five agents: V1 + R4 resumed from wave 1, R6/R7/R8 fresh.

Supersedes `FINDINGS.md`. **The Bluetooth gate voided every row in that document** —
all 23 wired models are out.

## The headline: any two of three, never all three

**Under £75 you can have any two of {Bluetooth, ANC, boom mic}. Never all three.**
Reached independently by three agents from different corpora.

Wave 1 concluded ANC was impossible under £75 because the qualifying headsets are
unpowered 3.5mm devices. Bluetooth headsets have batteries, so that argument dies —
and the verifier was re-tasked to re-derive rather than filter. **The answer landed
in the same place for a different and more durable reason: category segmentation.**

| Family | ANC | Boom mic | Sub-£75 BT | Verdict |
|--------|-----|----------|------------|---------|
| Gaming BT headsets — Corsair HS55, TB Stealth 500, Barracuda X, Trust Fayzo/Ravox | Never at this price | Yes | Yes | **Fails the noise requirement** |
| Lifestyle BT ANC over-ears — Sony WH-CH720N, Soundcore Q30/Space Q45, JBL Tune 770NC, Edifier W820NB, 1More SonoFlow, OneOdio Focus A6 | Real ANC | **None** | Yes | **Fails the mic requirement** |

Booms live on gaming SKUs, which don't get ANC at this price. ANC lives on lifestyle
SKUs, which don't get booms. **Bluetooth is present on both shelves and bridges
neither.** Independent confirmation: *"There's essentially no Bluetooth gaming
headset with both ANC and a boom mic available under $100."*

Where all three genuinely coexist — all far above budget: Razer BlackShark V3 Pro ·
SteelSeries Arctis Nova Elite · JBL Quantum 810/910 · Corsair Virtuoso Max ·
HyperX Cloud MIX 2 · AceZone A-Rise · EPOS Impact 1061 ANC · Logitech Zone 2.

**The category nobody would think to search:** enterprise UC headsets — Jabra
Evolve2 55/75/85, Poly — where BT + ANC + boom is a *solved, standard product*. Not
gaming-branded, which is why no retail sweep surfaces it. £150+.

## The protocol finding — lead with this

This is more important than any price, and no budget fixes it.

- **A2DP** — full stereo, **no microphone capability at all**
- **HFP/HSP** — mic works, but *"you don't get stereo with HFP, just mono audio
  played back in both ears"*, at ~32kHz voice grade

**On a pure Bluetooth link, the moment the boom mic opens, game audio collapses to
mono telephone quality.** Not a defect — it is how classic Bluetooth works.

Dual-mode headsets dodge it only by *not using Bluetooth for chat*: the mic runs
over the 2.4GHz dongle at full quality, Bluetooth carries a second device.

| Model | Simultaneous BT + dongle? |
|-------|---------------------------|
| SteelSeries Arctis 7X | **Yes** — mix BT audio/calls while gaming on 2.4GHz |
| Corsair HS55 Wireless | **Yes** — two devices, 2.4GHz + BT 5.2 |
| Trust GXT 491 Fayzo | **Yes** — simultaneous |
| Turtle Beach Stealth 600 Gen 3 | **No** — switch only |
| SteelSeries Arctis Nova 5 | **No** — quick-switch only |

**The definitional fork this creates for the buyer:**
- If "Bluetooth" means *the chat path is Bluetooth* — the boom mic degrades audio on
  every model that exists, and the spec is close to self-defeating.
- If "Bluetooth" means *the headset supports Bluetooth* (phone, Switch) while chat
  runs on the dongle — the dual-mode gaming headsets work well, but a dongle is
  required, which may be the thing the buyer wanted to avoid.

Only **one** candidate in the entire run is Bluetooth-native with no dongle at all:
the Edifier HECATE G5BT.

*Unverified avenue, flagged not asserted:* **Bluetooth LE Audio / LC3** is the
standard designed to remove the A2DP↔HFP trade-off. No model here was verified as
supporting it. It is the right question to ask a manufacturer, and it is how this
spec eventually becomes satisfiable.

## Traps — five of them, each one costs a wrong purchase

1. **Razer Barracuda X has two generations, externally identical, adjacent SKUs.**
   2021 = `RZ04-03800xxx`, 2.4GHz + 3.5mm, **no Bluetooth**. 2022 = `RZ04-04430xxx`,
   **Bluetooth 5.2**. Every cheap listing — a £49.95 aggregator entry, Ebuyer's
   "Barracuda X 7.1" SKUs — is the 2021 model. **Check the SKU, not the name.**
2. **Barracuda X ≠ Barracuda.** The plain Razer Barracuda (2022) has integrated
   beamforming mics and **no boom at all**. The verifier caught itself conflating
   these mid-run and corrected rather than averaging the sources.
3. **The ENC trap** — budget BT headsets advertise "ENC" (Environmental Noise
   Cancellation). Still **mic-side only**. Edifier HECATE G2BT/G5BT, EKSA E900 BT.
   Edifier's G33 goes further and writes *"the detachable mic stem features ANC
   effect"* — the literal string "ANC" applied to a microphone.
4. **Dongle-only models sold as "wireless"** — SteelSeries Arctis Nova 4, Sony
   INZONE H5, HyperX Cloud Stinger 2 Wireless, Cloud Alpha Wireless, Logitech G733,
   Astro A50, JBL Quantum 610, Razer Kraken V3 Pro. **HyperX is out of this brief
   entirely** — it puts Bluetooth only on models above budget.
5. **Boom-less Bluetooth** — Logitech G435 ("built-in dual beamforming mics that
   drop the mic arm") and Edifier HECATE G2BT ("built-in dual MIC noise
   cancellation"). Both pass the Bluetooth test and look like bullseyes.

## Unresolved peer disagreement — Edifier HECATE G5BT

R4 and R6 report a **retractable** boom mic. V1 reports **no boom, dual built-in
mics**. R7 rejected the *G2BT* sibling as boom-less without ruling on the G5BT.

Two finders against the designated verifier, and it cannot be settled without
loading the page. The likely explanation is contamination between the G2BT (boom-less
by unanimous agreement) and the G5BT. **This matters more than a normal tie** — the
G5BT is the only Bluetooth-native, no-dongle candidate in the run, so if it has a
boom it is the single best answer to a strict reading of the spec. Recorded as
unresolved rather than voted on.

## Tier 1 — new, UK, Bluetooth confirmed

Every row is **PNI**, not ANC — see the headline finding. Prices are indicative.

### Detachable mic

| # | Model | BT | ~£ | Link |
|---|-------|-----|-----|------|
| 1 | **Razer Barracuda X (2022)** ★ | BT 5.2 + 2.4GHz SmartSwitch | **74.99** (real index price) | [Ebuyer](https://www.ebuyer.com/1424572-razer-barracuda-x-2022-wireless-multi-platform-gaming-and-mobile-headset-black-rz04-04430100-r3m1) · [Box](https://box.co.uk/rz04-04430300-r3m1-razer-barracuda-x-wireless) · [Currys](https://www.currys.co.uk/products/razer-barracuda-x-wireless-gaming-headset-black-10238919.html) |
| 2 | **Trust GXT 491 Fayzo** ★ | BT + 2.4GHz, **simultaneous** | unverified | [Amazon](https://www.amazon.co.uk/Trust-Gaming-Connection-Headphones-Microphone/dp/B0CVBC9ZLS) · [Argos (white)](https://www.argos.co.uk/product/4335324) |
| 3 | **Trust GXT 1493 Ravox** | BT + 2.4GHz dual | **28.48** deal-evidenced | [Amazon](https://www.amazon.co.uk/Trust-Gaming-Bluetooth-Headphones-Microphone/dp/B0DQYGRYQY) |
| 4 | JBL Quantum 360P | 2.4GHz + BT **simultaneous** | unverified | [uk.jbl.com](https://uk.jbl.com/QUANTUM360PWIRELESS.html) |
| 5 | Razer BlackShark V3 X HyperSpeed | BT + 2.4GHz | likely >75 | [Amazon](https://www.amazon.co.uk/Razer-BlackShark-HyperSpeed-sports-lightweight-Black/dp/B0F93SY4BH) |
| 6 | SteelSeries Arctis Nova 3P | BT + 2.4GHz | likely >75 | [Amazon](https://www.amazon.co.uk/SteelSeries-Arctis-Wireless-PlayStation-Headset/dp/B0F5GRCTLT) |
| 7 | WolfLawS Wireless ⚠ marketplace brand | BT, dongle role unconfirmed | unverified | [Amazon](https://www.amazon.co.uk/WolfLawS-Bluetooth-Headphones-Detachable-Microphone-White/dp/B0D12MW224) |

### Adjustable mic — flip-to-mute / retractable

| # | Model | BT | ~£ | Link |
|---|-------|-----|-----|------|
| 8 | **Corsair HS55 Wireless** | BT 5.2 + 2.4GHz, **simultaneous** | **39.99** deal / 69.99 sale / 99.99 list | [Currys](https://www.currys.co.uk/products/corsair-hs55-wireless-7.1-gaming-headset-carbon-10249209.html) · [Scan](https://www.scan.co.uk/products/corsair-hs55-headset-carbon-dolby-71-surround-50mm-neodymium-drivers-wireless-24ghz-rf-bt-pc-mac) |
| 9 | **Turtle Beach Stealth 500** (PC/PS SKU) | BT 5.2 + 2.4GHz | **55.99** / 79.99 list | [Argos](https://www.argos.co.uk/product/4840345) · [Currys](https://www.currys.co.uk/products/turtle-beach-stealth-500-wireless-gaming-headset-black-10264931.html) |
| 10 | Corsair HS55 Wireless Core | BT 5.2 + 2.4GHz | **75.05** ⚠ 5p over | [idealo](https://www.idealo.co.uk/compare/202152266/corsair-hs55-wireless-core.html) |
| 11 | Corsair HS65 Wireless | BT + 2.4GHz | ~119 list, discounts | [Scan](https://www.scan.co.uk/products/corsair-hs65-headset-carbon-dolby-71-surround-50mm-neodymium-drivers-wireless-24ghz-rf-bt) · [Very](https://www.very.co.uk/corsair-hs65-wirelessnbspgaming-headset-nbspcarbon/1600950578.prd) |
| 12 | **Edifier HECATE G5BT** ⚠ mic disputed | **BT-native, no dongle** | unverified | [Amazon](https://www.amazon.co.uk/Edifier-HECATE-G5BT-headphones-grey/dp/B0BL1F4R16) |
| 13 | SteelSeries Arctis Nova 5 | BT 5.3 + 2.4GHz, switch only | ~130 | [SteelSeries](https://steelseries.com/gaming-headsets/arctis-nova-5) |

**Price/list conflicts worth noting:** Corsair HS55 Wireless was reported at £39.99
(deal post), £69.99 (brand sale) and £99.99 (Corsair UK list) by three different
agents. Stealth 500 at £55.99 and £79.99. These are sale-vs-list spreads, not
contradictions — but they mean the £75 line is a timing question, not a fixed fact.
The **Stealth 500 Xbox SKU sits at £79.99 and breaches budget — buy the PC/PS SKU.**

## Tier 2 — used / refurbished. **This is where the brief becomes answerable.**

New, the spec is close to unsatisfiable. Used, **three separate headsets with genuine
earcup ANC + Bluetooth + a proper boom mic + over-ear cups are sitting on CeX UK
simultaneously.** All UK-dispatched, graded, 24-month cover, store collection.

### The three that pass everything — real ANC included

| # | Model | Connectivity | Mic | Noise | Est. £ | Link |
|---|-------|--------------|-----|-------|--------|------|
| 1 | **EPOS H3PRO Hybrid** ★ | BT + 2.4GHz dual | **Detachable, magnetic quick-connect** | **True ANC** | 55–85 | [CeX Gr.A](https://uk.webuy.com/product-detail/?id=5714708006930A) · [Gr.B](https://uk.webuy.com/product-detail/?id=5714708006930B) |
| 2 | **JBL Quantum 810** | BT 5.2 + 2.4GHz | Flip-up boom | **True ANC** | 60–90 | [CeX Gr.A](https://uk.webuy.com/product-detail/?id=050036389679A) · [Gr.B](https://uk.webuy.com/product-detail/?id=050036389679B) |
| 3 | **Sony INZONE H9** | BT + 2.4GHz **simultaneous** | Retractable boom | **True ANC** | 70–100 ⚠ | [CeX Gr.B](https://uk.webuy.com/product-detail/?id=4548736133365B) |

The H3PRO Hybrid is the standout: £279 MSRP, discontinued so this is the price floor,
and it passes every constraint with the *best* variant of each — real ANC, a
genuinely detachable boom, dual-mode Bluetooth. EPOS quotes separate battery figures
with ANC on (19h dongle / 22h BT), which only makes sense for real cancellation.

### PNI fallbacks — deeper stock, more likely to actually be buyable

| # | Model | Connectivity | Mic | Est. £ | Link |
|---|-------|--------------|-----|--------|------|
| 4 | SteelSeries Arctis Nova 7 / 7P / 7X / Gen 2 | BT + 2.4GHz **simultaneous** | Retractable ClearCast | 45–75 | [Nova 7 Gr.A](https://uk.webuy.com/product-detail/?id=5707119041294A) · [Gr.B](https://uk.webuy.com/product-detail/?id=5707119041294B) · [Gen 2 Gr.A](https://uk.webuy.com/product-detail/?id=5707119065597A) · [7P Gr.A](https://uk.webuy.com/product-detail/?id=5707119041317A) · [7X Gr.B](https://uk.webuy.com/product-detail/?id=810052986739B) |
| 5 | Razer Barracuda X **2022** | BT + 2.4GHz SmartSwitch | **Detachable** | 35–60 | [CeX Black Gr.B](https://uk.webuy.com/product-detail/?id=8886419379850B) · [Quartz Gr.A](https://uk.webuy.com/product-detail/?id=8886419379898A) |
| 6 | Turtle Beach Stealth 700 Gen 2 / MAX / Gen 3 | BT + 2.4GHz | Flip-to-mute | 40–70 | [Gen2 MAX Gr.B](https://uk.webuy.com/product-detail/?id=731855037919B) · [Gen2 Xbox](https://uk.webuy.com/product-detail/?id=0731855027804) · [Gen3](https://uk.webuy.com/product-detail/?id=731855021055) |
| 7 | Xbox Wireless Headset 2021 / 2024 | **BT** + Xbox Wireless | Bendable boom, flips to mute | 30–50 | [2021](https://uk.webuy.com/product-detail/?id=889842615326) · [2024 (BT 5.3)](https://uk.webuy.com/product-detail/?id=0196388135868) |
| 8 | EPOS H3 Hybrid ⚠ see below | BT + dongle | Detachable lift-to-mute | — | [CeX](https://uk.webuy.com/product-detail/?id=5714708006923B) |
| 9 | Razer Barracuda X 2022 — refurb, 12mo warranty | BT + 2.4GHz | **Detachable** | — | [Back Market UK](https://www.backmarket.co.uk/en-gb/l/wireless-gaming-headset/def14d38-094d-44ee-aac8-eca1c4eefef8) |
| 10 | Corsair HS55 Wireless Core — refurb | BT + 2.4GHz Slipstream | Flip-to-mute | — | [Back Market UK](https://www.backmarket.co.uk/en-gb/l/corsair-headset/c1817fa1-a34f-4a8f-bc22-a23935c7b3f5) |
| 11 | EPOS H3PRO Hybrid — marketplace | BT + 2.4GHz | **Detachable** | — | [eBay UK](https://www.ebay.co.uk/itm/225679057976) |
| 12 | SteelSeries Arctis Nova 7 — marketplace | BT + 2.4GHz | Retractable | — | [eBay UK](https://www.ebay.co.uk/shop/arctis-nova-7-wireless?_nkw=arctis+nova+7+wireless) |

⚠ **EPOS H3 Hybrid title trap:** CeX titles SKU `5714708006923B` as *"H3 Hybrid **Wired**"*.
The H3 **Hybrid** is BT + dongle; the plain **H3** (`840064406895A/B`) is **wired-only
and fails**. Confirm on-page which one is in the box.

**Search pages — single SKUs sell out:**
[CeX PC headsets](https://uk.webuy.com/search/?categoryIds=1083&categoryName=pc-headsets) ·
[Back Market wireless gaming](https://www.backmarket.co.uk/en-gb/l/wireless-gaming-headset/def14d38-094d-44ee-aac8-eca1c4eefef8)

### Sources that yielded nothing, checked and reported honestly
**Music Magpie** — catalogue is Sony XM4 / Beats, all boom-less. **GAME pre-owned** —
programme covers games and consoles only. **Currys refurb** — consumer headphones, no
boom mics. **Amazon Renewed** — every result the index returned was amazon**.com**,
not .co.uk; sourcing from there makes it a shipped-from-abroad row with US-plug
dongles and customs exposure. **No case was found where going abroad beat a CeX row**
on price or spec, so the non-UK relaxation was not worth taking.

## Corrections to this brief's own hunt-list

Two models the lead named as Tier 2 targets are spec misses, caught by the finder:
- **Corsair Virtuoso RGB Wireless SE has no Bluetooth** — it is Slipstream 2.4GHz +
  USB + 3.5mm. Only the **XT** added BT. On CeX as `843591019200C` — a trap.
- **Razer Barracuda Pro fails the mic requirement** — hybrid ANC and BT, but
  integrated beamforming mics, no boom.
Also **Corsair HS80 RGB Wireless** is Slipstream-only (only **HS80 MAX** has BT), and
**SteelSeries Arctis 7P+** is dongle-only.

## Rejected

**Dongle-only, no Bluetooth:** Razer Barracuda X **2021** · SteelSeries Arctis Nova 4
· Sony INZONE H5 · HyperX Cloud Stinger 2 Wireless · HyperX Cloud Alpha Wireless ·
Logitech G733 · Astro A50 · SteelSeries Arctis 1 Wireless · JBL Quantum 610 · Razer
Kraken V3 Pro · Roccat Elo 7.1 Air · Asus ROG Pelta (unresolved, treat as reject).

**Bluetooth fine, no boom mic:** Logitech G435 · Razer Barracuda (2022) · Edifier
HECATE G2BT · Creative Zen Hybrid family.

**Real ANC, right price, no boom — the biggest trap class:** Sony WH-CH720N · Anker
Soundcore Life Q30 / Space Q45 / Space One / Q20i · JBL Tune 770NC · Edifier W820NB ·
1More SonoFlow · Earfun Wave Pro · JLab JBuds Lux ANC · SoundPEATS Space Pro ·
**OneOdio Focus A6** ($69.99, hybrid ANC −48dB, BT 6.0, LDAC — the strongest verified
budget ANC option, and it has no boom).

**Not over-ear:** Edifier HECATE GX05/GX07 (earbuds, despite real −38dB hybrid ANC) ·
Logitech Zone 300 (on-ear) · JBL Tune/Live 670NC (on-ear).

**Over £75 with the full spec:** JBL Quantum 810/910 · Razer BlackShark V3 Pro ·
Corsair Virtuoso Max · EPOS H3 Hybrid (£149–160, detachable lift-to-mute + closed
acoustic + BT — textbook pass on everything but price) · Turtle Beach Stealth 600
Gen 3 (£99) · Sony INZONE H9 · Jabra Evolve2 line.

## Evidence status

Unchanged from wave 1 and worth restating: **all outbound HTTPS except WebSearch is
blocked at the proxy.** No agent loaded a single retailer page. Connectivity, mic
mechanism and the ANC finding are well-sourced from spec sheets and reviews; **prices
and stock are not verified**.

The prose layer got worse under scrutiny this wave. Documented fabrications:
- Four Ebuyer prices in one summary, none present in any title or URL — and the same
  summary then contradicted itself on whether the Razer was over £75.
- £139.99 and £49.95 returned for the *same* Barracuda X in consecutive searches.
- A stale "delivery Thursday 13th June" date presented as current.

Agents were instructed to accept a price only where it appeared literally in an
indexed title or URL slug. Those are marked "real index price" above; everything
else is a lead. Scan's URL slugs turned out to be unusually good evidence — they
encode connectivity directly (`…wireless-24ghz-rf-bt`, `…-anc-`), which is how the
Corsair dual-mode and JBL 810/910 ANC claims were settled without loading a page.
