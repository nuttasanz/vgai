---
part_of: VG-AI product vision (modular)
status: current understanding as of 2026-05-18 — supersedes earlier framing
implementation_status: P0 (Discipline Layer) — done — see `template/`
---

# What is VG-AI

This document is the **source of truth for VG-AI**, distilled from the
2026-05-18 conversation and the major scope pivot (docs 01-14 of the previous
vision were deleted on branch `pivot/p0-discipline`).

> The original (and currently more detailed) version of this document lives at
> [`docs/agvi/th/00_WHAT_IS_VGAI.md`](../th/00_WHAT_IS_VGAI.md). If the two
> drift, treat the Thai version as authoritative until this note is removed.

---

## In one sentence

VG-AI helps **junior-mid developers** ship production-quality code with AI
without needing senior-level knowledge up front — and gradually trains them to
think like a senior engineer through every task.

**One sentence more (the 2026-05-18 insight):**

VG-AI turns a junior's vague prompt (e.g. *"help me set up a template for a new
project"*) into **production output + senior-style learning** in the same
step — artifact × lesson, produced together, not as two separate phases.

## Who the user is

A developer who:

- Uses an AI coding tool (Claude Code, Codex, Cursor) on real work
- Wants to ship a real product, not throwaway prototypes
- Doesn't yet have deep knowledge to constrain the AI on their own
- Wants every task to double as engineering-judgment practice

The first user is the project owner — currently building a **badminton court
booking system** as the first case study.

## The 3 problems VG-AI solves

What the user hits when "vibe-coding" with AI:

1. **AI is inconsistent** — writes an error/response format, then doesn't reuse
   it; creates new functions even when an existing one fits.
2. **AI contradicts itself** — first time it says approach 1 is best; ask again
   and it says approach 2 is better. No decision log tied to evidence.
3. **The user lacks knowledge to constrain the AI** — doesn't know what risks
   exist, doesn't know what to ask, can't tell whether the AI's output is right
   or wrong.

## How VG-AI works (the core insight)

A junior dev's prompt is usually vague: *"build X"*, *"make Y better"*.

Raw AI → guesses intent → builds against that guess → output may miss the real
need + the user learns nothing.

AI + VG-AI → forced to:

1. **Ask before implementing** — list options + recommended option + reasoning
   (the user sees the trade-off)
2. **Get approval layer-by-layer** — the user decides, not the AI's guess
3. **Explain while building** — every decision carries a rationale (the user
   learns)
4. **Log decisions** — `DECISION_LOG.md` keeps references and stops the AI from
   contradicting itself
5. **Reflect at the end** — `/reflect` distills what the user should take away

Net result: at the end of a task = working code **and** the user understands
why it was built that way.

## What VG-AI is NOT

- ❌ Not a new AI
- ❌ Not a new coding agent
- ❌ Not a new runtime / orchestrator
- ❌ Not a web platform / dashboard
- ❌ Not a master's thesis (for now) — use-it-yourself first

## What VG-AI IS (the real thing — P0 implemented)

A set of files that sits on top of Claude Code (and Codex via AGENTS.md)
inside a repo. See `template/` in this repo for the actual implementation.

**Discipline Layer (universal — stack-agnostic):**

1. **`CLAUDE.md`** — 16 rules (R1-R16) split into 3 buckets:
   - R1-R4: mechanical rules (build/typecheck/test must pass)
   - R5-R14: process rules (AC before code, classify risk, reuse check, list
     API risks, scope guard, log assumption, log decision, repair budget = 3)
   - R15-R16: governance of technical rules (level 3 must carry a `Source:` —
     no guessing)
2. **`AGENTS.md`** — a subset of CLAUDE.md for Codex/Cursor
3. **`.claude/settings.json` + `.claude/hooks/check-acceptance-criteria.sh`** —
   a bash hook that blocks Edit/Write/MultiEdit if no "Acceptance Criteria"
   marker is found in the transcript
4. **3 slash commands:**
   - `/start-task` — gather AC, classify risk, reuse check, list API risks,
     plan
   - `/reflect` — produce a reflection report with 4-question risk coverage +
     engineering lessons
   - `/log-decision` — append an entry to `DECISION_LOG.md`
5. **`DECISION_LOG.md`** — engineering decisions + rationale + alternatives +
   source
6. **`OPEN_QUESTIONS.md`** — unconfirmed assumptions waiting for review

**Stack-specific Layer (added when a stack is picked):**

- `CLAUDE.<stack>.md` (e.g. `CLAUDE.nextjs.md`) — technical rules specific to
  framework / ORM / etc.
- Added later when a stack is chosen; the main template stays stack-neutral.

Install: clone template → `pnpm install` → start work via `/start-task`.

> A future `vgai init` CLI will scaffold this automatically. For now, clone
> the template.

## A real example

**User:** *"Help me build the cancel-booking API."*

**AI** (constrained by `CLAUDE.md`, must reply before writing code):

> Before I write anything, let me list the risks:
> - Who can call `/cancel-booking?id=123`? → should be the booking owner only.
> - What if someone else calls it? → **they could delete another user's
>   booking.** Ownership must be checked on the server.
> - What about bad input (non-existent id / wrong format)? → return 404 / 400.
> - Two concurrent requests? → use a DB transaction.
>
> Acceptance criteria:
> 1. Booking owner can cancel their own booking
> 2. Other users hitting the endpoint get 403
> 3. Unauthenticated requests get 401
> 4. Non-existent id returns 404
>
> OK to start?

**User:** sees the risks without ever having studied OWASP → "approve."

**AI:** writes code → runs build/typecheck/test → reports with diff.

**User:** runs `/reflect` → AI summarizes the task and points out risks still
uncovered → the user picks up the pattern a senior would have thought through.

The user doesn't need to know "Broken Access Control" beforehand. The AI
already does. VG-AI just forces the AI to **tell** the user every time.

## Rule Trust Hierarchy in CLAUDE.md

This answers the question *"how can I trust a CLAUDE.md the AI wrote?"*

| Level | Example | Verified by | Prerequisite |
| --- | --- | --- | --- |
| **1 — mechanical** | `npm run build` must pass, typecheck must pass, previously-green tests must not break | the machine (exit codes) | nothing — the machine checks |
| **2 — process** | write AC before code, grep before creating a new function, list risks before writing an API | the user's eyes (reading chat/diff) | nothing — the user can see whether the AI followed it |
| **3 — technical** | "check authorization on the server", "hash passwords with bcrypt rounds ≥ 12" | OWASP / official docs / ≥3 AIs agreeing | each rule needs a `Source:` comment; no source = don't include it |

**Golden rule:** start `CLAUDE.md` with only level 1+2 rules — the user can
verify those without being a senior engineer.

Level 3 is added later, when a real pain shows up in the project AND has been
cross-checked against trustworthy sources. Every level-3 rule must carry a
source.

## Handling what the user doesn't know (Unknown Unknowns)

The user doesn't need to know every risk before adopting VG-AI. The mechanisms
that surface risks automatically:

1. **Process rules force the AI to enumerate risks** — e.g. "before writing a
   new API, list who can call it and what happens if the wrong person does."
2. **Hooks enforce those rules** — not just "please do this," but blocked-at-
   the-tool-call.
3. **Reflection reports catch gaps after the task** — the AI re-reads the diff
   and lists risks the plan missed.
4. **`OPEN_QUESTIONS.md`** — uncertain risks get logged → reviewed before
   launch.
5. **Invest once in foundational knowledge** — read OWASP Top 10 (~2 hours),
   memorize the categories, not the details.

The **non-removable** part: before launching to real customers, hold one
session with someone who knows the domain (a senior friend, community,
consultant) and have them review `CLAUDE.md` + key diffs + `OPEN_QUESTIONS.md`.

VG-AI doesn't drive the required knowledge to zero. It drops it from
"senior-level" to "junior + 2 hours of OWASP + use AI to surface risks."

## Stack Flexibility (DEC-006)

VG-AI is **not tied to a stack**. The universal layer (`CLAUDE.md` +
`AGENTS.md` + hooks + slash commands) works on any stack, because every rule
is about process, not stack-specific technique.

Stack-specific rules live in a separate file:

| Stack | Extra file | Status |
| --- | --- | --- |
| Next.js + TypeScript + Drizzle + NextAuth | `CLAUDE.nextjs.md` | will be built in P1-P4 |
| Python + FastAPI + SQLAlchemy | `CLAUDE.python.md` | future |
| Go + Echo/Gin | `CLAUDE.go.md` | future |

The current template assumes the Next.js stack (chosen for the user's first
project), but the universal layer is reusable as-is.

## Out of scope (for now)

Removed from the original vision:

- ❌ Custom runtime / orchestrator
- ❌ Web dashboard
- ❌ Full MCP server
- ❌ 18 Trust Kernel rules from day one (starting with ~8 verifiable rules)
- ❌ 5 role groups as separate primitives (use Claude Code sub-agents)
- ❌ Full `observations.jsonl` ecosystem (start with git diff + reflection)
- ❌ Multi-tier workflow (Tier 0/1/2) — one flow first
- ❌ Formal Skill Progression Map / Mentor Mode — reflection reports are enough
- ❌ Framing as a research project — use it ourselves first; case study later

These may come back later. Not now.

## Kept from the original vision (still useful)

- ✅ Verification gates concept (old doc 05) — now a checklist in `CLAUDE.md`
- ✅ Build-and-repair stop conditions (old doc 06) — now the hook script
- ✅ Engineering judgment principles (old doc 07) — now `/reflect` prompts
- ✅ Reflection report structure (old doc 08) — now the `/reflect` template
- ✅ Rule trust hierarchy (this doc, the updated form of old doc 04) — the
  golden rule

## Current status

- **Phase:** P0 done — Discipline Layer ready in `template/`
- **Next phases:**
  - P1 — Chassis (Next.js + TS + Tailwind + env validation)
  - P2 — Data Layer (Drizzle + PostgreSQL + migrations)
  - P3 — Security Layer (NextAuth + protected routes + authz pattern)
  - P4 — API Layer (Zod + error format + example endpoint + tests)
  - P5 — Ship Layer (Dockerfile + docker-compose + deploy guide)
- **Validation horizon:** use the template to build real features for the
  badminton booking system → record what's missing → revise the vision from
  evidence.
- **Thesis:** deferred — get it working and useful first; consider publishing
  later.

---

## Related documents and files

| If you want... | See |
| --- | --- |
| Pitch + scope + insight (this doc) | `docs/agvi/en/00_WHAT_IS_VGAI.md` |
| The original / more detailed Thai version | `docs/agvi/th/00_WHAT_IS_VGAI.md` |
| The template in practice | `template/README.md` |
| The R1-R16 rules the AI must follow | `template/CLAUDE.md` |
| Subset for Codex/Cursor | `template/AGENTS.md` |
| Engineering decisions + rationale | `template/DECISION_LOG.md` |
| Pending assumptions | `template/OPEN_QUESTIONS.md` |
| Hook script that blocks Edit/Write | `template/.claude/hooks/check-acceptance-criteria.sh` |
| Slash commands | `template/.claude/commands/{start-task,reflect,log-decision}.md` |

> The older vision (runtime, multi-role, 18-rule Trust Kernel, dashboard) was
> cut in this pivot. See git history on branch `main` (commit `d425b77` —
> pre-pivot).
