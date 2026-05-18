---
part_of: VG-AI product vision (modular)
---

**Navigation:**

- [Overview](PRODUCT_VISION.md)
- [01 Principles](01_PRODUCT_PRINCIPLES.md)
- [02 Workflows](02_AI_MANAGED_WORKFLOW.md)
- [03 Orchestration](03_AI_ORCHESTRATION_AND_MULTI_ROLE_GOVERNANCE.md)
- [04 Tech stack & rules](04_TECH_STACK_AND_RULE_GENERATION.md)
- [05 Verification](05_VERIFICATION_AND_RISK.md)
- [06 Build & repair](06_BUILD_REPAIR_AND_STOP_CONDITIONS.md)
- [07 Engineering judgment](07_ENGINEERING_THINKING_AND_JUDGMENT.md)
- [08 Learning](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md)
- [09 Adapters](09_AGENT_ADAPTERS_AND_FRAMEWORK_FILES.md)
- [10 Platform](10_PRODUCTIZATION_AND_PLATFORM.md)
- [11 Research](11_RESEARCH_POSITIONING.md)
- [12 Chief](12_CHIEF_COMPARISON.md)
- [13 Examples](13_EXAMPLES_AND_SCENARIOS.md)
- [Glossary](14_GLOSSARY.md)

# Agent Adapters and Framework Files

This file retains the opening framing from the original monolithic vision’s
combined “productization + platform” discussion, **scoped here** to **solo-first
adoption**, **project-local framework layout**, **agent compatibility modes**,
and **rule / instruction layers** that existing coding agents read and follow.
Git/PR workflow, CLI, optional web app, integrations, audit trail, roadmap, and
the high-level product diagram are in
[10 Productization and Platform](10_PRODUCTIZATION_AND_PLATFORM.md).

## Agent-facing framework surfaces (repository layout, compatibility, rules)

The following describes how the framework becomes **adoptable and governable
inside a repo** without implying that adapters _are_ the full platform: adapters
are how governed execution reaches **existing** agents.

The most important product shift is:

> The framework can work without a web app by using project-local files, agent
> instructions, skills, scripts, and reports. A web app can be added later as a
> dashboard or interface layer.

## Solo-First Framework Path

The first product version can be designed for one user: a developer who wants to
use Claude Code, Codex, or another AI coding agent more safely and
systematically.

A solo-first framework workflow may include:

1. Create a local project or open an existing repository
2. Run **`vgai init`** (optional agent slash alias: `/vgai-init`)
3. Add `AGENTS.md`, `CLAUDE.md`, workflows, rules, templates, and scripts
4. Start Claude Code, Codex, or another compatible coding agent
5. Ask the agent to follow the verification-gated framework
6. Review guided questions, acceptance criteria, and implementation plan
7. Approve the change risk level
8. Let the external agent edit code under framework rules
9. Run build/typecheck/lint/test scripts
10. Apply Build-and-Repair Loop and Stop Conditions
11. Generate Trust/Risk Report, Engineering Reflection Report, Human Review
    Handoff, Decision Log, and Skill Progression update
12. Continue with the next task suggested by Mentor Mode

This solo-first path should not require team accounts, organization policies, or
a full web platform in the beginning. Those can be added later after the core
framework proves useful for individual developers.

## Framework Package Structure

A framework-first product may be distributed as a project-local package such as:

```text
.vgai/
  core/
    trust-kernel/
      common/           ← TK-001..TK-018 universal governance rules
      typescript/       ← extends common/ with TS-specific rules
      python/           ← extends common/ with Python-specific rules

  hooks/
    hooks.json          ← event → script mapping
    scripts/
      pre-tool-use.js   ← acceptance-criteria check, scope guard
      post-tool-use.js  ← repair counter, observation append
      stop.js           ← observations flush, Reflector trigger
      session-start.js  ← trust-kernel loader

  observations.jsonl    ← append-only event log (universal data source)

  workflows/
    01-project-initiation.md
    02-requirement-analysis.md
    03-architecture-planning.md
    04-implementation.md
    05-build-and-repair.md
    06-verification-gates.md
    07-engineering-reflection.md

  skills/
    acceptance-criteria.md
    guided-verification-gate.md
    build-and-repair.md
    stop-condition.md
    trust-risk-report.md
    engineering-reflection.md
    human-review-handoff.md

  templates/
    project-brief-template.md
    acceptance-criteria-template.md
    assumption-log-template.md
    trust-risk-report-template.md
    engineering-reflection-template.md
    human-review-handoff-template.md
    failure-mode-report-template.md
    decision-log-template.md

  scripts/
    run-checks.sh
    summarize-diff.sh
    extract-errors.sh

AGENTS.md
CLAUDE.md
```

The framework files tell the external coding agent how to behave. The agent
still performs implementation, but the framework controls the process.

## Hook-Based Enforcement Layer

Instruction files such as `AGENTS.md` and `CLAUDE.md` tell the coding agent
what to do — but they rely on the agent reading and following them. Hooks
enforce framework rules mechanically, regardless of whether the agent checks
the instruction file in its current context window.

A hook fires at a specific lifecycle event and executes a script. The script
can block an operation, append an observation, or trigger a follow-up action.

The framework defines four enforcement hooks:

| Hook event | Enforcement action |
| --- | --- |
| **PreToolUse** (Edit / Write) | Block code modification if no acceptance criteria exist for the current task (TK-001) |
| **PostToolUse** (Edit / Write) | Increment repair iteration counter; block if counter exceeds 3 (TK-008) |
| **Stop** | Append session summary to `observations.jsonl`; trigger Reflector if task was non-trivial |
| **SessionStart** | Load `trust-kernel/common/` and the detected language layer into the agent's active context |

### observations.jsonl

Every PreToolUse, PostToolUse, and Stop event appends one line to
`.vgai/observations.jsonl`. Each entry records:

```json
{
  "timestamp": "2026-05-18T14:23:01Z",
  "event": "PostToolUse",
  "tool": "Edit",
  "file": "src/lib/auth.ts",
  "outcome": "success",
  "task_id": "task-042",
  "repair_iteration": 2
}
```

This event log is the **universal data source** for all framework artifacts.
Failure Mode Reports, Trust/Risk Reports, Engineering Reflection Reports, and
the Project Decision Log are all generated from evidence in
`observations.jsonl` rather than from the agent's working memory.

Hooks do not replace instruction files. `CLAUDE.md` and `AGENTS.md` convey
intent and context to the agent. Hooks enforce hard limits that the agent must
not be able to bypass through reasoning alone.

## Agent Compatibility Layer

The product should be designed to work with existing agentic coding tools. It
should not depend on one vendor or one agent.

Potential compatibility modes:

- `AGENTS.md` for general agent instructions
- `CLAUDE.md` for Claude Code compatibility
- Codex-compatible instruction files or skills
- command-line scripts for build/test/verification
- optional MCP tools for richer integration
- optional web dashboard for report viewing and skill progression

This allows the framework to operate in several modes:

1. **Framework-only mode**: project-local markdown rules, templates, and scripts
2. **Claude Code mode**: Claude Code reads `CLAUDE.md` and follows framework
   workflows
3. **Codex mode**: Codex reads `AGENTS.md` or Codex-specific skill instructions
4. **Companion mode**: user uses any coding agent, then runs the framework to
   verify diff/reports
5. **MCP / Tool Server mode**: external agents call framework tools such as
   `run_verification_gate()` or `check_stop_condition()`
6. **Web app mode**: a future interface layer for dashboard, reports, learning
   history, and configuration

## Core Rules, AI-Generated Rules, and Project Rules

The framework should separate rules into layers, but in the evolved full-scope
vision the AI may also generate and refine many of these rules. The important
distinction is that not all rules have the same authority. Some rules are part
of the minimal trust kernel, while other rules are AI-generated,
project-derived, task-specific, or learning-oriented.

### Trust Kernel Rules

Trust Kernel Rules are minimal meta-rules installed during **`vgai init`** (some
agent UIs may also expose an optional slash alias such as `/vgai-init`). They
govern AI autonomy and should exist before AI generates project-specific rules.
They are not detailed technical prescriptions. They are process-safety rules
that prevent blind trust in AI-generated outputs.

Examples:

- AI-generated rules are not trusted automatically.
- Every generated rule must include rationale, scope, risk, confidence, and
  examples.
- Do not implement before requirements and acceptance criteria exist.
- Do not silently invent missing requirements.
- Record assumptions when defaults are used.
- Classify risk before code modification.
- Run available build, typecheck, lint, and test checks after code changes.
- Continue repair only when verification evidence justifies it.
- Stop automated modification when stop conditions are met.
- Do not claim production readiness or security without evidence.

### AI-Generated Project Rules

For a new project, project rules should normally be generated after product
discovery and tech-stack decision. The AI may create candidate rules, but they
should pass through rule critique, risk review, scenario testing, and
arbitration before being used as active rules.

Examples after selecting a stack such as Next.js, TypeScript, Prisma, and
PostgreSQL:

```markdown
# Project AI Rules

- Use TypeScript for all new source files.
- Follow Next.js App Router conventions unless the project uses another routing
  model.
- Use Prisma for database access.
- Do not introduce a second ORM without justification.
- API routes and server actions that mutate protected data must enforce
  server-side authorization.
- Database schema changes are high risk and require migration and rollback notes
  where possible.
- Authentication and authorization changes require security review flags before
  production use.
- Run available build, typecheck, lint, and test checks after implementation.
```

### Rule Enforcement Levels

Rules should be classified by enforcement level:

- **Hard Rule** — blocks the workflow if violated, such as implementing before
  acceptance criteria exist.
- **Warning Rule** — reports a concern but does not automatically block, such as
  missing audit logging in an early prototype.
- **Guided Question Rule** — converts an uncertain technical or product decision
  into a guided question or autonomous default with an assumption log.
- **Human Review Trigger** — flags decisions that require senior, security,
  instructor, or production review before being treated as production-ready.
- **Experimental Rule** — used for learning or observation but not trusted as a
  strong engineering rule.
- **Rejected or Deprecated Rule** — not used because it was unsupported,
  over-broad, noisy, or contradicted project evidence.

### Generated Instruction Artifacts

The system may generate or update agent instruction files from the governed rule
registry:

```text
AGENTS.md
CLAUDE.md
.vgai/workflows/*.md
.vgai/skills/*.md
.vgai/rules/active-rules.md
.vgai/rules/warning-rules.md
.vgai/rules/guided-question-rules.md
.vgai/rules/human-review-triggers.md
```

These files should be reviewed by AI role critics or safety reviewers before use
because incorrect instruction files can cause the entire workflow to behave
incorrectly.

### Task Rules

Task-specific rules are generated from a user task as acceptance criteria. In
autonomous mode, AI may select safe prototype defaults when the user lacks
technical knowledge, but the system must record the assumptions, risks, and
confidence level.

Example:

```markdown
# Acceptance Criteria: Admin-only appointment deletion

- Admin can delete appointment.
- Normal user cannot delete appointment.
- Unauthenticated user receives 401.
- Non-admin user receives 403.
- Authorization must be checked at the API level.
- Build and typecheck must pass.
```

The user should be allowed to accept, edit, ask for explanation, or mark
uncertain items for human review. If the user does not know how to answer, the
system may choose a prototype default and record it as an AI-selected assumption
rather than silently treating it as a confirmed requirement.
