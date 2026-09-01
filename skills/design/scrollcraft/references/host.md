# Host integration (pack overlay)

Scrollcraft's default output is a standalone HTML page. **In this pack, that is not the default.**

## Default behavior

Integrate into the **existing application** on the route or page the user named:

1. Copy or reference `engine/scrollcraft.js` and `engine/scrollcraft.css` through the project's asset pipeline (public folder, static imports, or framework client script — match the repo's norm).
2. Write semantic HTML for the journey **on that route** — not a replacement root `index.html` for the whole product.
3. Theme with project tokens where they exist; fall back to scrollcraft's six color tokens + two fonts only for the journey surface.
4. Run [doctor.mjs](../scripts/doctor.mjs) from this skill directory when encoding video assets.

## Standalone one-pager

Only when the user explicitly wants a separate scroll microsite outside the main app. State that choice in the project run card.

## Do not

- Replace an entire multi-page app with one scrollcraft HTML file without explicit approval
- Edit `engine/scrollcraft.js` or `engine/scrollcraft.css` per project (theme via tokens and page HTML only)
- Use Claude `/plugin install` — this skill is vendored in the pack
