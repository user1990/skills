# Exit

## Phase complete when

| Phase | Done when |
| --- | --- |
| Grill | Missing branches closed, or brief was already sufficient |
| Prototype | Question answered; verdict recorded in run card |
| init / document / shape | Target files written; user-visible summary given |
| Build | Surface runs in existing app; primary path works |
| scrollcraft | Journey built per scrollcraft verify; host rule respected |
| stop-slop | Copy pass complete on scoped text |
| design-taste-frontend | Design read stated; anti-slop pass on visible strings |
| web-animation-design | Motion scoped; reduced-motion considered |
| critique / audit | Report delivered; not auto-implemented unless user asks |
| polish | One batched inspect (desktop + mobile), one fix batch, stop |

## Exit message format

```markdown
## Design phase complete

**Did:** [one line]
**Skipped:** [skills not needed + why]
**Run card:** `.agents/design-run.md` updated

### Next (pick one)
1. ...
2. ...
3. Stop — ready to commit / ship
```

Offer **2–3** next steps. Never auto-run the next phase.

## When to say stop

- Critique/audit/polish cycle finished with no P0 issues
- User intent fully met for the declared reader job
- Further work would be open-ended polish

Say **baigta** and do not suggest another polish pass.

## Context hygiene

If the conversation is long after a heavy phase, recommend `/clear` and `continue design` so the next specialist loads fresh. Run card carries state.
