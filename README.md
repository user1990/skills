# Skills

Agent skills for premium UI/UX work — a **design orchestrator** plus vendored specialists. One specialist per phase; smart zone preserved.

## Install

### Full pack (recommended)

Preserves sibling paths so the orchestrator resolves `../impeccable`, `../scrollcraft`, etc.

```bash
git clone https://github.com/user1990/skills.git
./scripts/install.sh
```

Or manually:

```bash
cp -R skills/design/* ~/.agents/skills/
```

### skills.sh (individual skills)

```bash
npx skills add user1990/skills
```

Pick `design` plus any specialists you want. For full orchestration, install the whole `skills/design/` tree as above.

## Usage

**Manual only.** Type `/design` to start the orchestrator. It does not auto-load when you mention UI, landing pages, or polish in normal coding sessions — so CashLift, pari-portfolio, MyDears, and similar repos keep using their own `.agents/skills/` without clash.

Describe what you want after invoking:

> `/design` new pricing landing, premium B2B vibe

The orchestrator classifies, picks one specialist per phase, verifies, and exits with next steps. See [skills/design/PACK.md](skills/design/PACK.md).

Explicit invoke also works: `/impeccable polish`, `/scrollcraft`, etc. — all pack skills are manual-only (`disable-model-invocation: true`).

## What's included

| Skill | Role |
| --- | --- |
| **design** | Orchestrator |
| **impeccable** | Full design OS (init, shape, polish, audit, …) |
| **design-taste-frontend** | Landing anti-slop |
| **stop-slop** | Copy anti-slop |
| **web-animation-design** | Product motion |
| **scrollcraft** | Scroll-as-timeline journeys |
| **prototype** | Throwaway UI/logic probes |

## Project files (not in this repo)

Each project you design gets:

- `PRODUCT.md` / `DESIGN.md` — design memory (via impeccable)
- `.agents/design-run.md` — orchestrator state between phases

## License

See [NOTICE.md](NOTICE.md) for upstream attributions. Specialist skills retain their original licenses.
