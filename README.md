# VG-AI

> **A framework-first, AI-managed, verification-governed software engineering
> workflow that orchestrates and governs existing AI coding agents.**

---

## What VG-AI is

VG-AI is a portable workflow framework that orchestrates and governs existing AI
coding agents — such as Claude Code, Codex, or Cursor-class tools — through
rules, workflows, skills, templates, scripts, verification gates, and learning
artifacts.

The framework helps less-experienced developers reduce blind trust in
AI-assisted development through:

- multi-role critique and AI-generated rule review
- deterministic evidence and verification gates
- controlled repair and stop conditions
- confidence labels and audit trails
- rollback support and diff preview
- engineering judgment scaffolding
- human review escalation

The core safe claim is:

> This product vision proposes a framework-first, AI-managed,
> verification-governed software engineering workflow that orchestrates and
> governs existing AI coding agents. It helps less-experienced developers reduce
> blind trust in AI-assisted development through multi-role critique,
> AI-generated rule review, deterministic evidence, verification gates,
> controlled repair, stop conditions, confidence labels, audit trails, rollback
> support, engineering judgment scaffolding, and human review escalation.

---

## What VG-AI is NOT

- Not a RAG chatbot
- Not a checklist app
- Not a prompt engineering demo
- Not a new AI coding agent built from scratch
- Not a replacement for Claude Code, Codex, Cursor, or other existing agents
- Not a replacement for senior engineers or security engineers
- Not a guarantee that AI-generated software is secure or production-ready

---

## Documentation

Start with the product vision overview, then read the key docs below.

| Document                                                                               | Description                                                   |
| -------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| [Product Vision](docs/agvi/en/PRODUCT_VISION.md)                                               | Overview, eleven major product layers, navigation index       |
| [01 Product Principles](docs/agvi/en/01_PRODUCT_PRINCIPLES.md)                                 | Scope, research concept, layers, problem, users, safe claims  |
| [02 AI-Managed Workflow](docs/agvi/en/02_AI_MANAGED_WORKFLOW.md)                               | Existing project workflow vs new project initialization       |
| [03 Orchestration & Governance](docs/agvi/en/03_AI_ORCHESTRATION_AND_MULTI_ROLE_GOVERNANCE.md) | Multi-role governance, AI roles, operating model              |
| [04 Tech Stack & Rules](docs/agvi/en/04_TECH_STACK_AND_RULE_GENERATION.md)                     | Tech stack decision, rule generation lifecycle, rule registry |
| [05 Verification & Risk](docs/agvi/en/05_VERIFICATION_AND_RISK.md)                             | Verification gates, risk-based approval, human review handoff |
| [06 Build, Repair & Stop](docs/agvi/en/06_BUILD_REPAIR_AND_STOP_CONDITIONS.md)                 | Build-and-repair loop, stop conditions, failure mode report   |
| [07 Engineering Judgment](docs/agvi/en/07_ENGINEERING_THINKING_AND_JUDGMENT.md)                | Critical thinking, judgment dimensions, AI skepticism         |
| [08 Learning & Skills](docs/agvi/en/08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md)           | Reflection reports, skill progression, mentor mode            |
| [09 Adapters & Framework Files](docs/agvi/en/09_AGENT_ADAPTERS_AND_FRAMEWORK_FILES.md)         | Agent compatibility, trust kernel, project rule layers        |
| [10 Productization & Platform](docs/agvi/en/10_PRODUCTIZATION_AND_PLATFORM.md)                 | CLI, Git/PR, web dashboard, roadmap                           |
| [11 Research](docs/agvi/en/11_RESEARCH_POSITIONING.md)                                         | Research contributions, questions, evaluation metrics         |
| [12 Chief Comparison](docs/agvi/en/12_CHIEF_COMPARISON.md)                                     | Relationship to Chief, compatibility mode sequence diagram    |
| [13 Examples & Scenarios](docs/agvi/en/13_EXAMPLES_AND_SCENARIOS.md)                           | Walkthrough scenarios and expected outputs                    |
| [Glossary](docs/agvi/en/14_GLOSSARY.md)                                                        | Definitions and cross-links                                   |
| [15 Concrete Examples](docs/agvi/en/15_CONCRETE_EXAMPLES.md)                                   | Trust Kernel v0.1 (18 rules), AGENTS.md, CLAUDE.md reference files           |

---

## CLI Quick Start

```bash
vgai init        # Install trust kernel, role contracts, workflow templates, and scripts
vgai discover    # Build product/project profile and codebase map
vgai plan        # Generate acceptance criteria, assumption log, and implementation plan
vgai run         # Execute task workflow through an existing coding agent
vgai verify      # Run verification gates and summarize evidence
vgai report      # Generate trust/risk, reflection, and handoff artifacts
```

> Agent slash-command alias: `/vgai-init` is supported as an optional alias for
> use inside agent command UIs.
