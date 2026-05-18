---
part_of: VG-AI product vision (modular)
---

**Navigation:** See [overview](PRODUCT_VISION.md)

# Concrete Examples and Reference Files

This document explains the ready-to-use reference files in the `examples/`
directory at the repository root. These files are the real artifacts that
`vgai init` copies into a user's project when the framework is installed.

---

## What lives in `examples/`

| File | What it is | Installed to |
| --- | --- | --- |
| `trust-kernel-v0.1.md` | 18 core governance rules | `.vgai/core/trust-kernel.md` |
| `AGENTS.md` | Agent instruction file (Codex/Cursor/general) | `AGENTS.md` (project root) |
| `CLAUDE.md` | Agent instruction file (Claude Code specific) | `CLAUDE.md` (project root) |

After installation, the user project contains these files. Any AI coding agent
opened in that project reads them and governs its behavior accordingly.

---

## How Trust Kernel rules work

Each rule has a YAML metadata block followed by a plain-English description.

```yaml
id: TK-001
name: No Implementation Without Acceptance Criteria
category: active
tier: trust-kernel
enforcement: block
```

**Fields:**

| Field | Values | Meaning |
| --- | --- | --- |
| `id` | TK-NNN | Unique identifier — stable across versions |
| `category` | active, warning, guided-question, human-review-trigger, experimental, rejected, deprecated | Rule registry category (see doc 04) |
| `tier` | trust-kernel, ai-generated, task | Priority tier — trust-kernel wins over all others |
| `enforcement` | block, escalate, warn, guide, log, note | What the agent must do when this rule is triggered |

**Enforcement levels:**

| Level | What the agent must do |
| --- | --- |
| `block` | Must not proceed until the condition is met |
| `escalate` | Must generate a Human Review Handoff Package and stop |
| `warn` | Must notify the user and log; may proceed with acknowledgement |
| `guide` | Must ask the specified question before continuing |
| `log` | Must write an entry to the specified artifact |
| `note` | Should acknowledge; no blocking action required |

---

## How AGENTS.md and CLAUDE.md work

Both files are markdown documents that AI agents read at startup to understand
how to behave in this project.

- **AGENTS.md** targets Codex CLI, Cursor, and agents that follow the
  OpenAI-compatible `AGENTS.md` convention.
- **CLAUDE.md** targets Claude Code specifically. It uses Claude Code's
  behavior model (slash commands, extended thinking invocations, artifact
  location conventions).

Both files reference `.vgai/core/trust-kernel.md` for the authoritative rule
list. AGENTS.md and CLAUDE.md contain summaries for quick reading — the Trust
Kernel is the source of truth.

**Key principle:** AGENTS.md and CLAUDE.md are generated outputs from the Trust
Kernel, not handwritten documents. When the Trust Kernel is updated, these files
must be regenerated (via `vgai init --update` in a future version).

---

## Relationship to the rule lifecycle (doc 04)

The rules in `trust-kernel-v0.1.md` were placed directly in the `active`
category — this is appropriate for the initial manual version.

In Full mode (the AI-managed workflow), rules go through the 11-step lifecycle
before entering the `active` category:

```
Trust Kernel → Discovery → Stack → Candidate Rules → Critique →
Security Review → Scenario Testing → Arbitration →
Instruction Generation → Enforcement → Update Loop
```

The `examples/` files represent what the system produces at the end of
**Instruction Generation** (step 9). For v0.1, they were written by hand to
give the framework a working starting point.

---

## How to read the clinic booking walkthrough alongside these files

See [doc 13](13_EXAMPLES_AND_SCENARIOS.md) for the step-by-step clinic booking
scenario. That scenario shows these files in action:

- Step 3 in the scenario: agent reads `AGENTS.md` / `CLAUDE.md` on startup
- Step 5: TK-002 (clarifying questions) triggers
- Step 7: TK-001 (no implementation before acceptance criteria) enforced
- Step 8: TK-009 (stop on no high-severity findings) terminates the loop
- Step 9: artifacts are written as specified in AGENTS.md artifact table

---

## Versioning

The Trust Kernel is versioned in its YAML front matter (`version: 0.1`).

Planned version increments:
- **0.1** — manual baseline, 18 rules, covers core workflow
- **0.2** — first AI-generated rule additions (post-MVP, phase 2)
- **1.0** — stable release after project validation on real use cases

The `examples/` files should be committed to the VG-AI repository and tagged
alongside framework releases. They are reference files, not user-edited files.

---

## What to update when adding a new rule

1. Add the rule to `examples/trust-kernel-v0.1.md` (or the current version file)
2. Update the summary table at the bottom of the Trust Kernel file
3. If the rule affects agent behavior, update the relevant section in
   `examples/AGENTS.md` and `examples/CLAUDE.md`
4. Increment the `total_rules` count in the Trust Kernel front matter
5. Update the `version` field if this is a release boundary
6. Update the Glossary (`14_GLOSSARY.md`) if any new terms are introduced
