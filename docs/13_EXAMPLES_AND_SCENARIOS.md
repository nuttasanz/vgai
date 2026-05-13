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

# Examples and Scenarios

The first walkthrough is **Chief compatibility mode** (user-driven agent following framework files). The second is **full product mode** (AI-managed stack and rule generation before implementation). See [12 Chief Comparison](12_CHIEF_COMPARISON.md) and [02 AI-Managed Workflow](02_AI_MANAGED_WORKFLOW.md).

---

# Example Chief-Style Project Creation Scenario

This scenario illustrates how the framework may work from the beginning of a new project without building a new web app or new agentic AI.

Assume the user wants to create a clinic booking system.

## Step 1: Create or open a project

```bash
mkdir clinic-booking
cd clinic-booking
```

## Step 2: Initialize the framework

```bash
vgai init
```

The project receives framework files such as:

```text
AGENTS.md
CLAUDE.md
.vgai/core/core-rules.md
.vgai/core/verification-policy.md
.vgai/core/repair-policy.md
.vgai/core/stop-conditions.md
.vgai/workflows/01-requirement-analysis.md
.vgai/workflows/02-architecture-planning.md
.vgai/workflows/03-implementation.md
.vgai/workflows/04-build-and-repair.md
.vgai/workflows/05-verification-gates.md
.vgai/workflows/06-engineering-reflection.md
.vgai/templates/trust-risk-report-template.md
.vgai/templates/engineering-reflection-template.md
```

## Step 3: Start an existing AI coding agent

The user opens Claude Code, Codex, or another compatible agent in the project directory.

```bash
claude
```

or:

```bash
codex
```

The agent reads the framework instructions from `AGENTS.md`, `CLAUDE.md`, or compatible skill/instruction files.

## Step 4: Provide the initial project idea

The user says:

```text
Start a clinic booking system with patients, doctors, and admins.
Patients can book appointments, cancel appointments, view history, and receive notifications.
Doctors can view schedules. Admins can manage users and appointments.
Use Next.js and TypeScript.
```

## Step 5: The agent must not code immediately

The framework rules require the agent to begin with:

1. requirement analysis
2. guided missing-question detection
3. assumption logging
4. acceptance criteria
5. architecture proposal
6. Gate 1 review
7. user approval

The agent should ask guided questions such as:

```text
I found missing information in the requirement.

1. How should users log in?
Recommended prototype default: email/password.
Options: accept default / choose another / explain more / mark for human review.

2. Who can cancel appointments?
Recommended prototype default:
- Patient can cancel their own appointment.
- Doctor can cancel assigned appointments.
- Admin can cancel any appointment.

3. Does this system store sensitive patient data?
Recommended answer: yes, appointment history may be sensitive.
Risk: access control and audit logging should be considered before production.
```

## Step 6: The framework records assumptions

If the user accepts defaults or says "I don't know," the agent writes an Assumption Log:

```markdown
# Assumption Log

## Authentication

The system assumes email/password login for prototype.
Reason: user did not specify authentication method.
Risk: authentication design requires human review before production.

## Appointment cancellation

The system assumes patients can cancel their own appointments and admins can cancel any appointment.
Reason: default prototype permission model.
Risk: cancellation policy may need stakeholder review.
```

## Step 7: The agent implements only after approval

After the user approves the acceptance criteria and implementation plan, the agent may create or edit code.

After code changes, the framework requires:

- diff preview
- build/typecheck/lint/test execution where possible
- Build-and-Repair Loop if checks fail
- Stop Condition check if checks pass
- verification reports
- engineering reflection report

## Step 8: The framework stops unnecessary AI changes

If required checks pass and remaining issues are low severity, the framework requires a stop decision:

```text
Decision: Stop automated modification.
Reason:
- Build passed.
- Typecheck passed.
- No critical or high-risk issue remains for this milestone.
- Remaining findings are optional improvements.
- Further automated refactoring may introduce unnecessary risk.
```

## Step 9: The user receives learning artifacts

The framework generates:

- Trust/Risk Report
- Engineering Reflection Report
- Human Review Handoff if needed
- Project Decision Log
- Skill Progression update
- Mentor Mode next task recommendations

This makes the framework useful not only for building the project, but also for helping the user learn how to think more like a software engineer.

# Example AI-Managed New Project Creation Scenario

This scenario illustrates how the evolved system may work when the user starts from a blank project and does not know which technology stack or rules to choose.

## Step 1: User provides a product idea

```text
I want to create a clinic booking system.
There are patients, doctors, and admins.
Patients can book appointments, cancel appointments, view history, and receive notifications.
Doctors can view schedules. Admins can manage users and appointments.
I do not know which tech stack to use. Please choose what is appropriate.
```

## Step 2: AI asks only context questions the user can answer

The system should not force the user to choose between Next.js, Laravel, PostgreSQL, SQLite, JWT, sessions, Vitest, or Playwright directly. Instead, it asks product-level questions such as:

```text
1. Is this a prototype first, or will real users use it soon?
2. Will the system use real patient data or dummy data?
3. Do patient, doctor, and admin users need separate logins?
4. Should the system run locally first or be deployed online soon?
5. Do you want the stack to be easy to learn and verify?
```

If the user does not know, the AI may select safe prototype defaults and record them as assumptions.

## Step 3: AI roles select the technology stack

The AI Orchestrator may coordinate multiple roles:

```text
Product Planner: identifies the system as a role-based scheduling web application.
Tech Stack Recommender: proposes a stack with strong TypeScript, database, and verification tooling.
Security Reviewer: warns about patient data, role permissions, authentication, and deletion risk.
Ops Reviewer: checks local setup, deployment, environment variables, and database migration needs.
Learning Reviewer: favors a stack that is learnable for less-experienced developers.
Critic: challenges over-engineered or hard-to-setup choices.
Arbiter: selects the final stack and writes the decision record.
```

Example AI-selected stack:

```text
Next.js + TypeScript
PostgreSQL
Prisma
Session-based authentication with role support
Tailwind CSS
Vitest for unit tests
Playwright as optional future E2E testing
```

## Step 4: AI writes the Tech Stack Decision Record

```markdown
# Tech Stack Decision Record

## Selected Stack

- Next.js
- TypeScript
- PostgreSQL
- Prisma
- Session-based authentication
- Tailwind CSS
- Vitest

## Why This Stack Was Selected

The system is a role-based web application with structured relational data such as users, doctors, appointments, roles, and schedules. TypeScript and Prisma improve maintainability and verification. PostgreSQL is selected because the system may later require stronger data integrity and production-like behavior.

## Alternatives Considered

- SQLite: simpler for local prototype but less suitable for production-like concurrency.
- MongoDB: less aligned with structured relational scheduling data.
- Laravel: viable, but not selected because this product direction favors TypeScript-based AI coding agent compatibility.

## Assumptions

- Prototype-first project.
- User wants a stack that is learnable and verifiable.
- Patient data may be sensitive.

## Risks

- PostgreSQL setup may be harder for beginners.
- Authentication and role design require review before production.

## Confidence

Medium-high for prototype and learning use.
Medium for production use until reviewed.
```

## Step 5: AI generates and reviews project rules

AI generates stack-aware rules, then a critic and risk reviewer examine them before enforcement. Some rules become hard rules, some become warnings, some become guided questions, and some become human-review triggers.

Example rule classification:

```text
Hard Rules:
- Do not implement before acceptance criteria exist.
- Authorization must be enforced server-side for protected actions.
- Run available build/typecheck/lint/test checks after implementation.
- Stop automated modification when stop conditions are met.

Warning Rules:
- Audit logging is recommended for delete operations.
- Tests should be added for authorization behavior.

Guided Question Rules:
- Soft delete or permanent delete?
- Should admins have unrestricted deletion rights?

Human Review Triggers:
- Production authentication.
- Sensitive patient data.
- Data deletion policy.
```

## Step 6: AI generates `AGENTS.md` and `CLAUDE.md`

The system generates agent instruction files from the reviewed rule registry. A safety reviewer checks that these files do not allow bypassing verification, uncontrolled repair, unsafe autonomy, or unsupported security/production claims.

## Step 7: AI begins implementation under governed rules

Only after stack decision, rule generation, rule review, instruction generation, and safety review does the AI proceed to scaffold and implement the project.

# Expected Output of the System

The system should produce outputs such as:

- requirement analysis
- missing information list
- architecture recommendation
- milestone-based development plan
- security verification report
- code quality verification report
- build/test/lint verification result
- repair attempt summary
- stop-condition decision report
- cost/token usage summary
- selected-context summary
- compressed error-log summary
- cache usage summary where applicable
- unnecessary-change or regression warning where applicable
- unresolved error report
- production readiness report
- acceptance criteria report
- test plan or test checklist
- risk-based approval summary
- diff preview and patch summary
- rollback or snapshot summary
- human review handoff package
- failure mode report where applicable
- project decision log update
- trust/risk report
- engineering reflection report
- files-changed-and-rationale summary
- engineering trade-off summary
- alternatives-considered summary
- stop/continue/human-review decision explanation
- suggested learning path
- skill progression map update
- repeated reflection prompts and user response summary
- mentor-mode questions or review simulation prompts where applicable
- learning feedback
- human review suggestions

The report should classify findings as:

- Covered
- Partially Covered
- Missing
- Risky
- Not Applicable
- Requires Human Review

# Example Use Case

A user wants to build a clinic booking system.

The user provides:

"I want to build a clinic booking system with patients, doctors, and admins. Patients can book appointments, cancel appointments, view appointment history, and receive LINE notifications."

The system should:

1. Analyze requirements
2. Identify roles and sensitive data
3. Ask missing questions
4. Recommend architecture
5. Verify the recommendation
6. Add missing security and production tasks
7. Break work into milestones
8. Help implement tasks
9. Use the Cost and Token Optimization Layer to select relevant project context, compress logs, and avoid unnecessary LLM calls
10. Run the Build-and-Repair Loop to check whether generated code can build, lint, typecheck, or pass tests where possible
11. Apply Stop Conditions to decide whether further AI repair is necessary or should be stopped
12. Run verification gates
13. Generate a final trust report
14. Generate an Engineering Reflection Report explaining what changed, why it changed, which trade-offs were made, what evidence supports the result, and what the user should learn
15. Ask repeated reflection questions so the user can compare their own reasoning with the system's findings
16. Update the user's Skill Progression Map

Example final report:

Project: Clinic Booking System

Status:
Prototype-ready, but not production-ready

Covered:

- basic authentication
- frontend/backend/database separation
- Docker setup
- build check passed after one repair iteration

Partially covered:

- RBAC exists but permission matrix is incomplete
- error handling exists but inconsistent

Build-and-repair result:

- initial build failed due to missing type definition
- AI repair attempt updated the related type and route handler
- build passed after repair
- remaining warning: login endpoint has no rate limiting

Stop-condition result:

- automated repair stopped after required checks passed
- no Critical or High implementation errors remained
- remaining warning was classified as a security improvement requiring review, not an unlimited repair trigger
- recommendation: do not continue automated refactoring without human approval

Cost/token optimization result:

- relevant files were selected instead of sending the full repository
- build error log was compressed before repair analysis
- cached codebase summary was reused
- repair stopped within the defined repair and token budget

Missing / High risk:

- audit log for sensitive operations
- input validation strategy
- monitoring
- backup process
- secret management policy

Requires human review:

- data privacy and retention policy
- access control rules
- production deployment design

Learning feedback:

- why RBAC is needed
- why login alone is not enough
- why audit logging matters
- why Docker does not mean production-ready

Engineering reflection:

- the agent changed authorization-related files because privileged actions must be protected at the API layer, not only in the UI
- the selected approach centralizes admin checks to reduce duplicated authorization logic
- an alternative would be inline role checks in each route, but that may increase inconsistency and maintenance cost
- the remaining risks are not reasons for unlimited AI refactoring; they should be split into separate tasks or reviewed by a human

Skill progression update:

- Security Awareness: practiced RBAC and API authorization
- Testing Strategy: needs more unauthorized-case testing
- Production Readiness: needs more logging, monitoring, backup, and deployment planning
- Risk-Based Decision Making: practiced stop vs continue decision after verification

Repeated reflection prompts:

- What risk did you miss before seeing the report?
- Do you agree that the AI should stop automated repair at this point?
- What would you ask a senior engineer to review before production use?
