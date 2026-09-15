# Mock quality

The mock is a decision instrument, not decoration. Its one takeaway must be
visible in about two seconds.

## Grounding

- Use real repository labels, states, paths, and boundaries when available.
- Mark invented content `Inferred` or `Placeholder`; never present it as fact.
- Redact credentials, private data, and secret-looking values.
- Keep one source of truth for each decision in the session ledger.

## Choose the shape

- Use a wireframe when placement, hierarchy, or interaction is the decision.
- Use a state sequence when the important fact is what changes over time.
- Use nodes and directional edges when ownership or data movement is the point.
- Use before/after frames only when both sides make the change easier to judge.
- Prefer short labels inside the drawing; put at most one caption beneath it.

## Visual contract

- Self-contained HTML with inline CSS and JavaScript; avoid runtime dependencies.
- Responsive from 320px through a desktop viewport.
- Semantic HTML, visible keyboard focus, sufficient contrast, and readable
  static content without JavaScript.
- Motion communicates a transition only. Honor `prefers-reduced-motion` and
  retain the completed state when motion is disabled.
- Product mocks reuse discovered tokens and conventions. Conceptual diagrams
  use one warm primary role, one cool secondary role, and restrained neutrals.

## Render gate

Inspect screenshots or the live rendered page, not source markup. The mock is
done only when every applicable item passes:

- [ ] Nothing overlaps or clips at the inspected viewports.
- [ ] Labels remain legible and attached to the correct element.
- [ ] Every arrow visibly connects the intended source and destination.
- [ ] Before/after frames use comparable scale and context.
- [ ] Entry, interaction, and resulting state are represented for a user flow.
- [ ] Role and failure variants match settled decisions.
- [ ] Inferred content is visibly labeled.
- [ ] Keyboard focus is visible and reading order remains meaningful.
- [ ] Reduced-motion mode preserves the information.
- [ ] The drawing contains no relationship the evidence or user decision does
      not support.

Record the viewports and states inspected. If the environment cannot render the
HTML, report that limitation and do not call the mock verified.
