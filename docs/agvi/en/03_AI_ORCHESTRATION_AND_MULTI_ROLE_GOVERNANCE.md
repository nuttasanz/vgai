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

# AI Orchestration and Multi-Role Governance

This document describes how the framework **orchestrates and governs** AI
work—including proposals from existing coding agents—using risk-based multi-role
review. For the **eleven major product layers** (where orchestration sits in the
overall architecture), see
[01 Product Principles — Full-Scope Product Vision](01_PRODUCT_PRINCIPLES.md#full-scope-product-vision-eleven-major-product-layers).

---

## AI-Managed, Verification-Governed Operating Model

This full-scope product vision extends the framework-first idea into an
**AI-managed, verification-governed operating model**. The product should not
merely provide static framework files that a coding agent follows. At full
maturity, the system should be able to use AI to generate, review, refine, and
apply the workflow rules, project rules, technical rules, agent instructions,
verification policies, reports, and learning artifacts needed for a new project.

The system should therefore support AI-managed autonomy, but this autonomy must
be governed rather than blindly trusted. A single AI agent should not create
rules, follow its own rules, verify itself, and then claim that the result is
reliable. Instead, the system should use a **risk-based multi-role decision
flow** in which AI roles may generate proposals, critique them, review risks,
design rule scenarios, arbitrate final decisions, and collect evidence.

The operating principle is:

> AI may manage the workflow, but verification governs whether the workflow can
> be trusted.

This means the system may allow AI to:

- select an appropriate technology stack for a new project
- generate `AGENTS.md`, `CLAUDE.md`, project rules, workflow rules, and task
  rules
- review and criticize its own generated artifacts through separate AI roles
- classify rule confidence, enforcement level, and review status
- decide when to proceed autonomously under prototype assumptions
- run or request deterministic checks such as build, typecheck, lint, and tests
- repair implementation failures within a controlled budget
- stop when evidence shows further AI modification is unnecessary or risky
- produce trust/risk, failure, reflection, decision-log, and human-review
  artifacts
- propose rule updates based on observed project failures and learning evidence

However, the system must not treat AI-generated decisions as automatically
correct. Every important AI-generated decision should be governed by some
combination of:

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

Not every workflow step requires multiple AI reviewers. Simple deterministic
operations such as reading the file tree, detecting package scripts, running
build commands, or collecting git diffs should rely primarily on tools and
scripts. Low-risk summarization or report formatting may use a single AI role
with template validation. Multi-role AI review should be reserved for decisions
that can significantly affect the project direction, security posture,
production readiness, or future agent behavior.

The framework should use **risk-based multi-role governance**:

- **Level 1: Deterministic-only** — file discovery, package parsing, git diff,
  build, lint, typecheck, tests, and other tool-observable evidence.
- **Level 2: Single AI with validation** — low-risk summaries, report drafts,
  log compression, and template filling.
- **Level 3: Multi-role AI review** — tech-stack selection, architecture
  decisions, rule generation, `AGENTS.md` / `CLAUDE.md` generation,
  security-sensitive changes, risk classification, repair strategy,
  stop-condition decisions, and final trust/risk reporting.

### Governance Level Selection

| Task risk level | Required governance level |
| --- | --- |
| Low | Level 1 for evidence collection; Level 2 for summary and reporting |
| Medium | Level 1 for evidence; Level 2 for summary; Level 3 if touching rules, architecture, or security decisions |
| High | Level 1 for evidence; Level 3 required for all decisions — no single-AI judgment allowed |
| Rule/framework changes | Level 3 always — regardless of file count |

Risk classification rubric: [doc 05 — Risk-Based Approval](05_VERIFICATION_AND_RISK.md#risk-based-approval)

### What "AI Role" Means

An **AI role** is a prompt template — a set of instructions that tells an LLM
to reason from a specific perspective and produce a specific type of output. A
role is not a separate AI service, separate API endpoint, or separate model
deployment. Two or more roles may share a single LLM call through a
multi-section prompt, where each section asks the model to reason from a
different viewpoint before producing a combined output.

The number of LLM calls is determined by the governance level, not by the
number of named roles. At Level 3, a single prompt may ask the model to first
generate a proposal, then critique it from a security perspective, then classify
the result — all within one call.

### Consolidated AI Role Groups

The framework defines **five role groups**. Within a group, sub-roles may be
combined into a single multi-section prompt or split into sequential calls when
role isolation requires independent context.

| Role group | Sub-roles included | Responsibility |
| --- | --- | --- |
| **Planner** | Product / Requirement Planner, Tech Stack Recommender, Implementation Planner | Clarify goals, select technology stack, and produce task plans before implementation begins |
| **Rule Workshop** | Rule Generator, Rule Critic, Security and Risk Reviewer, Rule Scenario Designer, Rule Arbiter | Generate candidate rules, critique them, add security perspective, create trigger scenarios, and classify each rule |
| **Builder** | Builder / Coding Agent | Implement approved changes through the existing coding agent (Claude Code, Codex, Cursor, or similar) |
| **Verifier** | Verifier, Repair Agent, Stop-Condition Reviewer | Evaluate verification gates, propose controlled repairs, and decide when to stop |
| **Reflector** | Reflection and Learning Agent | Produce engineering reflection, skill progression, and learning-path artifacts |

When governance Level 3 is required, the Rule Workshop may be split into two
sequential calls to preserve independence:

- **Generation call**: Rule Generator + Rule Arbiter — propose and classify rules
- **Critique call**: Rule Critic + Security and Risk Reviewer + Rule Scenario
  Designer — challenge, test, and validate rules from a separate context

The Builder role is always invoked as a separate call because it interacts with
an external coding agent tool rather than performing internal reasoning.

When critique must be independent (Level 3), the critique prompt should not
receive the full reasoning trace of the generation prompt in its context. The
goal is to detect flawed assumptions, not to validate a chain of reasoning the
model already agreed with.

This model may be implemented in different ways: a single model prompted through
separate role sections, sequential calls with isolated contexts, multiple cloud
models, local LLMs for low-risk summarization, deterministic scripts for
evidence collection, or an MCP/CLI orchestrator that coordinates these
components.
