# Host rule

## Default

Build and refine **inside the existing application** the user is working in. Detect stack from the repo (`package.json`, routes, components, framework config).

Do not:

- Replace the whole site with a standalone `index.html` unless the user explicitly asked for a separate one-pager
- Create a parallel site root that bypasses the project's routing and design system
- Vendor scrollcraft's template as the entire product

## Standalone one-pager

Only when the user clearly requests: "separate HTML page", "standalone scroll site", "one-off microsite not in the app".

Even then, prefer integrating scrollcraft engine into an existing route when the repo is a web app.

## Scrollcraft integration

When scrollcraft runs in an existing app:

1. Read [../../scrollcraft/references/host.md](../../scrollcraft/references/host.md).
2. Add engine assets to the project's static/public pipeline.
3. Implement the journey on the target route or page component.
4. Keep the app shell, nav, and shared tokens unless the brief replaces them.

## Prototype

Prototype code lives beside the feature it explores, clearly marked throwaway. Fold decisions into `DESIGN.md` / real code; do not ship prototype as production.
