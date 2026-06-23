# Roster — the marketing swarm org chart (a menu, not a headcount)

The CMO (lead session) selects from this menu per campaign. A small campaign
instantiates only the leads and members its ownership map needs — do NOT staff all
eight leads for one blog post (anti-over-staffing, see `SKILL.md`). Each role has a
dedicated prompt template under [`agents/`](agents/); this file is the index +
one-line charters. Leads are **persistent specialists** (continue via SendMessage
across waves); members are **per-task subagents** launched under a lead in a wave.

**Default acceptance-tier emphasis** tells you which gates a role's deliverables
usually face (T1 = machine-checkable Tier-1 catalogue in `BRAND-AND-COMPLIANCE.md`;
T2 = checklist-gated reviewer sign-off).

---

## Orchestrator

- **CMO** — `agents/cmo.md` — the lead session. Writes the brief, runs the council,
  owns + validates the disjoint ownership map, integrates deliverables, holds the
  brand/legal/budget gates, and is the only one who publishes. *(Emphasis: owns every
  gate; runs all Tier-1 evidence itself.)*

## Council personas (Phase 1 seats; convened by the CMO, may be filled by a lead)

- **Brand Guardian** — voice/tone/visual consistency. Skill seat: `/code-review`
  against the voice checklist. *(T2: V-01…V-07.)*
- **Legal/Compliance Reviewer** — claims, FTC/GDPR/CAN-SPAM, trademark/IP,
  plagiarism. **Hard gate — a no-go halts the swarm.** Skill seat:
  `/security-review`. *(T2: C-CLAIMS, C-GDPR, C-CANSPAM, C-TM, C-A11Y, C-DISC,
  C-REG.)*
- **Marketing-Ops / Measurability Lead** — tracked, measurable, will it move the
  named metric. Runs the Tier-1 checks. Skill seat: `/verify`, `/loop`. *(T1: all.)*
- **Delivery / Audience Advocate** — sequencing/feasibility + resonance with the
  target persona.

---

## Team leads (persistent specialists) and their members (subagents)

### 1. Brand & Creative Director — `agents/leads/brand-creative-director.md`
Guards voice, visual identity, and creative coherence across every deliverable. Owns
the **visual brand lock** (`creative/brand-lock.md`, signed before any image is
generated) and is the **campaign-wide imagery gate** — signs off every image, incl.
those embedded in other members' deliverables (reviews, never edits). Image gen =
**Gemini** (`gemini` CLI as brand brain + nano-banana image MCP as generator).
- **Copywriter** — `agents/members/copywriter.md` — headline/body copy on-brief and
  on-voice. *(T1-01,02,04,08; T2 V-*)*
- **Art Director / Designer** — `agents/members/art-director.md` — visual concepts
  and layout to brand + channel spec; generates via Gemini from the signed brand lock.
  *(T1-11,12,14,15; T2 C-A11Y, V-08)*
- **Video / Motion Designer** — `agents/members/video-motion-designer.md` — motion/
  video scripts and storyboards. *(T1-14; T2 V-*, C-A11Y)*
- **Brand Voice Editor** — `agents/members/brand-voice-editor.md` — line-edits every
  deliverable to the voice/tone checklist. *(T2 V-* primary; T1-08,13)*

### 2. Content Marketing Manager — `agents/leads/content-marketing-manager.md`
Owns the editorial calendar and the long-form content engine.
- **Long-form Writer** — `agents/members/longform-writer.md` — blogs, whitepapers,
  ebooks. *(T1-01,02,03,04; T2 V-*, C-CLAIMS)*
- **SEO Specialist** — `agents/members/seo-specialist.md` — keyword targeting,
  on-page SEO, meta/structure. *(T1-02,03,05; highly machine-checkable)*
- **Editor / Fact-checker** — `agents/members/editor-factchecker.md` — structural
  edit + claims-to-source verification. *(T1-07; T2 C-CLAIMS primary)*
- **Repurposing Writer** — `agents/members/repurposing-writer.md` — atomizes
  long-form into derivative formats. *(T1-01,04,08)*

### 3. Product Marketing Manager (PMM) — `agents/leads/product-marketing-manager.md`
Owns positioning, messaging, and the launch narrative.
- **Messaging Strategist** — `agents/members/messaging-strategist.md` — value props,
  positioning statements, the message house. *(T2 V-07 primary; drives the
  shared-file handoff)*
- **Competitive Analyst** — `agents/members/competitive-analyst.md` —
  competitor/market intel. *(Untrusted-input boundary applies hard; T2 C-TM)*
- **Sales-Enablement Writer** — `agents/members/sales-enablement-writer.md` —
  battlecards, one-pagers, demo scripts. *(T1-01,07; T2 C-CLAIMS)*
- **Launch PMM** — `agents/members/launch-pmm.md` — launch tier plan, GTM checklist.
  *(T2 Delivery)*

### 4. Demand Generation / Growth Manager — `agents/leads/demand-gen-manager.md`
Owns pipeline-driving campaigns and paid/organic acquisition.
- **Paid-Media Buyer** — `agents/members/paid-media-buyer.md` — ad copy + targeting
  plans. *(Spend is owner-gated; T1-01,05,08; T2 C-CLAIMS)*
- **Landing-Page / CRO Specialist** — `agents/members/landing-cro-specialist.md` —
  landing pages and conversion experiments. *(T1-05,11,13; T2 C-GDPR)*
- **Marketing-Automation Specialist** — `agents/members/marketing-automation-specialist.md`
  — nurture flows, scoring, campaign wiring. *(T1-05; T2 C-GDPR)*
- **Marketing Development Rep (MDR)** — `agents/members/mdr.md` — qualify and route
  inbound marketing-sourced leads, craft MDR outreach/follow-up sequences, and feed
  lead-quality signal back to demand gen. *(T1-01,10; T2 C-CANSPAM, C-GDPR)*
- **Webinar / Event Marketer** — `agents/members/webinar-event-marketer.md` — event
  funnels and follow-up. *(T1-05,10; T2 Delivery)*

### 5. Lifecycle / Email Manager — `agents/leads/lifecycle-email-manager.md`
Owns owned-audience comms and retention.
- **Email / Lifecycle Marketer** — `agents/members/email-lifecycle-marketer.md` —
  campaign and lifecycle email copy/flows. *(T1-01,05,08,10; T2 V-*, C-CANSPAM)*
- **Segmentation Analyst** — `agents/members/segmentation-analyst.md` — audience
  segments and triggers. *(T2 C-GDPR)*
- **Deliverability / Compliance Checker** — `agents/members/deliverability-compliance-checker.md`
  — CAN-SPAM/GDPR, unsubscribe, sender hygiene. *(T1-10 primary; T2 C-CANSPAM,
  C-GDPR)*

### 6. Social & Community Manager — `agents/leads/social-community-manager.md`
Owns social channels, community, and real-time engagement.
- **Social Copywriter** — `agents/members/social-copywriter.md` — per-platform posts
  and threads (one file per platform = clean disjoint split). *(T1-01,05,08,14)*
- **Community Manager** — `agents/members/community-manager.md` — engagement
  playbooks, moderation guidelines. *(Untrusted-input: UGC; T2 C-DISC)*
- **Influencer / Partnerships Coordinator** — `agents/members/influencer-partnerships-coordinator.md`
  — partner briefs. *(Verify influencer claims; T2 C-DISC, C-CLAIMS)*

### 7. PR / Communications Manager — `agents/leads/pr-comms-manager.md`
Owns earned media, narrative, and external statements.
- **Media Relations Writer** — `agents/members/media-relations-writer.md` — press
  releases, media pitches. *(High-stakes → best-of-N; T2 C-CLAIMS)*
- **Comms / Messaging Reviewer** — `agents/members/comms-messaging-reviewer.md` —
  message discipline, crisis/holding statements. *(T2 V-*, C-CLAIMS)*
- **Analyst / Investor Relations Writer** — `agents/members/analyst-ir-writer.md` —
  analyst briefs. *(High-stakes, externally visible → owner-gated; T2 C-CLAIMS)*

### 8. Marketing Analytics & Ops Manager — `agents/leads/analytics-ops-manager.md`
Owns measurability, martech, and the "will it move the metric" function. **Doubles
as the swarm's heterogeneous verifier** — authors the Tier-1 checks while builders
draft.
- **Data Analyst** — `agents/members/data-analyst.md` — defines success metrics,
  baselines, the measurement plan. *(Authors T1 acceptance criteria)*
- **Martech / Ops Engineer** — `agents/members/martech-ops-engineer.md` —
  UTM/tracking/tagging, attribution wiring, link integrity. *(T1-05,06 primary)*
- **Reporting Analyst** — `agents/members/reporting-analyst.md` — dashboards and
  post-campaign readouts. *(T1; reads-only against analytics)*

---

## Why a roster file but no executable agent registry

agent-swarm deliberately has no `agents/` tree — agents are task-shaped, not a fixed
org. marketing-swarm adds dedicated role files because a marketing org *is* a legible
set of roles and the templates are reusable, but they remain **reference templates
the CMO fills per campaign**, not a registry that auto-spawns a fixed headcount. The
task-shaped disjoint-ownership invariant still governs: the ownership map decides who
runs, the roster only says what each role is for. If a role's prompt gets re-written
identically every campaign, graduate the stable parts into its template (earn it with
data, per `IMPROVEMENTS.md`).
