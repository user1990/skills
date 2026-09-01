# Run card

Create or update `.agents/design-run.md` in the **project being designed** (not in this skills repo).

## Template

```markdown
# Design run

## Request
[paste or summarize user prompt]

## Classification
- Intent:
- Mode:
- Reader job:
- Journey vs surface: [journey | surface | asked: …]

## Design memory
- PRODUCT.md: [exists | missing | stale]
- DESIGN.md: [exists | missing | stale]

## Phases
| Phase | Specialist | Status | Notes |
| --- | --- | --- | --- |
| | | pending / done / skipped | |

## Encoded rules
- [rules appended to DESIGN.md this run]

## Next
- [queued phase or "done"]
```

## Rules

- Update after every exit.
- After `/clear`, read this file first and continue from **Next**.
- Do not duplicate full specialist content here — pointers only.
