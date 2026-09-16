---
name: grill-with-mocks
description: Resolve an underspecified idea through plain-language frontier questions, recommendations, and adaptive decision, visual, or capture artifacts.
disable-model-invocation: true
---

# Grill With Mocks

Turn an underspecified idea into a decision-complete plan. Use the smallest
sufficient combination of decision grilling, visual grounding, and durable
capture. The user should understand what is being decided before selecting an
option.

The session is read-only until the user separately authorizes implementation.
It may inspect the workspace and create ephemeral artifacts, but it does not
edit product files, publish artifacts, commit, or push.

## Route the session

Classify the request internally before the first frontier round. Announce the
selected route in one short line; do not make the user choose a mode unless the
request is genuinely ambiguous.

- **Decision mode** — always on. Use a private ledger and resolve material
  choices before implementation.
- **Visual mode** — add when a layout, interaction, state transition, flow,
  ownership relationship, or architecture is easier to understand when shown.
  Use a mock, state sequence, flow, comparison, or structure diagram.
- **Capture mode** — add when the user asks for notes, a brainstorm, a resume
  point, durable context, or a long session that needs to survive context loss.
  Persist after each answer. Without that signal, keep the ledger private and
  use only ephemeral artifacts.

The routes can combine. For example, a complex product flow may use decision +
visual + capture; a short text-only trade-off may use decision only.

## Start

1. Restate the idea in one plain sentence.
2. Inspect the workspace for facts that could answer decisions: relevant entry
   points, callers, shared utilities, interfaces, tests, design tokens, and
   existing product language.
3. Build a private session ledger with these lists:
   - **Settled** — decisions the user confirmed.
   - **Frontier** — all currently answerable material decisions and the child
     branches each one controls.
   - **Assumptions** — temporary defaults, each marked as inferred.
   - **Coverage** — surfaces, states, roles, breakpoints, flows, boundaries,
     evidence, or acceptance checks the selected artifacts must cover.
   - **Confidence** — confirmed, tentative, recommended, assumed, or external
     unknown.
4. If visual mode is active, choose the smallest adaptive visual:
   - product surface or interaction → wireframe or state sequence;
   - control/data flow → flow or sequence diagram;
   - ownership or structure → component, file, or architecture tree;
   - change to an existing shape → before/after comparison.

Read [mock-quality.md](references/mock-quality.md) before drawing the first
visual. Start from [mock.html](templates/mock.html); replace its example content
rather than drawing an unstructured page from scratch.

If capture mode is active, create `brainstorms/{YYYY-MM-DD}-{topic-slug}.md`
before the first frontier round. Never overwrite an existing capture; add a
unique suffix. Tell the user the path in one line. The file is the source of
truth for the capture route, not an unverified memory of the conversation.

## Grill the frontier

Ask **all currently answerable, material frontier decisions in one round**.
Resolve parent decisions before their child branches. Investigate facts instead
of asking the user for information the workspace or tools can provide.

Keep each block short. Use one to five blocks when possible. If more material
decisions are genuinely answerable, keep them in the same round but group them
under short headings; do not hide them by prematurely narrowing the frontier.

Use this exact output shape. The title is bold and unnumbered. Options are
numbered. Do not use `Q1`, icons, arrow glyphs, or question marks in the
questioning blocks.

```md
**[Short decision title]**

[Plain-language sentence describing what must be chosen]

1. [Concrete outcome or behavior]
2. [Concrete outcome or behavior]
3. [Concrete outcome or behavior]

**Recommended:** [option number]. [Short reason with the decisive tradeoff]

0. Explain this decision more simply
```

Rules for every block:

- Use a short title that immediately names the subject.
- Prefer observable behavior over technical labels. For example, say “warn
  when two people change the same record” instead of “optimistic concurrency”.
- Keep the choice sentence to one short sentence and each option to one line.
- Explain an unavoidable technical term in the same sentence where it appears.
- Make the recommendation concrete: name the option number, its main benefit,
  and its most important cost or limitation.
- `0` means the decision is not understood and remains unsettled. Explain it
  with a concrete example, then present the same decision again.
- Do not ask the user to choose facts that can be verified from the workspace,
  source material, or tools.
- Only ask for choices the user owns. If evidence in the workspace, source
  material, or current visual can answer the decision, investigate it instead.
- Challenge contradictions and weak premises directly. Do not manufacture a
  low-value decision after the frontier is resolved.

After each answer:

1. Update the ledger.
2. In capture mode, append the answer before asking another round. Record
   user-confirmed facts separately from assistant recommendations and unresolved
   flags. Read back the saved entry; if writing fails, stop claiming progress
   is captured.
3. Translate consequential choices into a plain-language consequence. If the
   user selected the recommendation without demonstrating understanding, mark
   the decision **tentative** rather than confirmed.
4. Trace which downstream branches became live, closed, or newly ambiguous.
5. Continue with the next frontier round until every material branch is settled
   or explicitly external.

## Draw at decision checkpoints

A checkpoint occurs when an answer changes layout, ownership, state transition,
role access, interface shape, or another relationship that can be seen. At a
checkpoint:

1. Update the HTML mock at `/tmp/grill-with-mocks/<slug>.html` unless the user
   approved another location.
2. Draw only settled facts plus clearly labeled inferred placeholders.
3. Preserve earlier states when comparison matters. Show the entry point, main
   interaction, and resulting state for a flow; include role, empty, error, or
   responsive variants only when they are live branches.
4. Open or display the mock for the user and state the single decision it now
   reflects in one line.
5. Resume with the next frontier round.

Do not redraw after an answer that changes only wording or confirms the current
shape. Do not use decorative dashboards, generic cards, or motion without
semantic value.

## Finish

The grilling phase is complete only when:

- every material decision branch is settled or explicitly external;
- the selected artifact covers every item in the ledger's Coverage list;
- decisions are explicit enough for the next action, without hidden
  implementer-facing assumptions;
- each final decision is labeled **confirmed**, **tentative**, **recommended**,
  **assumed**, or **external unknown**.

If visual mode is active, verify the final HTML against rendered pixels at
desktop and mobile sizes. Fix and re-render until it satisfies every check in
[mock-quality.md](references/mock-quality.md). Use reduced-motion emulation when
the mock contains meaningful animation. Never report markup-only validation as
visual verification.

Return only the artifacts selected for the route:

- **Decision mode:** a concise decision brief and implementation handoff.
- **Visual mode:** an absolute path or link to the verified local artifact, the
  decision it reflects, inspected viewports and states, and limitations.
- **Capture mode:** an absolute path to the capture, a short recap, open flags,
  and the resume point.
- **Combined modes:** one concise handoff that links each artifact.

The HTML mock and non-durable decision ledger are ephemeral. Ask before copying
them into the product repository or publishing them. A visual recap is a
post-implementation artifact: create one only when the user separately asks to
recap an actual diff.
