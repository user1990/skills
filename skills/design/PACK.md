# Design pack policy

## Manual invocation only

Every skill in this pack sets `disable-model-invocation: true`. None of them auto-load from ambient prompts.

| Skill | How to run |
| --- | --- |
| **design** | `/design` — start here for full orchestration |
| **impeccable** | `/impeccable …` — direct command, or loaded by `/design` |
| Others | Loaded by `/design` reading their `SKILL.md`, or invoke by name |

## No clash with project skills

Repos like CashLift, pari-portfolio, and MyDears ship their own `.agents/skills/` (orchestrate, architecture, security, guide, etc.). Those are **project-local** and win for normal engineering work.

This global pack stays **off** until you type `/design`. It does not intercept:

- bug fixes, refactors, PR work
- routine UI tweaks inside a feature ticket
- copy edits unless you ran `/design` copy phase

## Re-applying after `npx skills update`

Upstream installers may restore model-invoked frontmatter. Re-run `./scripts/install.sh` from this repo to restore manual-only policy.
