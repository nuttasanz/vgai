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

# Productization and Platform

This document continues [09 Agent Adapters and Framework Files](09_AGENT_ADAPTERS_AND_FRAMEWORK_FILES.md) with **distribution and product surfaces**: Git/PR, CLI/TUI, optional web dashboard, integrations, governance-adjacent product features, phased roadmap, and the product vision diagram.

---

## Git and Pull Request Workflow

A product-ready version should eventually support Git-based development instead of only local patch files.

Possible flow:

```text
Connect or open repository
→ create AI working branch
→ analyze codebase
→ implement task using existing agent
→ run checks
→ generate diff
→ create pull request
→ attach verification report, trust/risk report, reflection report, and human review handoff
```

Potential outputs:

- branch name
- commit summary
- pull request summary
- affected files list
- verification evidence
- reviewer checklist
- unresolved risks
- learning report link

This feature should be treated as a product-beta or platform feature rather than a requirement for the first research prototype.

## CLI / TUI Layer

Before building a full web app, the product may include a CLI or TUI that helps initialize, run, and inspect the framework.

Example commands and skill entrypoints:

```bash
vgai init
vgai discover
vgai decide-stack
vgai generate-rules
vgai review-rules
vgai compile-rules
vgai plan
vgai run
vgai verify
vgai repair
vgai stop-check
vgai report
vgai reflect
vgai review-diff
```

The CLI does not need to be the coding agent. It can act as an orchestrator that prepares framework files, calls AI roles, routes work between local LLMs and stronger cloud models where appropriate, invokes existing coding agents such as Claude Code or Codex, runs deterministic scripts, collects evidence, and generates reports.

### Workflow Command Responsibilities

The commands should represent workflow boundaries, not merely shortcuts. For example:

- `vgai init` installs the trust kernel, workflow templates, AI role contracts, and scripts.
- `vgai discover` builds the project/product profile and codebase map.
- `vgai decide-stack` uses risk-based multi-role AI decision flow to select a technology stack for a new project.
- `vgai generate-rules` creates candidate workflow, project, technical, security, testing, production, and learning rules.
- `vgai review-rules` critiques and risk-reviews candidate rules.
- `vgai compile-rules` produces the rule registry and generated instruction artifacts such as `AGENTS.md` and `CLAUDE.md`.
- `vgai plan` produces acceptance criteria, assumption logs, impact analysis, risk classification, and implementation plan.
- `vgai run` executes the task workflow through an existing coding agent or compatible adapter.
- `vgai verify` runs verification gates and summarizes evidence.
- `vgai repair` applies the Build-and-Repair policy under budget and risk limits.
- `vgai stop-check` decides whether further AI modification is justified.
- `vgai report` generates Trust/Risk, Failure Mode, Human Review Handoff, and Decision Log artifacts.
- `vgai reflect` generates Engineering Reflection, Skill Progression, and learning-path artifacts.
- `vgai review-diff` reviews an existing diff created by any external AI coding agent.

## Optional Web App / Dashboard Layer

A web app can still be useful, but it should be positioned as an optional interface layer rather than the core product.

Possible web app responsibilities:

- report viewer
- skill progression dashboard
- learning history
- decision log browser
- project rules editor
- cost/token dashboard
- human review handoff viewer
- guided verification form

This allows the product to start framework-first and later become a richer platform.

## Integration Layer / Tool Connector Layer

A long-term product may connect with external software development tools such as:

- GitHub / GitLab
- issue trackers such as Jira, Linear, or GitHub Issues
- CI/CD systems
- static analysis tools
- dependency scanners
- security scanners
- documentation systems
- monitoring and observability tools
- communication tools such as Slack or email

The integration layer should be modular. The framework can start with local tools and scripts first, while product versions can add connectors later.

## Audit Trail and AI Governance

Because the AI agent reads code, modifies files, runs commands, and makes recommendations, the product should record an audit trail.

The audit trail should answer:

- What did the user ask?
- What framework rules were active?
- What project rules were accepted?
- What files did the AI read?
- What context was sent to the model?
- What model or model class was used?
- What files did the AI create, edit, or delete?
- What commands were run?
- What errors were observed?
- What repair attempts were made?
- Why did the AI continue, stop, or escalate?
- Who approved high-risk changes?
- What reports were generated?

This helps users understand and trust the system, and it supports debugging, review, governance, and future team adoption.

## Secret Detection and Sensitive Data Protection

A real product must protect user code and sensitive data. Uploaded projects or local repositories may contain secrets or private configuration files.

The system should include safeguards such as:

- detect `.env` files and warn the user
- detect API keys, tokens, and private credentials
- redact secrets before sending context to an LLM
- block unnecessary sensitive files from model prompts
- warn users before running unknown scripts
- avoid storing raw source code longer than necessary
- clean up sandbox workspaces after sessions if a sandbox is used
- allow users to delete session data and reports

This feature is especially important if the product later supports repository connections, cloud execution, or team use.

## Independent AI Review / Backstop Reviewer

The coding agent should not be the only judge of its own output. A stronger product can include an independent review step.

Possible flow:

```text
Coding Agent implements change
→ Build-and-Repair Loop runs
→ Independent Reviewer reviews diff, risks, tests, and verification evidence
→ Verification Gate Engine decides stop, continue, or human review
```

The independent reviewer may focus on:

- whether the implementation satisfies acceptance criteria
- whether the diff is too large or off-scope
- whether security-sensitive code was changed safely
- whether tests are missing
- whether stop conditions are appropriate
- whether human review is needed

This helps reduce self-confirmation by the coding agent and strengthens trust in the final report.

## Quality and Impact Dashboard

A product version should show whether the framework is actually helping the user.

Possible dashboard metrics:

- tasks completed
- build pass rate
- repair success rate
- average repair attempts
- stop decisions made
- high-risk changes blocked or escalated
- human review handoffs generated
- token usage per task
- estimated cost per task
- verification findings by category
- learning topics covered
- skill progression by engineering area

The dashboard should not certify that the user is a senior engineer or that the software is secure. It should provide learning and engineering evidence that helps the user understand progress and remaining gaps.

## Optional Team and Organization Mode

Although the product may begin as a solo tool, it can later support team use. Team mode should be optional and should not be required for the first version.

Possible future team features:

- team workspace
- project members and roles
- reviewer assignment
- shared project rules
- organization-level engineering policies
- team learning dashboard
- review history
- approval workflow
- shared decision log

This enables the product to evolve from a personal engineering mentor into a team-level AI-assisted software engineering platform.

## Product Roadmap

The full product vision can be organized into phases:

### Phase 1: Framework-First Solo Prototype

- local project initialization
- `AGENTS.md` / `CLAUDE.md`
- core rules
- project rules template
- guided verification gate template
- acceptance criteria template
- Build-and-Repair policy
- Stop Conditions policy
- Trust/Risk Report template
- Engineering Reflection Report template
- Human Review Handoff template
- scripts for build/typecheck/lint/test where possible

### Phase 2: Strong Solo Framework Product

- CLI / TUI helper
- diff summary
- rollback guidance
- decision log
- failure mode report
- cost/token tracking
- basic skill progression map
- mentor mode
- secret detection warnings
- companion verification for diffs created by any AI coding agent

### Phase 3: Agent Integration Product Beta

- Claude Code compatibility package
- Codex compatibility package
- optional MCP server
- stronger project rules and policy configuration
- independent AI reviewer
- Git branch / pull request workflow
- report viewer or lightweight dashboard

### Phase 4: Platform Expansion

- full web app dashboard
- team workspace
- organization policies
- integrations with issue trackers and CI/CD
- advanced security scanning
- advanced model routing
- enterprise governance
- shared learning and review dashboards

The first research implementation should be selected from this roadmap later. The current document intentionally keeps the full product direction visible.

## Product Vision Diagram

```mermaid
flowchart LR

    A[Solo Developer / Less-Experienced Developer] --> B[Verification-Gated AI Software Engineering Framework]

    B --> C[Framework Core Layer]
    B --> D[Requirement and Planning Layer]
    B --> E[Agent Execution / Adapter Layer]
    B --> F[Build-and-Repair Layer]
    B --> G[Verification and Risk Layer]
    B --> H[Cost and Token Optimization Layer]
    B --> I[Judgment + Learning Layers]
    B --> J[Productization and Platform Layer]

    C --> C1[Core Rules]
    C --> C2[Workflows]
    C --> C3[Skills]
    C --> C4[Templates]

    D --> D1[Guided Verification]
    D --> D2[Acceptance Criteria]
    D --> D3[Assumption Log]

    E --> E1[Claude Code]
    E --> E2[Codex]
    E --> E3[Other Agents]
    E --> E4[MCP / CLI / Scripts]

    F --> F1[Build / Test / Lint / Typecheck]
    F --> F2[Controlled Repair]
    F --> F3[Failure Mode Report]

    G --> G1[Verification Gates]
    G --> G2[Stop Conditions]
    G --> G3[Human Review Handoff]

    H --> H1[Context Retrieval]
    H --> H2[Caching]
    H --> H3[Model Routing]
    H --> H4[Token Budget]

    I --> I1[Judgment habits (07)]
    I --> I2[Reflection artifacts (08)]
    I --> I3[Skills & mentor (08)]

    J --> J1[Git / PR Workflow]
    J --> J2[CLI / TUI]
    J --> J3[Optional Web App]
    J --> J4[Audit Trail]
    J --> J5[Secret Protection]
    J --> J6[Independent Reviewer]
    J --> J7[Quality Dashboard]
```
