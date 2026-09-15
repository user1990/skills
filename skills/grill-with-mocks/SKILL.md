---
name: grill-with-mocks
description: Sharpen an idea through one-question-at-a-time grilling while evolving a grounded visual mock at decision checkpoints.
disable-model-invocation: true
---

# Grill With Mocks

Turn an underspecified idea into a decision-complete plan. Ask one question at a
time and use a changing visual to expose disagreements that prose hides.

The session is read-only until the user separately authorizes implementation.
It may inspect the workspace and create an ephemeral HTML mock, but it does not
edit product files, publish artifacts, commit, or push.

## Start

1. Restate the idea in one sentence.
2. Inspect the workspace for facts that could answer questions: relevant entry
   points, callers, shared utilities, interfaces, tests, design tokens, and
   existing product language.
3. Write a private session ledger with four lists:
   - **Settled** — decisions the user confirmed.
   - **Frontier** — the next unresolved parent decision and the branches it
     controls.
   - **Assumptions** — temporary defaults, each marked as inferred.
   - **Coverage** — screens, states, roles, breakpoints, flows, or system
     boundaries the final visual must show.
4. Choose the smallest adaptive visual:
   - product surface or interaction → wireframe or state sequence;
   - control/data flow → flow or sequence diagram;
   - ownership or structure → component, file, or architecture tree;
   - change to an existing shape → before/after comparison.

Read [mock-quality.md](references/mock-quality.md) before drawing the first
visual. Start from [mock.html](templates/mock.html); replace its example content
rather than drawing an unstructured page from scratch.

## Grill the frontier

Ask exactly one question per round. Resolve parent decisions before their child
branches. Each round uses this format:

```md
1. **[Decision]**: [One concrete question whose answer changes the plan.]

**Recommended:** [The answer you recommend and its decisive tradeoff.]
```

Only ask for choices the user owns. If evidence in the workspace, source
material, or current visual can answer the question, investigate it instead.
Challenge contradictions and weak premises directly. Do not manufacture a
question after the frontier is resolved.

After each answer:

1. Update the ledger.
2. Trace which downstream branches became live, closed, or newly ambiguous.
3. Continue questioning unless the answer materially changes the visual model.

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
5. Resume with the next frontier question.

Do not redraw after an answer that changes only wording or confirms the current
shape. Do not use decorative dashboards, generic cards, or motion without
semantic value.

## Finish

The grilling phase is complete only when:

- every material decision branch is settled or explicitly external;
- the visual covers every item in the ledger's Coverage list;
- interfaces, data flow, failure states, compatibility constraints, tests, and
  acceptance criteria are decided to the level needed for implementation;
- no implementer-facing choice remains hidden in an assumption.

Then verify the final HTML against the rendered pixels at desktop and mobile
sizes. Fix and re-render until it satisfies every check in
[mock-quality.md](references/mock-quality.md). Use reduced-motion emulation when
the mock contains meaningful animation. Never report markup-only validation as
visual verification.

Return:

1. a link or absolute path to the verified local HTML mock;
2. a concise Markdown implementation plan covering outcome, behavior and
   interfaces, edge/failure cases, tests, and explicit external unknowns;
3. the viewports and states actually inspected, plus any unverified limitation.

The HTML is ephemeral. Ask before copying it into the product repository or
publishing it. A visual recap is a post-implementation artifact: create one only
when the user separately asks to recap an actual diff.
