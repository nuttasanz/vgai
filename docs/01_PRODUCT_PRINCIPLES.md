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

# Product Principles

This document is maintained as a **full-scope product vision** for a **framework-first verification-gated AI software engineering product**. It intentionally includes a broader set of capabilities than what may be implemented in the first master's independent study prototype.

The key architectural shift in this version is:

> The core product is not primarily a web app and not a new AI coding agent. The core product is a portable workflow framework that can guide existing agentic coding tools such as Claude Code, Codex, Cursor-like agents, or future AI coding agents.

The framework may later have a web app, dashboard, CLI, MCP server, or team platform, but the first-class product concept is:

> rules + workflows + skills + templates + scripts + verification gates + learning artifacts.

The purpose of this full-scope version is to keep the long-term product direction clear: the system should begin as a tool/framework that the researcher can use personally as a solo developer, and later evolve into a product that can support other less-experienced developers, students, instructors, mentors, and small software teams.

The final research implementation scope will be selected later. Not every capability in this document must be implemented in the first research prototype. Capabilities may be classified later as:

- Core research prototype
- Framework-first solo tool
- CLI / TUI extension
- MCP / agent adapter extension
- Web app or dashboard feature
- Product beta feature
- Platform feature
- Future work

The long-term product vision is:

> An **AI-managed, verification-governed AI software engineering framework** that helps less-experienced developers plan, build, verify, repair, review, learn from, and govern AI-assisted web application development using existing AI coding agents and AI-orchestrated workflow roles.

In this evolved full-scope vision, the AI may manage the workflow end-to-end, including tech-stack recommendation, rule generation, project-specific instruction creation, implementation planning, code editing through existing agents, verification, repair, reporting, reflection, and rule updates. However, AI outputs are not trusted by default. They become more trustworthy through multi-role critique, deterministic checks, evidence collection, rule testing, confidence labeling, stop conditions, audit trails, rollback support, and human review escalation for high-risk or unresolved decisions.

The product should not only generate code. It should also generate evidence, explanations, verification results, risk reports, decision logs, learning artifacts, rule updates, guided questions, and review handoff materials.

# Research Concept

My research project is about developing a structured AI-assisted software development workflow for less-experienced developers who want to use LLMs or AI coding agents to build web application projects, but do not yet have enough senior-level judgment to reliably validate AI-generated design, code, security decisions, and production readiness.

The goal is not to replace senior engineers, software architects, or security engineers. The goal is to help junior-to-mid-level developers use AI more safely and systematically by embedding verification gates into the AI-assisted development workflow.

The core idea is:

AI can suggest and help build, but the system must verify before the user trusts or continues.

In addition, when the system is used as an AI coding agent, it should not stop after generating or modifying code. It should include a Build-and-Repair Loop that runs build, lint, typecheck, and tests where possible, observes errors, attempts controlled repairs, and reports unresolved issues that require human review.

The Build-and-Repair Loop must also include explicit Stop Conditions. The AI should not keep reviewing, refactoring, or modifying code simply because more improvements are possible. Additional repair should only happen when there is verification evidence such as failed build, failed tests, unmet requirements, high-risk security findings, or unresolved verification gate failures. When required checks pass and remaining findings are low-severity or optional, the system should stop automated repair and report that no further AI modification is recommended.

Because an AI coding agent may need to read repository context, generate plans, modify code, run checks, repair errors, and produce reports across multiple iterations, the system should also include a Cost and Token Optimization Layer. This layer helps reduce unnecessary LLM calls and excessive context usage by selecting task-relevant files, reusing cached summaries, compressing error logs, using diff-based repair context, applying model routing where appropriate, and enforcing repair budgets together with Stop Conditions. The goal is not only to reduce cost, but also to help the agent focus on the most relevant context and avoid unnecessary code changes.

The system should also include an **Engineering Thinking and Judgment Layer** and a **Learning, Reflection, and Skill Development Layer** that work together under the same AI-managed, verification-governed umbrella. The judgment layer emphasizes how users reason about problems, requirements, assumptions, trade-offs, risks, verification evidence, security, system impact, stop/continue decisions, human review needs, and appropriate skepticism toward AI outputs. The learning layer turns each AI-assisted development session into structured artifacts—reflection reports, guided questions, skill progression, mentor-style prompts, and learning paths—that explain the AI's project understanding, implementation rationale, engineering trade-offs, verification evidence, stop decisions, remaining risks, and suggested next study topics. The goal is not to claim that the system can automatically turn a junior developer into a senior engineer, but to scaffold the development of senior-like software engineering judgment through repeated, structured practice.

# Full-Scope Product Vision (eleven major product layers)

The full product vision is a **framework-first verification-gated AI software engineering platform**. The framework can be used with existing agentic coding tools rather than requiring the researcher to build a new agentic AI from scratch.

The initial user may be a solo developer using Claude Code, Codex, or another coding agent inside their own project. The framework should guide that agent through structured software engineering workflows: requirement analysis, acceptance criteria, planning, implementation, verification, repair, stop decisions, trust/risk reporting, and engineering reflection.

A web app may still exist in the long-term product roadmap, but it should be treated as an **interface layer** rather than the core product. The core product is the framework that defines how AI coding agents should behave and how users should learn from the process.

At full scope, the system has **eleven major product layers** (the **major product layers** model):

1. **AI Orchestration and Rule Governance Layer**
   - minimal trust kernel
   - AI role contracts
   - risk-based multi-role decision flow
   - AI-generated rule lifecycle
   - rule critique and arbitration
   - rule scenario testing
   - confidence labeling
   - rule registry
   - model routing between local LLMs, cloud models, existing coding agents, and deterministic tools

2. **Framework Core Layer**
   - core workflow principles
   - trust kernel rules
   - agent instructions
   - workflow definitions
   - verification policies
   - repair policies
   - stop conditions
   - report templates
   - reusable skills

3. **Requirement, Product Discovery, and Planning Layer**
   - product discovery for new projects
   - requirement analysis
   - missing information detection
   - guided verification questions
   - assumption logging
   - acceptance criteria generation
   - task breakdown
   - architecture and impact analysis

4. **Tech Stack and Project Rule Generation Layer**
   - AI-managed technology stack recommendation
   - alternative stack comparison
   - tech-stack decision record
   - stack-aware project rules
   - generated `AGENTS.md` and `CLAUDE.md`
   - generated workflow, security, testing, production, and learning rules
   - rule review, rule testing, and rule enforcement classification

5. **Agent Execution / Adapter Layer**
   - integration with existing AI coding agents
   - Claude Code compatible instructions
   - Codex compatible instructions
   - AGENTS.md / CLAUDE.md workflow guidance
   - optional MCP tools
   - optional CLI commands
   - optional web UI or dashboard

6. **Build-and-Repair Layer**
   - build, lint, typecheck, and test execution
   - error-log analysis
   - controlled repair attempts
   - repair budget enforcement
   - failure mode reporting

7. **Verification and Risk Layer**
   - requirement and architecture verification
   - guided gate decisions for less-experienced users
   - security review
   - code quality and maintainability review
   - production readiness review
   - stop conditions
   - human review handoff

8. **Cost and Token Optimization Layer**
   - codebase map
   - selective context retrieval
   - cached summaries
   - compressed error logs
   - diff-based repair context
   - local LLM support for low-risk summarization
   - model routing where possible
   - token and repair budgets

9. **Engineering Thinking and Judgment Layer**
   - critical thinking, problem framing, and disciplined questioning
   - engineering judgment: requirement thinking, assumption management, trade-off reasoning, risk thinking, verification thinking, security thinking, and system impact thinking
   - stop/continue judgment, human-review thinking, calibrated AI skepticism, and escalation judgment grounded in evidence—not model tone
   - decision documentation habits that connect intent, alternatives, and unresolved risks (see [07 Engineering Thinking and Judgment](07_ENGINEERING_THINKING_AND_JUDGMENT.md))

10. **Learning, Reflection, and Skill Development Layer**
   - engineering reflection reports, reflection question sets, repeated reflection and post-task learning workflows
   - mentor mode, skill progression map, suggested learning paths, and learning-oriented prompts that reuse verification and repair evidence
   - makes judgment practice repeatable without collapsing “thinking” into “logging output” (see [08 Learning, Reflection, and Skill Development](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md))

11. **Productization and Platform Layer**
   - framework package distribution and solo-first usage flow
   - CLI / TUI assistant and MCP / tool server mode
   - optional web app or dashboard
   - Git and pull request workflow
   - integration layer
   - audit trail and AI governance
   - secret and sensitive data protection
   - independent AI review/backstop reviewer
   - quality and impact dashboard
   - optional team or organization mode

The product should start from a **solo-first framework workflow** because the first real user may be the researcher. The early product should help one developer initialize the framework in a project, use an existing AI coding agent, verify the result, learn from the session, and gradually improve their software engineering judgment. Team, organization, and web platform features should be treated as later expansion rather than a requirement for the first version.

# Main Problem

Less-experienced developers can now use AI to generate architecture, tech stack decisions, task plans, and code quickly. However, they may not know whether:

- AI skipped important requirements
- AI recommended an unsuitable architecture
- AI missed security controls
- AI-generated code has security or quality risks
- AI-generated implementation may fail to build, run, or pass tests
- AI may continue reviewing, refactoring, or modifying code unnecessarily, causing over-repair or regression
- AI-assisted implementation may require repeated model calls, large repository context, long error logs, and multiple repair attempts, causing high token usage, cost, latency, and context noise
- users may finish a task without understanding why AI made certain engineering decisions
- users may not know the senior-level questions they should ask about trade-offs, long-term maintainability, production risk, observability, testing strategy, and system impact
- users may not have a structured way to track their growth from task-level coding toward broader software engineering judgment
- the project is actually production-ready
- the AI answer is overconfident or incomplete
- human or senior review is required

Therefore, this research asks:

How can a structured AI-assisted development workflow with verification gates help less-experienced developers build web applications more systematically while reducing blind trust in AI-generated outputs?

# Target Users

The main users are:

- Junior developers
- Mid-level developers
- Computer Engineering / Software Engineering students
- Developers who can code but are not confident in system design, secure software development, code quality review, and production readiness review

# What This Project Is

This project is:

- An **AI-managed, verification-governed software engineering framework**
- A framework-first AI-assisted software engineering workflow
- A Chief-inspired structured workflow for less-experienced developers
- A portable framework that can guide existing agentic coding tools such as Claude Code, Codex, Cursor-like agents, or future coding agents
- An AI orchestration approach that may generate technology-stack decisions, project rules, agent instructions, verification policies, and learning artifacts under governance
- A rule-governance system where AI-generated rules are reviewed, criticized, scenario-tested, confidence-labeled, and classified before enforcement
- A collection of rules, workflows, skills, templates, scripts, reports, and optional tool integrations
- A system that helps users move from requirement to architecture, task planning, implementation, verification, trust/risk reporting, and learning feedback
- A verification-gated development assistant
- A workflow harness that can make AI coding agents operate under clear engineering rules
- A Build-and-Repair Loop that checks whether AI-generated code can build, run, or pass tests where possible
- A controlled repair mechanism with explicit Stop Conditions to prevent unnecessary AI-driven changes, over-refactoring, or regression
- A Guided Verification Gate approach that helps less-experienced users answer difficult engineering questions through defaults, explanations, choices, assumption logs, and human review recommendations
- A cost-aware and token-efficient orchestration layer that manages repository context, model calls, cached summaries, error-log compression, diff-based repair context, and repair budgets
- An **Engineering Thinking and Judgment Layer** that trains critical thinking, problem framing, disciplined questioning, requirement and assumption reasoning, trade-off and risk reasoning, verification and security reasoning, system impact reasoning, stop/continue and human-review judgment, calibrated AI skepticism, and structured decision documentation
- An Engineering Reflection Report that explains AI decisions, files changed, trade-offs, verification evidence, repair history, stop decisions, remaining risks, and recommended learning topics
- A Skill Progression Map that tracks the user's exposure to software engineering skill areas such as requirement analysis, architecture, security, testing, maintainability, production readiness, observability, and risk-based decision making
- A Repeated Reflection workflow that asks users to reason before and after AI feedback so they actively practice engineering judgment instead of passively accepting AI output
- A Mentor Mode that guides users through hints, questions, explanations, and progressive disclosure rather than only giving final answers
- Acceptance Criteria Generation that defines task completion before implementation begins
- Risk-Based Approval that separates low-, medium-, and high-risk AI code changes before applying them
- Versioning, Diff Preview, and Rollback support to prevent uncontrolled AI modifications from damaging the original project
- A Human Review Handoff Package that helps users ask senior engineers, instructors, or security reviewers focused review questions
- A Failure Mode Report that explains why automated implementation or repair stopped and what should be inspected next
- A Project Decision Log that records engineering decisions, alternatives, trade-offs, and unresolved risks
- A solo-first product vision that can begin as a local framework used by one developer and later evolve into CLI, MCP, web app, dashboard, or team platform forms
- A product vision that can integrate with Git, pull requests, project rules, audit trails, secret protection, independent AI review, and quality dashboards over time
- A learning scaffold that helps developers learn how to think more like software engineers

# What This Project Is Not

This project is not:

- Only a RAG chatbot
- Only a checklist app
- Only a prompt engineering demo
- Only a web app
- A requirement to build a new agentic AI from scratch
- A replacement for Claude Code, Codex, Cursor, or other AI coding agents
- A replacement for senior engineers
- A replacement for security engineers
- A full autonomous coding agent that can be trusted without verification
- A single self-confirming AI loop where one agent creates rules, follows them, verifies itself, and claims trust without critique or evidence
- A guarantee that the generated software is secure or production-ready
- A new LLM or fine-tuned model project
- A claim that the user will automatically become a senior engineer by using the tool
- A claim that skill progression metrics are professional certification
- A product that must start with team accounts, enterprise governance, or a full web platform

The intended direction is framework-first:

> Existing AI coding agents perform implementation. This framework defines how those agents should plan, verify, repair, stop, report, and teach.

For comparison with Chief and **Chief compatibility mode**, see [12 Chief Comparison](12_CHIEF_COMPARISON.md).

# Safe Claim

This research and product vision do not claim that the framework guarantees correct, secure, or production-ready software.

The safe claim is:

> This research proposes a framework-first, verification-gated AI-assisted software development workflow that can guide existing AI coding agents such as Claude Code or Codex. The framework helps less-experienced developers use AI more systematically, identify gaps and risks in AI-generated outputs, reduce blind trust, control unnecessary repair, and learn software engineering judgment through guided verification, trust/risk reporting, and engineering reflection.

The framework does not replace senior engineers, software architects, or security engineers. Instead, it helps users recognize when AI output is acceptable for prototype use, when additional verification is needed, and when human review should be requested.

## Additional Safe Claim for AI-Managed Autonomy

The system may claim that it is **AI-managed and verification-governed**, meaning AI can manage project setup, technology-stack selection, rule generation, agent instruction creation, implementation planning, verification, repair, reporting, reflection, and rule updates. However, the system should not claim that AI decisions are inherently correct. The safer claim is:

> The system increases the trustworthiness of AI-managed software engineering work by governing AI decisions through role-separated critique, rule review, deterministic evidence, verification gates, repair limits, stop conditions, confidence labels, audit trails, rollback support, and human review escalation for high-risk or uncertain decisions.

