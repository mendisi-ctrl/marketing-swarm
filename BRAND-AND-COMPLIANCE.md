# Brand & compliance reference (the externalized checklists + Tier-1 catalogue)

Reference for the `marketing-swarm` skill's Phase 0 check and its two-tier
done-when. These are the shared checklists every reviewer persona gates against and
the runnable commands the verifier (Analytics & Ops lead) runs. **Each item carries
a one-line check — run the check before relying on the note, and trust the check
over the note.** If a load-bearing capability is missing (no brand guide, no source
docs to substantiate a claim, no link-checker installed), say so and adapt the plan
before launching agents.

Done-whens cite an ID from this file (e.g. `T1-04`, `C-GDPR`, `V-03`) rather than
re-inventing commands or criteria.

## Contents
- Tier-1 command catalogue (machine-checkable; the verifier runs these)
- Voice & tone checklist (Tier-2; Brand Guardian gates)
- Compliance checklist (Tier-2 + grep-able subset; Legal/Compliance gates)
- Channel asset-spec table (mixed; specs are machine-checkable)
- Visual brand lock + image-gen tooling (Gemini; the imagery analogue of the message house)
- Claims-substantiation requirement (the artifact the Legal gate consumes)

---

## Tier-1 command catalogue (machine-checkable)

Run from the deliverable's directory. `$F` is the deliverable file. These produce an
exit code + output the lead reads directly — never an agent's "it passed" string.

- **T1-01 — no placeholder / TODO text.** Deliverable is finished, no stubs.
  Check: `! grep -rInE 'TODO|TKTK|FIXME|XXX|Lorem ipsum|\[placeholder\]|\{\{' "$F"`
  (exit 0 = clean; a match means not done).
- **T1-02 — SEO keyword present.** The target keyword appears at least N times.
  Check: `test "$(grep -ico 'TARGET KEYWORD' "$F")" -ge 3`
- **T1-03 — required structure present.** Required headings/sections exist.
  Check: `grep -qE '^# ' "$F" && grep -qE '^## ' "$F"` (H1 + at least one H2).
- **T1-04 — word-count band.** Within the brief's range (e.g. 800–1200).
  Check: `wc -w < "$F" | awk '{exit !($1>=800 && $1<=1200)}'`
- **T1-05 — UTM parameters on every outbound link.** Every external link carries the
  campaign UTM schema (the most common real-world campaign defect).
  Check: every `http` link in `$F` matches `utm_source=…&utm_medium=…&utm_campaign=…`
  (grep the links, assert each has the three params; fail if any link lacks them).
- **T1-06 — link integrity.** No broken links.
  Check: `lychee --no-progress "$F"` (or `markdown-link-check "$F"`) exits 0.
  Pre-req check: `command -v lychee || command -v markdown-link-check`.
- **T1-07 — citation marker per claim.** Every line flagged as a claim has a source
  ref. Convention: claim lines end with a `[^src:…]` footnote marker.
  Check: no claim-tagged line lacks a `[^src:` marker (grep claim lines, assert).
- **T1-08 — banned words / jargon absent.** (See the voice list below for the set.)
  Check: `! grep -rIniwE 'BANNED_WORD_1|BANNED_WORD_2|synergy|revolutionary|game-?changer' "$F"`
- **T1-09 — required disclaimer present** (when the deliverable makes a regulated
  claim). Check: `grep -qi 'DISCLAIMER TEXT' "$F"`
- **T1-10 — unsubscribe + physical address present** (email deliverables, CAN-SPAM).
  Check: `grep -qi 'unsubscribe' "$F" && grep -qiE 'address|[0-9]{3}.*(st|ave|rd|blvd)' "$F"`
- **T1-11 — alt text present on every image** (accessibility).
  Check: no `![]( )` with an empty alt; `! grep -nE '!\[\][(]' "$F"`
- **T1-12 — trademark usage.** ™/® appears on first brand mention where required.
  Check: `grep -q 'BRAND®\|BRAND™' "$F"` (tune per brand guide).
- **T1-13 — readability band.** Flesch Reading Ease within the channel's target band
  (deterministic given the formula). Check: a readability scorer returns a score in
  range (e.g. blog 50–70; landing 60–80). Pre-req: a scorer is installed.
- **T1-14 — asset spec.** Image/video matches the channel spec (dimensions, aspect,
  size). Check: `identify -format '%wx%h' asset.png` (or `ffprobe` for video) equals
  the spec-table value for that channel.
- **T1-15 — image registered against the brand lock.** Every generated/embedded image
  is listed in `assets/manifest.md` with a `brand-lock:` ref (the signed
  `creative/brand-lock.md`), so no orphan image ships ungated. Pre-req: a signed
  `creative/brand-lock.md` exists. Check: `test -f creative/brand-lock.md && grep -q '^signed-by:' creative/brand-lock.md`
  (lock exists + signed), and every asset referenced in a deliverable has a row in
  `assets/manifest.md` carrying `brand-lock:` (grep the embedded asset paths, assert
  each appears in the manifest with the ref; fail if any is unregistered).

These are illustrative — tune the keyword, bands, banned list, and disclaimer text to
the campaign brief and brand guide. The verifier authors the concrete commands while
builders draft (Phase 2 heterogeneous wave).

---

## Voice & tone checklist (Tier-2 — Brand Guardian gates; grep-able subset → Tier-1)

Holistic voice is a reviewer judgement; the mechanical parts are pushed to Tier-1.

- **V-01 — point of view.** Second person ("you"), active voice. *(Active-voice
  spot-checks are partly grep-able; holistic judgement is Tier-2.)*
- **V-02 — reading level.** Matches T1-13 band for the channel.
- **V-03 — banned words / jargon absent.** Mechanical → enforced by T1-08. The list
  (tune per brand): `synergy, revolutionary, game-changer, world-class, cutting-edge,
  leverage (as verb), disrupt, best-in-class`.
- **V-04 — sentence rhythm & length.** No wall-of-text; varied cadence. (Judgement.)
- **V-05 — on-brand vocabulary.** Uses the brand's preferred terms for the product,
  category, and audience. (Judgement against the brand guide.)
- **V-06 — tone register.** Matches the brand's register (e.g. confident-not-hype,
  warm-not-casual). (Judgement.)
- **V-07 — consistency with the message house.** Claims and framing derive from
  `positioning/messaging.md`, not invented per-deliverable. (Judgement + diff check.)
- **V-08 — visual brand-lock conformance.** Every image (standalone OR embedded in
  another member's deliverable) conforms to the signed `creative/brand-lock.md` —
  palette, type, logo usage, imagery style/mood, do/don't — and was generated from its
  Gemini preamble. The **Brand & Creative Director is the imagery gate**: it signs off
  every image campaign-wide before publish (reviews, never edits a peer's file).
  Manifest-registration is Tier-1 (T1-15); whether the pixels actually match the lock
  is this Tier-2 judgement. No image ships without a V-08 sign-off.

---

## Compliance checklist (Tier-2 + grep-able subset — Legal/Compliance gates)

The Legal/Compliance Reviewer is the **hard gate**: a no-go halts the swarm. Use
`/security-review` as the seat where installed.

- **C-CLAIMS — claims substantiation.** Every factual/comparative/performance claim
  maps to a primary source in the substantiation file (below). Presence of a citation
  is Tier-1 (T1-07); whether the source *supports* the claim is Tier-2 (judgement).
  FTC: substantiate before publishing, especially "#1", "best", and comparative
  claims.
- **C-GDPR — data & consent.** No PII collected without lawful basis; consent copy
  present where data is collected; privacy-policy link present. (Mostly judgement;
  link-presence is grep-able.)
- **C-CANSPAM — email.** Unsubscribe link + valid physical postal address + truthful
  subject line + accurate "from". Mechanical parts → T1-10.
- **C-TM — trademark / IP.** Correct ™/® usage (T1-12); no use of a competitor's
  mark or copyrighted phrasing; no plagiarized copy (originality check). (Judgement.)
- **C-A11Y — accessibility.** Alt text on images (T1-11); sufficient contrast on
  designed assets; no information conveyed by color alone. (Mixed.)
- **C-DISC — disclosures.** Required disclaimers/disclosures present (T1-09); paid
  partnerships and influencer relationships disclosed per FTC endorsement guides.
- **C-REG — regulated categories.** If the product is in a regulated category
  (health, finance, alcohol, children), the category-specific rules apply — flag to
  the owner.

---

## Channel asset-spec table (specs are machine-checkable → T1-14)

Illustrative; replace with the campaign's real channel matrix.

| Channel | Asset | Dimensions | Aspect | Max size |
|---|---|---|---|---|
| LinkedIn | Single image | 1200×627 | 1.91:1 | 5 MB |
| X/Twitter | Single image | 1600×900 | 16:9 | 5 MB |
| Instagram | Feed image | 1080×1080 | 1:1 | 8 MB |
| Blog | Hero image | 1600×840 | 1.91:1 | 500 KB |
| Email | Header image | 600×200 | 3:1 | 200 KB |

---

## Visual brand lock + image-gen tooling (the imagery analogue of the message house)

Every campaign that produces or embeds imagery first produces a signed
`creative/brand-lock.md` — the one approved visual source every image derives from,
exactly as `positioning/messaging.md` is for copy. Owned and signed by the Brand &
Creative Director **before any generation wave runs**; it gates all imagery
campaign-wide (review, never edit a peer's file). Contents:

```
| field | what it pins |
|---|---|
| palette        | brand colors + hex, allowed/forbidden combinations |
| type           | typefaces, weights, sizing scale |
| logo usage     | clear-space, min size, do/don't placements |
| imagery style  | mood, subject, composition, photographic vs illustrated |
| do / don't     | concrete examples of on- and off-brand imagery |
| channel spec   | per-channel dimensions/aspect/size (→ the asset-spec table, T1-14) |
| gemini preamble| the reusable brand-style prompt string every generation is seeded with |
| signed-by:     | the Brand & Creative Director's sign-off line (T1-15 pre-req) |
```

**Image-gen tooling — Gemini.** The `gemini` CLI (headless `-p`) is the brand-aware
brain: it builds/critiques each prompt against the brand lock and runs the
brand-conformance pass. It has **no one-shot image flag** — the pixels come from the
nano-banana Gemini image MCP (`nanobanana_generate_image` / `nanobanana_edit_image`).
Both are Gemini. No image is generated before `creative/brand-lock.md` is signed.
Registration is enforced by **T1-15**; pixel-level conformance by **V-08**.

---

## Claims-substantiation requirement (the Legal gate's input artifact)

Every campaign with external claims produces a `claims-substantiation.md` mapping
each claim → its primary source. The Legal/Compliance Reviewer gates against this
file; the CMO re-derives/re-confirms each source (never copies an agent's claim
verbatim — untrusted-input boundary). Format:

```
| claim (as it appears in the deliverable) | deliverable + line | primary source (URL/doc + line) | verified by | date |
```

A claim with no row in this file does not ship.
