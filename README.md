# VG-AI

> Discipline + learning layer for junior–mid developers using AI coding agents.
> Turn vague prompts into production output **and** engineering judgment, in one
> workflow.

VG-AI is **not** a new AI agent, runtime, or platform. It is a small set of
rules, hooks, and slash commands that sit on top of existing agents (Claude
Code, Codex, Cursor) and force them to:

1. Ask before implementing — list Acceptance Criteria and risks
2. Get approval layer-by-layer
3. Explain decisions while building
4. Log decisions to `DECISION_LOG.md`
5. Reflect at task end with risk coverage check

The result: every task ships working code **and** teaches the user how a senior
engineer would think about it.

> Full vision doc:
> [`docs/agvi/en/00_WHAT_IS_VGAI.md`](docs/agvi/en/00_WHAT_IS_VGAI.md)
> (Thai original at
> [`docs/agvi/th/00_WHAT_IS_VGAI.md`](docs/agvi/th/00_WHAT_IS_VGAI.md) — treat
> as authoritative if the two drift). See also [README_TH.md](README_TH.md).

## Status

| Phase | Status | Description |
| --- | --- | --- |
| **P0 — Discipline Layer** | done | Rules, hooks, slash commands, decision log |
| **P1 — Chassis** | pending | Next.js + TS + Tailwind + env validation |
| **P2 — Data Layer** | pending | PostgreSQL + Drizzle + migrations |
| **P3 — Security Layer** | pending | NextAuth + protected routes + authz |
| **P4 — API Layer** | pending | Zod + error format + example endpoint + tests |
| **P5 — Ship Layer** | pending | Dockerfile + docker-compose + deploy guide |

The discipline layer in `template/` works **today** — you can apply it to any
project, regardless of the stack you pick.

## How to use the template

```bash
git clone <this-repo> my-project
cd my-project/template
# read CLAUDE.md, then in your Claude Code session:
#   /start-task <what you want to build>
```

What the template enforces:

- Acceptance Criteria stated **before** any `Edit`/`Write` (blocked by hook)
- Risk classification (Low/Medium/High) before implementation
- Reuse check (grep) before creating new code
- Risk enumeration for new API endpoints
- Decision log entry for every Medium/High decision
- Reflection report at task end (with 4-question risk coverage check)

See [`template/README.md`](template/README.md) for the full file layout and
explanation.

## Repo layout

| Path | What it is |
| --- | --- |
| `template/` | Drop-in P0 Discipline Layer for new projects |
| `docs/agvi/en/00_WHAT_IS_VGAI.md` | Vision + pitch + decisions (English) |
| `docs/agvi/th/00_WHAT_IS_VGAI.md` | Same, Thai (authoritative original) |
| `README.md` / `README_TH.md` | This file |

## What VG-AI is **not**

- Not a new AI coding agent
- Not a runtime or orchestrator
- Not a web platform or dashboard
- Not a CLI (no `vgai init` command — clone the template manually for now)
- Not a research project (use-it-yourself first; thesis deferred)

For the older, broader vision (multi-role governance, Trust Kernel v0.1,
dashboard, etc.) see `main` branch at commit `d425b77` or earlier.
