# Learning log — autonomous curate-loop audit trail

Append-only record of every autonomous action the cross-campaign learning loop takes
on this skill's own repo: each `promote` (ledger → playbook), `edit`, `graduate`
(playbook → `SKILL.md`), `decay`, and `revert`. Every entry carries its commit SHA so
any action is reversible with `git revert` — the kill-switch for autonomous learning.

This loop runs **only in the post-run curate ritual, outside any campaign swarm**
(SKILL.md → Cross-campaign learning loop), never mid-run, so it never violates
worktree isolation. Entries are written from verified evidence the lead re-derives —
never an agent self-report copied verbatim (anti-poisoning, untrusted-input boundary).

## Format

`date | action | target | summary | provenance | commit SHA`

- **action** — `promote` | `edit` | `graduate` | `decay` | `revert` | `bootstrap`
- **target** — the file/play touched (`PLAYBOOK.md#P1`, `SKILL.md §Phase 3`, …)
- **provenance** — the re-derived evidence / verify-gate behind the action
- **commit SHA** — for `git revert`

## Entries

- 2026-06-22 | bootstrap | LEARNING-LOG.md | audit trail created with marketing-swarm v1.0.0; the playbook seeds P1 and P2 in `staging`. First real autonomous entries land once the loop runs on a downstream campaign and a play recurs across a second independent campaign + passes a verify-gate. | marketing-swarm v1.0.0 build | (initial commit)
- 2026-08-03 | bootstrap | loop/* + research/* | weekly internet-research self-improvement loop added (v1.2.0): 6-lens Friday pipeline, propose-only core tier, research/-fenced auto-commit, checks.sh self-heal gate; week-0 digest seeded from an 8-agent research workflow with adversarial citation-verification | council review (10 amendments adopted: no-Bash headless, propose-only core, fenced commits, no source quotas) + approved plan | db8edd3 (verifier-wave hardening: the commit carrying this line)
