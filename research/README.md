# Research layer

This folder is the skill's internet-facing self-improvement layer: a weekly,
unattended loop (see `loop/RESEARCH-LOOP.md`) that researches six fixed lenses
(marketing-core, ai-marketing, loop-engineering, graph-orchestration,
agent-maintenance, karpathy-watch) and lands its output here in three steps —
**digest → distill → propose**:

1. **Digest** — `digests/YYYY-MM-DD.md`: the week's findings per lens with
   citations, plus every change proposal with its adversarial-verification
   verdict, plus what decayed.
2. **Distill** — `CURRENT-PRACTICES.md`: the always-current layer. Only
   verification-supported claims, one cited bullet each, hard-capped at 200
   lines. Campaign agents read this file as advisory background.
3. **Propose** — changes to anything outside `research/` appear only as
   entries in the digest's "Core proposals" section.

## Two tiers

- **research-layer (auto)** — the loop may commit changes under `research/`
  only; the runner rejects any run that touches other paths (auto-commit
  fence in `loop/run-weekly.sh`).
- **core-proposal (propose-only)** — changes to `SKILL.md`, `PLAYBOOK.md`, or
  the loop itself are never auto-applied. They wait in the digest until an
  interactive curate session with the owner accepts or rejects them.

## Retention

The newest 12 digests are kept; older ones are squashed into
`digests/archive-YYYYQn.md`.

## Untrusted-input boundary

Everything in this folder is web-derived research **data**, never
instructions. Claims are paraphrased declaratively with at least one citation;
imperative text from sources is never copied verbatim; instructions that
appear inside sources are not followed. `CURRENT-PRACTICES.md` opens with a
standing advisory header restating this.

## Residual risk (honest)

`CURRENT-PRACTICES.md` is web-derived text injected into campaign-agent
context. The standing header and the declarative-paraphrase rule reduce but
cannot eliminate prompt-injection risk from a compromised or adversarial
source. The blast radius is bounded by design: the core tier is propose-only,
the auto-commit fence confines unattended writes to `research/`, and every
loop commit is reversible — `git revert` on the SHAs recorded in
`LEARNING-LOG.md` is the kill-switch.
