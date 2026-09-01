---
name: design
description: Orchestrates premium UI/UX work across vendored design skills. Classifies new surfaces, facelifts, copy, motion, and scroll-journey pages; runs one specialist skill per phase; verifies; encodes recurring fixes into DESIGN.md; exits with next steps. Use when the user wants a new page, landing, facelift, redesign, UI polish, marketing surface, scroll experience, or premium design workflow without picking skills manually.
---

# Design

You orchestrate design work. You do not replace specialist skills — you load them whole, one per phase, and follow their process exactly.

## Pack layout

When installed from the full pack, specialists sit beside this skill:

| Specialist | Path (from this folder) |
| --- | --- |
| impeccable | [../impeccable/SKILL.md](../impeccable/SKILL.md) |
| stop-slop | [../stop-slop/SKILL.md](../stop-slop/SKILL.md) |
| design-taste-frontend | [../design-taste-frontend/SKILL.md](../design-taste-frontend/SKILL.md) |
| web-animation-design | [../web-animation-design/SKILL.md](../web-animation-design/SKILL.md) |
| scrollcraft | [../scrollcraft/SKILL.md](../scrollcraft/SKILL.md) |
| prototype | [../prototype/SKILL.md](../prototype/SKILL.md) |

If a sibling path is missing, load the skill by `name` from available skills instead.

## Every run

1. **Classify** the request using [references/routing.md](references/routing.md).
2. **Read or create** [`.agents/design-run.md`](references/run-card.md) in the project (template in that reference).
3. **Ensure design memory** — see [references/design-md.md](references/design-md.md). Before visual work, confirm `PRODUCT.md` and `DESIGN.md` exist or schedule impeccable `init` / `document` / new-work as the current phase.
4. **Pick one phase** — grill (only if brief is thin), prototype, impeccable command, scrollcraft, stop-slop, design-taste-frontend, or web-animation-design. Never two specialists in one phase.
5. **Load the specialist whole** — read its `SKILL.md` and every reference file that phase requires before acting.
6. **Host rule** — [references/host.md](references/host.md). Build in the existing app unless the user explicitly asked for a standalone one-pager.
7. **Verify** — batched inspect (desktop + mobile) or impeccable detector when applicable. No open-ended polish loops.
8. **Encode** — if the same correction would repeat, add an observable rule to `DESIGN.md` (see design-md reference).
9. **Exit** — [references/exit.md](references/exit.md). Update run card. Offer 2–3 next steps; never auto-start the next phase.

## One phase only

Smart zone: one specialist loaded per turn. When the phase completes, stop. If context is heavy, tell the user to `/clear` and say `continue design` — reload run card and run the next phase.

## Scrollcraft gate

Do not keyword-match "scroll" or "naratyvas". Use journey-vs-surface signals in routing.md. If ambiguous, ask exactly one question (form, not jargon) and record the answer in the run card.

## Impeccable routing

When impeccable owns the phase, run its setup (`context.mjs`) once per session, then the command the picker chose (`init`, `shape`, `critique`, `audit`, `polish`, etc.). Do not merge impeccable commands into one mega-pass.

## References

- [routing.md](references/routing.md) — classification, picker, scrollcraft inference
- [design-md.md](references/design-md.md) — PRODUCT.md / DESIGN.md / encode loop
- [host.md](references/host.md) — existing app vs one-pager
- [exit.md](references/exit.md) — completion criteria and next menu
- [run-card.md](references/run-card.md) — `.agents/design-run.md` template
