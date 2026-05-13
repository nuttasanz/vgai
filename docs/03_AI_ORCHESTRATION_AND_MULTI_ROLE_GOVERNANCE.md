---
part_of: VG-AI product vision (modular)
---

**Navigation:** [Overview](PRODUCT_VISION.md) ·
[01 Principles](01_PRODUCT_PRINCIPLES.md) ·
[02 Workflows](02_AI_MANAGED_WORKFLOW.md) ·
[03 Orchestration](03_AI_ORCHESTRATION_AND_MULTI_ROLE_GOVERNANCE.md) ·
[04 Tech stack & rules](04_TECH_STACK_AND_RULE_GENERATION.md) ·
[05 Verification](05_VERIFICATION_AND_RISK.md) ·
[06 Build & repair](06_BUILD_REPAIR_AND_STOP_CONDITIONS.md) ·
[07 Engineering judgment](07_ENGINEERING_THINKING_AND_JUDGMENT.md) ·
[08 Learning](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md) ·
[09 Adapters](09_AGENT_ADAPTERS_AND_FRAMEWORK_FILES.md) ·
[10 Platform](10_PRODUCTIZATION_AND_PLATFORM.md) ·
[11 Research](11_RESEARCH_POSITIONING.md) ·
[12 Chief](12_CHIEF_COMPARISON.md) ·
[13 Examples](13_EXAMPLES_AND_SCENARIOS.md) ·
[Glossary](14_GLOSSARY.md)

# AI Orchestration and Multi-Role Governance

This document describes how the framework **orchestrates and governs** AI work—including proposals from existing coding agents—using risk-based multi-role review. For the **eleven major product layers** (where orchestration sits in the overall architecture), see [01 Product Principles — Full-Scope Product Vision](01_PRODUCT_PRINCIPLES.md#full-scope-product-vision-eleven-major-product-layers).

---

## AI-Managed, Verification-Governed Operating Model

This full-scope product vision extends the framework-first idea into an **AI-managed, verification-governed operating model**. The product should not merely provide static framework files that a coding agent follows. At full maturity, the system should be able to use AI to generate, review, refine, and apply the workflow rules, project rules, technical rules, agent instructions, verification policies, reports, and learning artifacts needed for a new project.

The system should therefore support AI-managed autonomy, but this autonomy must be governed rather than blindly trusted. A single AI agent should not create rules, follow its own rules, verify itself, and then claim that the result is reliable. Instead, the system should use a **risk-based multi-role decision flow** in which AI roles may generate proposals, critique them, review risks, design rule scenarios, arbitrate final decisions, and collect evidence.

The operating principle is:

> AI may manage the workflow, but verification governs whether the workflow can be trusted.

This means the system may allow AI to:

- select an appropriate technology stack for a new project
- generate `AGENTS.md`, `CLAUDE.md`, project rules, workflow rules, and task rules
- review and criticize its own generated artifacts through separate AI roles
- classify rule confidence, enforcement level, and review status
- decide when to proceed autonomously under prototype assumptions
- run or request deterministic checks such as build, typecheck, lint, and tests
- repair implementation failures within a controlled budget
- stop when evidence shows further AI modification is unnecessary or risky
- produce trust/risk, failure, reflection, decision-log, and human-review artifacts
- propose rule updates based on observed project failures and learning evidence

However, the system must not treat AI-generated decisions as automatically correct. Every important AI-generated decision should be governed by some combination of:

- project evidence
- explicit assumptions
- alternative options considered
- rationale and trade-offs
- confidence level
- risk classification
- independent or role-separated AI critique
- deterministic check results where possible
- scenario tests for rules
- audit trail and rollback support
- human review flags for high-risk or uncertain decisions

## Risk-Based Multi-Role Governance

Not every workflow step requires multiple AI reviewers. Simple deterministic operations such as reading the file tree, detecting package scripts, running build commands, or collecting git diffs should rely primarily on tools and scripts. Low-risk summarization or report formatting may use a single AI role with template validation. Multi-role AI review should be reserved for decisions that can significantly affect the project direction, security posture, production readiness, or future agent behavior.

The framework should use **risk-based multi-role governance**:

- **Level 1: Deterministic-only** — file discovery, package parsing, git diff, build, lint, typecheck, tests, and other tool-observable evidence.
- **Level 2: Single AI with validation** — low-risk summaries, report drafts, log compression, and template filling.
- **Level 3: Multi-role AI review** — tech-stack selection, architecture decisions, rule generation, `AGENTS.md` / `CLAUDE.md` generation, security-sensitive changes, risk classification, repair strategy, stop-condition decisions, and final trust/risk reporting.

Possible AI roles include:

- **Product / Requirement Planner** — clarifies product goals, users, workflows, and acceptance criteria.
- **Tech Stack Recommender** — proposes a suitable stack based on requirements, learning needs, verification capability, and deployment assumptions.
- **Rule Generator** — creates candidate workflow, project, technical, security, testing, and learning rules.
- **Rule Critic** — challenges over-broad, unsupported, contradictory, or risky rules.
- **Security and Risk Reviewer** — focuses on authentication, authorization, sensitive data, deletion, secrets, migrations, and production-sensitive decisions.
- **Rule Scenario Designer** — creates examples of when a rule should trigger and when it should not.
- **Rule Arbiter** — classifies rules as active, warning, guided-question, human-review-trigger, rejected, or experimental.
- **Implementation Planner** — translates accepted rules and requirements into task plans.
- **Builder / Coding Agent** — implements approved changes through Claude Code, Codex, Cursor-like agents, or future coding agents.
- **Verifier** — evaluates build/test evidence, verification gates, and acceptance criteria.
- **Repair Agent** — proposes and applies controlled repairs when checks fail.
- **Stop-Condition Reviewer** — decides whether further AI modification is justified by evidence.
- **Reflection and Learning Agent** — produces engineering reflection, skill progression, and learning-path artifacts.

This multi-role model may be implemented in different ways: a single strong model prompted through separate roles, separate calls to the same model with isolated contexts, multiple cloud models, local LLMs for low-risk summarization and log compression, deterministic scripts for evidence, or an MCP/CLI orchestrator that coordinates these components.
