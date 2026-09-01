# Design memory (PRODUCT.md + DESIGN.md)

Vercel's public `design.md` pattern maps here: **project files**, not a second mega-prompt in this skill.

## Before visual work

Check the project root:

| File | Missing action |
| --- | --- |
| `PRODUCT.md` | Phase = impeccable `init` |
| `DESIGN.md` + visual code | Phase = impeccable `document` (scan) |
| `DESIGN.md` + greenfield | Phase = impeccable new-work / `shape` |
| Both exist and current | Proceed to build/refine phase |

Do not invent a parallel design format. Use impeccable's files.

## Reader job → structure

Before build, one sentence in the run card: **what the reader decides or does here.**

Structure follows the job (Vercel eval insight): renewal proposal leads with recommendation; planning page leads with controls. Map to impeccable mode (Persuade / Operate / Read / Experience).

## Observable rules

When encoding into `DESIGN.md`, write checkable prose:

- Good: `Evidence tables use the full content width available.`
- Bad: `Make tables feel less cramped.`

Named anti-patterns live in impeccable [craft-floor](../../impeccable/reference/craft-floor.md). Add project-specific repeats to `DESIGN.md` ## Do's and Don'ts or a `## Project rules` section.

## Mechanic vs judgment

| Kind | Where |
| --- | --- |
| Judgment (hierarchy, tone, composition) | `DESIGN.md` prose |
| Repeatable mechanics (spacing, type scale, table width) | CSS/tokens in the project; reference class names in `DESIGN.md` |
| Mechanical failures | impeccable detector / audit |

Do not load project CSS into context for "reference" — use token names and class names documented in `DESIGN.md`.

## Encode loop

After verify or critique, if the user (or critique) would repeat the same correction:

1. Fix the page once in the current phase.
2. Append an observable rule to `DESIGN.md`.
3. Note the encode in the run card.
4. Stop — do not re-run polish in the same session unless the user asks.

This replaces a full eval harness in v1.
