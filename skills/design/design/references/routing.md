# Routing

## Classify first

From the user prompt, set:

| Field | Values |
| --- | --- |
| **Intent** | `new-surface` · `facelift` · `copy-only` · `motion-only` · `scroll-journey` |
| **Mode** | `Operate` · `Read` · `Persuade` · `Experience` (impeccable modes) |
| **Reader job** | One sentence: what decision or task the visitor completes on this surface |

Write all three into the run card before picking a phase.

## Mode hints

- **Operate** — dashboard, settings, forms, admin, tools. Scrollcraft off.
- **Read** — docs, articles, help, changelogs. Scrollcraft off.
- **Persuade** — marketing, landing, pricing, campaigns. Scrollcraft only if journey signals fire.
- **Experience** — portfolio-as-world, gallery, showcase. Scrollcraft if journey signals fire.

## Scrollcraft: journey vs surface

**Journey (use scrollcraft)** — success means the visitor **travels through a story**, not completes a task:

- One long surface with a deliberate peak/climax
- Cinematic, editorial, brand-film, product-story, atelier, exhibition language
- Video scrub, pinned argument, rails, world-as-page
- New marketing / brand / campaign / portfolio-as-experience

**Surface (skip scrollcraft)** — success means decide, buy, sign up, or operate:

- SaaS hero + features + pricing + CTA
- Facelift of existing product UI
- CRUD, tables, wizards, settings
- "Landing with a few sections" without a story arc

**No keyword requirement.** Words like scroll, landing, or narrative are weak signals only.

## Ambiguous → one question

> Should this page guide the visitor through one continuous story (frames, climax, scroll as time), or is it a conventional landing/app surface with sections?

Record the answer in the run card. Do not ask again in the same run unless the user changes intent.

## Picker

| Condition | Phase (specialist) |
| --- | --- |
| Brief missing audience, reader job, or new vs facelift | Short grill (max 3 questions); do not invoke `/grill-me` |
| Look unclear; need to see alternatives | [prototype](../../prototype/SKILL.md) UI branch |
| No `PRODUCT.md` on new surface | impeccable `init` |
| No `DESIGN.md`, visual code exists | impeccable `document` |
| No `DESIGN.md`, greenfield visual world | impeccable new-work via `shape` |
| New surface, brief sufficient | impeccable `shape` then build |
| Facelift, `DESIGN.md` exists | impeccable refinement (`polish`, `quieter`, `bolder`, etc.) — not scrollcraft unless journey rewrite |
| Journey signals + user confirmed | [scrollcraft](../../scrollcraft/SKILL.md) — read [host.md](../../scrollcraft/references/host.md) first |
| After build, landing anti-AI pass | [design-taste-frontend](../../design-taste-frontend/SKILL.md) |
| Copy pass | [stop-slop](../../stop-slop/SKILL.md) |
| Product motion, not scroll journey | [web-animation-design](../../web-animation-design/SKILL.md) |
| Finish | impeccable `critique` → `audit` → `polish` (bounded, one fix batch) |

Skip phases already marked done in the run card.

## Default skips

- scrollcraft on Operate/Read and conventional Persuade
- prototype when intent is clear
- init/document when files exist and are current
- design-taste-frontend on pure Operate dashboards
