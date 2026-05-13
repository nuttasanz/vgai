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

# Product Vision (Overview)

This folder contains the **full-scope product vision** split into focused
documents. The product is **not** primarily a web app or a new coding agent: it
is a **portable, framework-first, AI-managed, verification-governed** workflow
system that **orchestrates and governs existing AI coding agents** (for example
Claude Code, Codex, or Cursor-class tools) through rules, workflows, skills,
templates, scripts, verification gates, and learning artifacts.

**Full product mode** emphasizes AI-managed project setup, stack and rule
generation, multi-role critique, and governed execution. **Chief compatibility
mode** emphasizes project-local agent instructions so experienced users can run
structured workflows with their existing agent.

The architecture is documented as **eleven major product layers** (the **major
product layers** model) in
[01 Product Principles](01_PRODUCT_PRINCIPLES.md#full-scope-product-vision-eleven-major-product-layers).

## Read next

| Document                                                                          | Contents                                                                                                                                                                                   |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [01 Product Principles](01_PRODUCT_PRINCIPLES.md)                                 | Scope note, research concept, **eleven major product layers**, problem/users, what the product is/is not, safe claims                                                                      |
| [02 AI-Managed Workflow](02_AI_MANAGED_WORKFLOW.md)                               | **Existing project / task workflow** vs **new project initialization**, overall workflow diagram                                                                                           |
| [03 Orchestration & Governance](03_AI_ORCHESTRATION_AND_MULTI_ROLE_GOVERNANCE.md) | AI-managed operating model, risk-based multi-role governance, AI roles                                                                                                                     |
| [04 Tech Stack & Rules](04_TECH_STACK_AND_RULE_GENERATION.md)                     | AI-generated rule lifecycle, rule metadata                                                                                                                                                 |
| [05 Verification & Risk](05_VERIFICATION_AND_RISK.md)                             | Guided gates, risk-based approval, human review handoff structure, verification dimensions, RAG role                                                                                       |
| [06 Build, Repair, Stop](06_BUILD_REPAIR_AND_STOP_CONDITIONS.md)                  | Build-and-repair, stop conditions, cost/token layer, versioning/diff/rollback, failure mode report                                                                                         |
| [07 Engineering Judgment](07_ENGINEERING_THINKING_AND_JUDGMENT.md)                | Critical thinking, problem framing, questioning, judgment dimensions (requirements through human review), AI skepticism, decision documentation                                            |
| [08 Learning & Skills](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md)           | Engineering reflection **report and questions**, project decision log template, rubric, skill progression, repeated reflection, mentor mode, post-task learning, learning sequence diagram |
| [09 Adapters & Framework Files](09_AGENT_ADAPTERS_AND_FRAMEWORK_FILES.md)         | Solo-first path, `.vgai` layout, agent compatibility, trust kernel and project rules                                                                                                       |
| [10 Productization & Platform](10_PRODUCTIZATION_AND_PLATFORM.md)                 | Git/PR, CLI, web dashboard, integrations, audit, secrets, reviewer, dashboard, team mode, roadmap                                                                                          |
| [11 Research](11_RESEARCH_POSITIONING.md)                                         | Contributions, research questions, evaluation metrics                                                                                                                                      |
| [12 Chief Comparison](12_CHIEF_COMPARISON.md)                                     | Relationship to Chief, **Chief compatibility mode** sequence diagram                                                                                                                       |
| [13 Examples & Scenarios](13_EXAMPLES_AND_SCENARIOS.md)                           | Chief-style and AI-managed clinic booking walkthroughs, expected outputs, extended use case                                                                                                |
| [14 Glossary](14_GLOSSARY.md)                                                     | Definitions and cross-links                                                                                                                                                                |

## One-line positioning

> **AI may manage the workflow, but verification governs whether the workflow
> can be trusted.**

The repository previously kept a single large vision file; that file is now
replaced by this `docs/` module plus a short pointer at the repository root.
