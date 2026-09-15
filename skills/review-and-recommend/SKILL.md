---
name: review-and-recommend
description: >
  Review evidence, compare real options with effort and trade-offs, recommend a
  path, and name the right fix. Use before implementing when a decision needs
  evidence-backed choices.
disable-model-invocation: true
---

# Review and recommend

Expose meaningful choices and trade-offs before work begins.

1. Review the relevant product evidence, issues, code, tests, and git history.
2. State the decision, intended outcome, constraints, facts, and important
   unknowns.
3. Present 2–4 credible numbered options. For each, include:
   - the change;
   - effort: `Easy`, `Medium`, or `Hard`;
   - expected benefit;
   - constraints, risks, or qualities it gives up.
4. Do not invent alternatives. If only one option is credible, present it and
   explain why the others are not.
5. Recommend the best option under the current constraints.
6. Name the durable **right fix**. If it differs from the recommendation,
   explain the compromise.
7. Stop and wait for a choice. Do not edit, commit, push, deploy, or otherwise
   implement anything. Choosing an option is not authorization to implement it.

Use this response structure:

```md
## Decision

## Evidence

## Options

## Recommendation

## Right fix
```
