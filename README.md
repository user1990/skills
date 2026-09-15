# Skills

Manual agent skills for evidence-led product decisions, premium UI/UX work, and
reliable design delivery.

This README documents the 9 skills shipped in this repository. It uses a
workflow-oriented structure inspired by [AI Hero's skills directory](https://www.aihero.dev/skills):
start with orientation, choose the phase that matches the problem, then follow
the skill's concrete process.

All skills are **manual-only**. They set `disable-model-invocation: true`, so
they do not auto-load from ordinary prompts. Invoke one explicitly with its
slash command or name it directly.

## Table of contents

- [Quick start](#quick-start)
- [Workflow map](#workflow-map)
- [Installation](#installation)
- [Decision and planning](#decision-and-planning)
  - [`/review-and-recommend`](#review-and-recommend)
  - [`/grill-with-mocks`](#grill-with-mocks)
- [Design workflow](#design-workflow)
  - [`/design`](#design)
  - [`/impeccable`](#impeccable)
  - [`/prototype`](#prototype)
  - [`/scrollcraft`](#scrollcraft)
- [Craft and quality](#craft-and-quality)
  - [`/design-taste-frontend`](#design-taste-frontend)
  - [`/web-animation-design`](#web-animation-design)
  - [`/stop-slop`](#stop-slop)
- [Choosing the right skill](#choosing-the-right-skill)
- [Documentation follow-up](#documentation-follow-up)
- [License](#license)

## Quick start

1. Install the full design pack or an individual skill.
2. Inspect the relevant project context before asking for changes.
3. Invoke one skill explicitly.
4. Give it the smallest useful brief, including the target surface, desired
   outcome, and any hard constraints.
5. Review the stated assumptions and verification results before authorizing
   implementation or delivery.

Examples:

```text
/review-and-recommend compare two approaches for the empty billing state
/grill-with-mocks design the approval flow for team expenses
/design redesign the onboarding surface without changing its behavior
/impeccable audit src/pages/settings.tsx
/prototype test whether this state model is understandable
/web-animation-design review the drawer open and close motion
/stop-slop edit this launch copy for a human, direct voice
```

## Workflow map

| Phase | Start here | Main output |
| --- | --- | --- |
| Decide before building | `/review-and-recommend` | Evidence-backed options and a recommendation |
| Resolve an underspecified idea | `/grill-with-mocks` | Settled decisions, a verified ephemeral mock, and an implementation plan |
| Route design work | `/design` | One specialist phase, project run card, verification, and next steps |
| Plan or execute a design command | `/impeccable` | Product/design context, a focused design pass, or a quality report |
| Answer a narrow design or logic question | `/prototype` | Throwaway UI or logic probe |
| Build a scroll-led narrative | `/scrollcraft` | Interview brief, journey page, asset set, and screenshot evidence |
| Improve a landing page or portfolio | `/design-taste-frontend` | Context-specific design direction and a pre-flight-checked implementation |
| Design motion | `/web-animation-design` | Easing, timing, performance, and accessibility guidance |
| Edit prose | `/stop-slop` | Direct, specific prose with an optional quality score |

## Installation

### Full design pack

The full pack is recommended when using `/design`, because the orchestrator
resolves its sibling specialists and reference files by path.

```bash
git clone https://github.com/user1990/skills.git
cd skills
./scripts/install.sh
```

The installer copies these sibling paths into `~/.agents/skills/`:

```text
design/
impeccable/
stop-slop/
design-taste-frontend/
web-animation-design/
scrollcraft/
prototype/
```

It preserves the structure required for relative references such as
`../impeccable` and keeps every installed pack skill manual-only. If an update
restores model-invoked frontmatter, run `./scripts/install.sh` again.

### Individual skills

Use the skills installer and select the skill by its exact name:

```bash
npx skills add user1990/skills
```

`/grill-with-mocks` and `/review-and-recommend` are standalone repository skills.
They are not copied by `scripts/install.sh`.

### Project-local precedence

The design pack stays off until explicitly invoked. Project-local skills in a
repository's `.agents/skills/` remain the normal choice for ordinary coding,
bug fixes, refactors, and project-specific delivery workflows.

# Decision and planning

Use these skills before implementation when the main risk is choosing the wrong
problem, scope, interface, or trade-off.

## `/review-and-recommend`

### Skill name

`review-and-recommend` | invoke as `/review-and-recommend`

Canonical source: [skills/review-and-recommend/SKILL.md](skills/review-and-recommend/SKILL.md)

### Intent / purpose

Turn an important pre-implementation decision into a small set of credible,
evidence-backed options. The skill exists to expose trade-offs before code makes
one option expensive to change.

### When to use

Use it when:

- product evidence, issues, code, tests, or history should inform the choice;
- two or more implementation or product approaches are plausible;
- you need an explicit recommendation and a durable "right fix";
- implementation should stop until someone chooses a path.

Do not use it for routine work with an already-settled solution. Do not use it
to create alternatives that the evidence does not support.

### How to use

1. Invoke `/review-and-recommend`.
2. State the decision, intended outcome, constraints, and available evidence.
3. Let the skill inspect relevant product evidence, issues, code, tests, and git
   history.
4. Review 2 to 4 numbered options, each with the change, effort (`Easy`,
   `Medium`, or `Hard`), expected benefit, and trade-offs.
5. Compare the recommendation with the named durable **right fix**.
6. Choose an option in a follow-up. The skill does not implement the choice
   automatically.

Expected response structure:

```md
## Decision
## Evidence
## Options
## Recommendation
## Right fix
```

### Examples

```text
/review-and-recommend choose between client-side filtering and server-side
filtering for the media list. Inspect the current API, tests, and pagination.
```

Expected result: a recommendation grounded in the current code and evidence,
plus an explicit note if the best short-term option is only a compromise.

### Related skills

- [`/grill-with-mocks`](#grill-with-mocks) resolves an underspecified idea one
  decision at a time and makes the consequences visible.
- [`/design`](#design) routes an agreed design task into one specialist phase.
- [`/prototype`](#prototype) tests a disputed UI or logic question with
  throwaway code instead of debating it abstractly.

## `/grill-with-mocks`

### Skill name

`grill-with-mocks` | invoke as `/grill-with-mocks`

Canonical source: [skills/grill-with-mocks/SKILL.md](skills/grill-with-mocks/SKILL.md)

### Intent / purpose

Turn an underspecified idea into a decision-complete plan by asking one
question at a time and evolving the smallest visual mock that reveals the
consequences of each meaningful decision.

The session is read-only for the product repository. It may inspect the
workspace and create an ephemeral HTML mock, but it does not edit product files,
publish, commit, or push.

### When to use

Use it when the open questions affect a surface, interaction, flow, ownership,
roles, states, breakpoints, or system boundaries. It is especially useful when
prose hides disagreement or when implementation would otherwise start with too
many assumptions.

Use a different skill when the decision is already settled, when you need a
production implementation, or when the work is only copy editing.

### How to use

1. Invoke `/grill-with-mocks` and describe the idea in one sentence.
2. The skill inspects relevant entry points, callers, utilities, interfaces,
   tests, tokens, and product language.
3. It maintains a private ledger with `Settled`, `Frontier`, `Assumptions`, and
   `Coverage` lists.
4. It reads `references/mock-quality.md` and starts from
   `templates/mock.html`.
5. It asks exactly one question per round. Parent decisions are resolved before
   their child branches.
6. At a visual checkpoint, it updates
   `/tmp/grill-with-mocks/<slug>.html`, showing settled facts and clearly marked
   inferred placeholders.
7. It displays the mock, names the single decision it reflects, and continues
   with the next frontier question.
8. It finishes only when material branches, coverage, interfaces, failure
   states, compatibility constraints, tests, and acceptance criteria are
   explicit.
9. It verifies the final mock at desktop and mobile sizes, using reduced-motion
   emulation when relevant.

Expected output:

- an absolute path or link to the verified local HTML mock;
- a concise implementation plan covering outcome, behavior, interfaces,
  edge/failure cases, tests, and external unknowns;
- the inspected viewports and states, with unverified limitations called out.

### Examples

```text
/grill-with-mocks design the approval flow for team expenses
```

If the answer changes the role model, the mock should show the relevant entry
point, role-specific access, main interaction, and resulting state. If it only
changes wording, it should not trigger an unnecessary redraw.

### Related skills

- [`/review-and-recommend`](#review-and-recommend) compares evidence-backed
  alternatives before a decision is settled.
- [`/prototype`](#prototype) is the follow-on when a narrow UI or logic question
  needs runnable throwaway code.
- [`/design`](#design) continues an agreed design task through a single design
  specialist phase.

# Design workflow

These skills handle design discovery, visual systems, prototypes, and
scroll-driven pages. Prefer `/design` when you want routing and a run card;
invoke a specialist directly when you already know the phase.

## `/design`

### Skill name

`design` | invoke as `/design`

Canonical source: [skills/design/design/SKILL.md](skills/design/design/SKILL.md)

### Intent / purpose

Orchestrate one focused design phase without replacing the specialist that owns
the work. It keeps design decisions in project files, prevents multiple
specialists from competing in one turn, and finishes with bounded verification
and explicit next steps.

### When to use

Use it for a new surface, redesign, landing page, app UI, prototype, motion
pass, copy pass, or visual quality pass when the correct specialist is not yet
obvious. It is also the entry point for the full design pack.

Do not use it as a general coding router. Project-local engineering skills take
precedence for normal bug fixes, refactors, and delivery work.

### How to use

1. Invoke `/design` with a brief, target surface, and hard constraints.
2. The orchestrator classifies the request using `references/routing.md`.
3. It reads or creates `.agents/design-run.md`.
4. It confirms durable design memory in `PRODUCT.md` and `DESIGN.md`, scheduling
   Impeccable setup when needed.
5. It picks **one** phase: grill, prototype, an Impeccable command, Scrollcraft,
   Stop Slop, design taste, or web animation.
6. It loads the chosen specialist and required references in full.
7. It works in the existing app unless a standalone one-pager was explicitly
   requested.
8. It verifies the bounded result, encodes repeatable corrections in
   `DESIGN.md` when appropriate, updates the run card, and exits.

The orchestrator does not auto-start the next phase. If context is heavy, use
`/clear`, then say `continue design` so it can reload the run card.

### Examples

```text
/design new pricing landing for technical buyers, keep the existing brand
/design audit the responsive behavior of the settings surface
/design prototype the empty state before touching production code
```

Expected result: one completed specialist phase, the verification performed,
and 2 to 3 possible next steps. It should not silently run a second specialist.

### Related skills

- [`/impeccable`](#impeccable) is the main design-system and visual-quality
  specialist loaded by the orchestrator.
- [`/prototype`](#prototype), [`/scrollcraft`](#scrollcraft),
  [`/design-taste-frontend`](#design-taste-frontend),
  [`/web-animation-design`](#web-animation-design), and
  [`/stop-slop`](#stop-slop) are the phase specialists it can route to.
- [`/grill-with-mocks`](#grill-with-mocks) handles a thin brief when decisions
  are not yet ready for visual execution.

## `/impeccable`

### Skill name

`impeccable` | invoke as `/impeccable [command]`

Canonical source: [skills/design/impeccable/SKILL.md](skills/design/impeccable/SKILL.md)

### Intent / purpose

Provide a complete design operating system for product context, visual
direction, implementation quality, audits, refinements, and bounded finishing
passes. It balances the brief, existing product truth, production constraints,
and a high craft floor.

### When to use

Use it when you need to plan or improve a real UI surface, document an existing
design system, audit accessibility/performance/responsiveness, refine visual
hierarchy, or work through a live browser variant.

Use `shape` before code when the UX/UI direction is not settled. Use `audit` for
technical quality checks, `critique` for UX heuristics, and `polish` for a final
bounded pass. Do not use it to replace product-specific logic or to repair
context drift without an explicit doctor request.

### How to use

1. Invoke a command, or invoke `/impeccable` with no argument to receive the
   context-aware command menu.
2. Run `node <skill-base-dir>/scripts/context.mjs` once per session, keeping cwd
   at the project. Pass `--target <path>` when a named source or route matters.
3. Load the reference for the selected command before acting.
4. Inspect the target and at least one representative source of visual truth,
   such as tokens, theme, CSS, components, or assets.
5. Load `reference/craft-floor.md` immediately before editing UI.
6. Make one focused pass and verify it in a bounded round, normally desktop and
   mobile together.

Command quick reference:

| Command | Use |
| --- | --- |
| `init` | Capture durable product context in `PRODUCT.md` |
| `shape [feature]` | Plan UX/UI before code |
| `document` | Generate `DESIGN.md` from existing code |
| `extract [target]` | Pull reusable tokens and components into the design system |
| `critique [target]` | Review UX with heuristic scoring |
| `audit [target]` | Check accessibility, performance, and responsive quality |
| `polish [target]` | Run a final quality pass |
| `bolder [target]` / `quieter [target]` | Increase or reduce visual intensity |
| `distill [target]` | Remove complexity and keep the essential experience |
| `harden [target]` | Address errors, internationalization, and edge cases |
| `onboard [target]` | Design first-run, empty, and activation states |
| `animate [target]` | Add purposeful motion |
| `colorize [target]` | Add strategic color |
| `typeset [target]` | Improve typography hierarchy and fonts |
| `layout [target]` | Improve spacing, rhythm, and hierarchy |
| `delight [target]` / `overdrive [target]` | Add personality or push beyond convention |
| `clarify [target]` | Improve labels, UX copy, and errors |
| `adapt [target]` | Adapt for devices and screen sizes |
| `optimize [target]` | Diagnose and fix UI performance |
| `live` | Pick browser elements and generate visual alternatives |

Useful maintenance commands:

```bash
node .agents/skills/impeccable/scripts/pin.mjs <pin|unpin> <command>
$impeccable hooks <on|off|status|ignore-rule|ignore-file|ignore-value|reset>
$impeccable doctor
```

`pin` creates or removes a standalone `$<command>` shortcut. `hooks` manages
the design detector. `doctor` reports or repairs drift in `PRODUCT.md`,
`DESIGN.md`, sidecars, configuration, surface briefs, and the hook. A
`CONTEXT_STALE` finding is reported during setup, not silently repaired during
another design task.

### Examples

```text
/impeccable shape a first-run empty state for the project dashboard
/impeccable audit src/pages/settings.tsx
/impeccable polish the checkout summary at desktop and mobile widths
/impeccable live
```

Expected result depends on the command: a plan, durable context file, design
system documentation, audit/critique findings, focused UI changes, or browser
variants. The skill's command reference is authoritative for the exact result.

### Related skills

- [`/design`](#design) routes work to one Impeccable command and manages the run
  card.
- [`/web-animation-design`](#web-animation-design) supplies the focused motion
  grammar for the `animate` path.
- [`/design-taste-frontend`](#design-taste-frontend) handles landing and
  portfolio-specific anti-slop direction.
- [`/stop-slop`](#stop-slop) handles prose rather than the whole visual system.

## `/prototype`

### Skill name

`prototype` | invoke as `/prototype`

Canonical source: [skills/design/prototype/SKILL.md](skills/design/prototype/SKILL.md)

### Intent / purpose

Answer one design or logic question with throwaway code. A prototype exists to
reduce uncertainty quickly, not to become an accidental production feature.

### When to use

Use it when the uncertainty is narrow and runnable behavior will teach more than
prose. Choose the logic branch for state models and the UI branch for visual
direction. Use it before implementation when several UI approaches need direct
comparison.

### How to use

1. Invoke `/prototype` and state the question being tested.
2. Select the branch:
   - `LOGIC.md`: build one shareable HTML file with free-play buttons and tabbed
     guided walkthroughs for hard-to-reason-about state cases.
   - `UI.md`: generate several radically different variations on one route,
     switchable through a URL search parameter and a floating bottom bar.
3. Keep it near the real module or page, but name it clearly as a prototype.
4. Make it trivial to run with one project command, or make a logic demo a
   double-clickable HTML file.
5. Keep state in memory by default. Render the full relevant state after every
   action or variant switch.
6. Skip tests, extensive error handling, persistence, and abstractions unless
   they are part of the question.
7. When the answer is validated, fold only the decision into real code. Capture
   the prototype and its verdict on a throwaway branch, not on `main`.

### Examples

```text
/prototype does this approval state machine remain understandable when a
request is edited, rejected, and resubmitted?
/prototype show three radically different treatments for the project empty
state, with ?variant=1, ?variant=2, and ?variant=3.
```

Expected result: a runnable, explicitly throwaway artifact that makes the
tested state or visual choice visible. The production branch should keep the
validated decision, not the exploratory scaffolding.

### Related skills

- [`/grill-with-mocks`](#grill-with-mocks) resolves the larger decision tree
  before a prototype is built.
- [`/review-and-recommend`](#review-and-recommend) compares options when
  evidence and trade-offs matter more than a runnable probe.
- [`/design`](#design) can route to this skill as its single phase.

## `/scrollcraft`

### Skill name

`scrollcraft` | invoke as `/scrollcraft`

Canonical source: [skills/design/scrollcraft/SKILL.md](skills/design/scrollcraft/SKILL.md)

### Intent / purpose

Build scroll-as-timeline journey pages where scroll changes the visitor's
position in a deliberate story. It produces a real token-driven HTML page,
varied interaction devices, generated or supplied assets, and screenshot
evidence across the journey.

### When to use

Use it for an immersive marketing, portfolio, product, or editorial page where
the visitor's changing feeling and understanding are the primary structure. Do
not use it merely because a page contains scrolling. A normal product surface,
dashboard, or simple reveal should use ordinary UI and motion guidance.

### How to use

1. In an existing codebase, read `references/host.md` first.
2. Interview the human before generating anything. Ask eight questions covering
   vibe and references, journey sequence, energy curve, stage-by-stage feelings
   and one memorable peak, a signature behavior, distance from premium-minimal,
   one world versus distinct scenes, and existing assets.
3. Write the answers verbatim into `<workspace>/builds/<name>/BRIEF.md`, including
   the feeling curve, peak, tell-someone sentence, and authored silence. If the
   human is unreachable, mark the file `Self-authored, not interviewed`.
4. Run the environment preflight and resolve the workspace:

   ```bash
   node <skill>/scripts/doctor.mjs
   node <skill>/scripts/workspace.mjs --ensure
   ```

   `KIE_AI_API_KEY` is needed only for generated assets. Check it with
   `node <skill>/scripts/kie.mjs probe`.
5. Write the journey before the acts. Pick one of the eight page grammars,
   invent one bespoke signature move, and pass the fingerprint gate against
   every row in `<workspace>/FINGERPRINTS.md`.
6. Score the acts with at least four device families, no adjacent repeated
   device family, at most two `scrub` acts, one clear peak, and 8 to 14 total
   viewport-heights. Write the feeling curve before choosing devices.
7. Generate assets only after the brief and score are settled. Reuse one style
   preamble, inspect every asset, and encode video for scrubbing:

   ```bash
   node <skill>/scripts/kie.mjs still "<style>\n\n<scene>" out/01-hero.png --ar 16:9
   node <skill>/scripts/kie.mjs shot "<camera move>" out/01-hero.png out/01.mp4 --dur 5
   bash <skill>/scripts/encode.sh out/01.mp4 assets/01.mp4
   ```
8. Build real HTML from `references/template.html`. Keep real headings,
   paragraphs, links, reading order, and selectable text. Copy the engine into
   the build folder and theme it with tokens. Do not edit the shared engine per
   project.
9. Verify the complete scroll journey, not only the first and last frame:

   ```bash
   node <skill>/scripts/serve.mjs --root . --port 4500 &
   node <skill>/scripts/shoot.mjs --url http://localhost:4500 --out lab/shots
   node <skill>/scripts/shoot.mjs --url http://localhost:4500 --out lab/mobile --width 390 --height 844
   node <skill>/scripts/shoot.mjs --url http://localhost:4500 --out lab/reduced --reduced-motion
   ```

   Read the generated contact sheet, tab through focus order, and run the feel
   check against the intended curve. Headless Chrome does not prove behavior on
   a real phone.
10. Report the grammar and rejected alternatives, signature move, fingerprint
    results, journey, feeling curve, peak, score, generated assets, inspected
    screenshots, local URL, and limitations. Append the build row to
    `FINGERPRINTS.md`.

### Examples

```text
/scrollcraft create a product story for a repairable travel pack. The visitor
should feel recognition, then see the cost of disposable gear, then commit to
repair. We have product photography but no video.
```

Expected result: a build folder containing `BRIEF.md`, a journey page, assets,
and verification evidence. The final report must distinguish a green headless
run from unverified real-device behavior.

### Related skills

- [`/design`](#design) decides whether a request is truly a journey page and
  routes it without keyword matching.
- [`/web-animation-design`](#web-animation-design) is the right alternative for
  focused product motion rather than a full scroll grammar.
- [`/design-taste-frontend`](#design-taste-frontend) covers landing and
  portfolio visual direction without Scrollcraft's timeline requirements.
- [`/prototype`](#prototype) is better for a small interaction probe.

# Craft and quality

Use these skills for specialized landing-page direction, motion decisions, and
prose quality. They are intentionally narrower than general implementation.

## `/design-taste-frontend`

### Skill name

`design-taste-frontend` | invoke as `/design-taste-frontend`

Canonical source: [skills/design/design-taste-frontend/SKILL.md](skills/design/design-taste-frontend/SKILL.md)

### Intent / purpose

Improve landing pages, portfolios, and redesigns by reading the actual brief,
audience, brand assets, and constraints before choosing an aesthetic. It exists
to counter generic AI design patterns while preserving product truth and
shipping a usable, accessible surface.

### When to use

Use it for marketing sites, landing pages, portfolios, editorial surfaces, and
redesigns where visual direction and content density are central. It is not for
dashboards, data tables, multi-step forms, code editors, realtime collaboration
UI, or native mobile screens.

### How to use

1. Invoke `/design-taste-frontend` with the page kind, audience, references,
   existing brand assets, and any quiet constraints.
2. Start with a one-line design read:
   `Reading this as: <page kind> for <audience>, with a <vibe> language, leaning toward <system or aesthetic>.`
3. Set the three dials: `DESIGN_VARIANCE`, `MOTION_INTENSITY`, and
   `VISUAL_DENSITY`, each from 1 to 10. Use the brief to override the baseline
   `8 / 6 / 4` when appropriate.
4. Choose one official design system when the brief calls for one. Otherwise
   label the aesthetic honestly and use the existing project's stack.
5. Verify dependencies in `package.json` before importing anything. Prefer
   semantic HTML, real images or clearly labeled placeholders, one locked page
   theme and accent, consistent shape rules, and explicit mobile collapse.
6. Design complete states: loading, empty, error, focus, tactile feedback, and
   success. Keep labels concise, CTA intent unique, and forms labeled above
   their inputs.
7. Motivate every animation by hierarchy, storytelling, feedback, or state
   transition. Use transform and opacity where possible, isolate motion in
   client leaves, and provide reduced-motion behavior.
8. Run the final pre-flight: hero fit, navigation line, contrast, CTA wrapping,
   copy self-audit, layout diversity, asset authenticity, page theme lock,
   mobile behavior, reduced motion, dark mode where required, and Core Web
   Vitals plausibility.

The skill's hard constraints include no default AI-purple glow, no generic
three-card layout, no fake screenshots, no invented precise numbers, no
decorative scroll cues, and no em dashes in visible page copy. These are
guardrails, not substitutes for reading the brief.

### Examples

```text
/design-taste-frontend redesign this developer portfolio for hiring managers.
Keep the existing projects and copy facts, but make the first viewport clearer
and improve mobile navigation.
```

Expected result: a declared design read, dial values, chosen system or honest
aesthetic, context-aware visual direction, and a pre-flight-checked surface.
The canonical skill does not define one fixed output artifact; the implementation
and project conventions determine the final files.

### Related skills

- [`/design`](#design) invokes this as one controlled design phase.
- [`/impeccable`](#impeccable) provides broader design-system documentation,
  audits, and refinements.
- [`/stop-slop`](#stop-slop) is the narrower choice for prose-only cleanup.
- [`/web-animation-design`](#web-animation-design) provides motion-specific
  implementation guidance.

## `/web-animation-design`

### Skill name

`web-animation-design` | invoke as `/web-animation-design`

Canonical source: [skills/design/web-animation-design/SKILL.md](skills/design/web-animation-design/SKILL.md)

### Intent / purpose

Design and review web animation that communicates hierarchy, feedback, spatial
continuity, or state change without sacrificing performance or accessibility.
It encodes a practical grammar for easing, timing, springs, implementation, and
reduced motion.

### When to use

Use it when choosing easing or durations, reviewing an interaction's motion,
deciding between CSS and JavaScript animation, implementing interruptible
gestures, or adding reduced-motion and touch safeguards.

If invoked without a specific question, the required response is exactly:

> I'm ready to help you with animations based on Emil Kowalski's animations.dev course.

### How to use

1. Invoke `/web-animation-design` with one concrete animation question or a
   target interaction.
2. Classify the motion:
   - entering or exiting: `ease-out`;
   - moving or morphing on screen: `ease-in-out`;
   - hover or color transition: `ease`;
   - constant-speed marquee or time visualization: `linear`;
   - `ease-in`: almost never for UI.
3. Keep common UI under 300ms. Use roughly 100 to 150ms for micro-interactions,
   150 to 250ms for standard UI, and 200 to 300ms for modals or drawers.
4. Use springs for draggable, interruptible, organic, or playful motion. Keep
   bounce subtle, usually `0.1` to `0.3`.
5. Prefer CSS for simple predetermined motion and JavaScript for dynamic or
   interruptible motion. Animate `transform` and `opacity`; avoid layout
   properties and expensive blur.
6. Add a `prefers-reduced-motion: reduce` rule for every animated element. On
   touch devices, scope hover behavior to `(hover: hover) and (pointer: fine)`.
7. When reviewing changes, always use one Markdown table with `Before` and
   `After` columns, one row per issue.

### Examples

```text
/web-animation-design review this modal transition and propose timings,
easing, reduced-motion behavior, and any performance changes
```

Expected review format:

| Before | After |
| --- | --- |
| `animation: fadeIn 400ms ease-in` | `animation: fadeIn 200ms ease-out` |
| No reduced-motion support | Add a `prefers-reduced-motion: reduce` rule |

### Related skills

- [`/design-taste-frontend`](#design-taste-frontend) applies motion in the
  context of a complete landing or portfolio surface.
- [`/impeccable`](#impeccable) can route the `animate` command to a broader
  design pass.
- [`/scrollcraft`](#scrollcraft) governs scroll-driven narrative motion and
  adds journey, asset, and screenshot requirements.

## `/stop-slop`

### Skill name

`stop-slop` | invoke as `/stop-slop`

Canonical source: [skills/design/stop-slop/SKILL.md](skills/design/stop-slop/SKILL.md)

### Intent / purpose

Remove predictable AI writing patterns and produce direct, specific, human
prose. It exists to improve trust and readability without replacing the
writer's meaning with generic polish.

### When to use

Use it for drafts, product copy, documentation, portfolio writing, or any prose
that sounds padded, formulaic, passive, vague, over-quoted, or machine-written.
It is not a product strategy review and does not validate factual claims.

### How to use

1. Invoke `/stop-slop` with the draft and its audience or intended use.
2. Cut filler phrases, adverbs, formulaic contrasts, rhetorical setup, and
   throat-clearing.
3. Use active voice, concrete subjects, specific nouns, and varied sentence
   rhythm. Prefer `you` and scene-level detail over distant abstractions.
4. Remove em dashes, quotable slogans, softening, and hand-holding.
5. Run the quick checks for passive voice, vague declarations, repeated sentence
   rhythm, meta-joiners, and inanimate subjects doing human actions.
6. Score the result from 1 to 10 for directness, rhythm, trust, authenticity,
   and density. Revise if the total is below 35 out of 50.

### Examples

```text
/stop-slop
Draft: Here's what this powerful platform does: it quietly transforms the way
teams collaborate, making every workflow feel effortless.
Audience: technical buyers
```

Expected result: a shorter, concrete rewrite that names the actual workflow and
does not introduce unsupported claims, plus the five-dimension score when a
review is requested.

### Related skills

- [`/design-taste-frontend`](#design-taste-frontend) includes copy self-audit
  within a complete page pre-flight.
- [`/design`](#design) can route a copy phase to Stop Slop.
- [`/review-and-recommend`](#review-and-recommend) is the right choice when the
  question is what to say or promise, rather than how to rewrite it.

## Choosing the right skill

| If the main problem is... | Use |
| --- | --- |
| Choosing between credible approaches | `/review-and-recommend` |
| Too many unresolved product or interaction decisions | `/grill-with-mocks` |
| Unsure which design phase owns the request | `/design` |
| A focused design-system, audit, or refinement command | `/impeccable` |
| A narrow UI or state question that needs runnable evidence | `/prototype` |
| A full scroll-led customer journey | `/scrollcraft` |
| Landing or portfolio quality and anti-slop direction | `/design-taste-frontend` |
| Easing, timing, performance, or reduced motion | `/web-animation-design` |
| Direct, human prose | `/stop-slop` |

When a request spans phases, do not invoke every matching skill in one turn.
Start with the skill that resolves the highest-risk uncertainty, then continue
explicitly after reviewing its output.

## Documentation follow-up

The inventory and command names above are complete for the `SKILL.md` files
currently shipped in this repository. The canonical skill files remain the
source of truth for detailed reference files, platform-specific variants,
scripts, and future command additions.

Known documentation limitations to revisit:

- `design-taste-frontend` defines a comprehensive pre-flight and implementation
  rules, but no single fixed output artifact. Document project-specific output
  conventions if they become stable.
- `impeccable` has command-specific references and native-platform variants;
  this README intentionally gives the command map, while those references own
  the detailed procedures.
- `scrollcraft` depends on environment tools such as Playwright, Chrome,
  ffmpeg, and optional asset-generation credentials. Run its doctor command and
  report missing prerequisites rather than assuming they exist.

If a skill gains new frontmatter, commands, required parameters, or output
artifacts, update this README in the same change as the skill.

## License

See [NOTICE.md](NOTICE.md) for upstream attributions. Specialist skills retain
their original licenses.
