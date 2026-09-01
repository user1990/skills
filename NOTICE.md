# Upstream attributions

This repository bundles third-party agent skills. Each retains its upstream license and authorship.

| Skill | Source | Notes |
| --- | --- | --- |
| impeccable | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Vendored copy |
| stop-slop | [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) | Vendored copy |
| design-taste-frontend | [leonxlnx/taste-skill](https://github.com/leonxlnx/taste-skill) | `skills/taste-skill/SKILL.md` |
| web-animation-design | Local / Emil Kowalski animations.dev course | Vendored copy |
| scrollcraft | [nateherkai/scroll-craft](https://github.com/nateherkai/scroll-craft) | `plugins/nateherk-design/skills/scrollcraft`; pack overlay in `references/host.md` |
| prototype | [mattpocock/skills](https://github.com/mattpocock/skills) | Engineering skill pattern |
| design | Original orchestrator in this repo | Composes the above |

Do not use Claude `/plugin install` for scrollcraft when using this pack.

The Vercel [design.md blog post](https://vercel.com/blog/how-our-agents-build-on-brand-pages-with-design-md) informed the orchestrator's encode loop; we map that pattern to per-project `PRODUCT.md` / `DESIGN.md`, not to Vercel's public file.
