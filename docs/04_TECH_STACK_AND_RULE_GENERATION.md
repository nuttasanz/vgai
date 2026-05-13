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

# Tech Stack and Rule Generation

See also [02 AI-Managed Workflow](02_AI_MANAGED_WORKFLOW.md) (new project
initialization) and
[09 Agent Adapters and Framework Files](09_AGENT_ADAPTERS_AND_FRAMEWORK_FILES.md)
(instruction artifacts).

---

## New Projects vs Existing Projects

The tech stack decision flow differs depending on whether the user is starting a
new project or working within an existing repository.

**New projects:**

The system performs AI-managed tech stack decision before rule generation. The
user does not need to choose a stack directly. The AI Orchestrator coordinates
multiple roles to propose, critique, review, and arbitrate the stack choice.
Technical rules are then generated from the selected stack.

**Existing projects:**

The system first detects the tech stack from the existing repository (framework,
language, database, authentication, test tooling, and build tooling). Rules are
then generated from the detected stack. The system does not re-select a new
technology stack at each task. Tech stack review applies only when the task
itself requires a stack-level change, such as adding a new database, replacing a
framework, or introducing a major dependency.

---

## AI Multi-Role Tech Stack Decision Flow (New Projects)

For new projects, the system uses a risk-based multi-role decision flow to
select a suitable technology stack. This ensures the stack choice is proposed,
challenged, security-reviewed, and arbitrated before rules are generated.

The flow is:

1. **Product Planner** identifies the system type, user roles, data sensitivity,
   deployment expectations, and learning goals from product discovery questions.

2. **Tech Stack Recommender** proposes a suitable stack based on product needs,
   verification capability, maintainability, learning difficulty, deployment
   assumptions, and available tooling.

3. **AI Critic** challenges the selected stack by comparing alternatives and
   identifying risks such as setup complexity, production limitations, security
   concerns, or over-engineering.

4. **Security and Risk Reviewer** checks whether the proposed stack introduces
   authentication, authorization, data, secret, migration, or
   production-readiness concerns.

5. **AI Arbiter** selects the final stack under a stated confidence level and
   writes a Tech Stack Decision Record.

6. **AI Rule Generator** creates stack-aware project rules, workflow rules,
   security rules, testing rules, production-readiness rules, and learning rules
   from the selected stack.

If the user lacks technical knowledge, the system may select safe prototype
defaults, record the rationale, assumptions, alternatives considered, risks,
confidence level, and production-review limitations — rather than forcing the
user to make technical choices they cannot yet evaluate.

---

## Rough Prompt → AI-Selected Stack Example

A less-experienced user might start with:

```text
I want to build a clinic booking system.
Patients can book appointments, cancel, and view history.
Doctors see their schedule. Admins manage users and appointments.
I don't know which stack to use.
```

The system asks only product-level questions the user can answer:

```text
1. Is this a prototype first, or will real users use it soon?
2. Will the system use real patient data or dummy data?
3. Do patient, doctor, and admin users need separate logins?
4. Should the system run locally first or be deployed online soon?
5. Do you want the stack to be easy to learn and verify?
```

After product discovery, the AI roles coordinate and select:

```text
Next.js + TypeScript
PostgreSQL
Prisma
Session-based authentication with role support
Tailwind CSS
Vitest for unit tests
Playwright (optional future E2E)
```

The system then writes a Tech Stack Decision Record (see below) and proceeds to
rule generation.

---

## Tech Stack Decision Record

After the AI Arbiter selects the final stack, the system writes a Tech Stack
Decision Record. This record is a governance artifact that must exist before
rules are generated.

Example structure:

```markdown
# Tech Stack Decision Record

## Selected Stack

- Framework: Next.js (App Router)
- Language: TypeScript
- Database: PostgreSQL
- ORM: Prisma
- Authentication: Session-based with role support
- CSS: Tailwind CSS
- Testing: Vitest (unit), Playwright (optional E2E)

## Why This Stack Was Selected

The system is a role-based web application with structured relational data
(users, doctors, appointments, roles, schedules). TypeScript and Prisma improve
maintainability and verification. PostgreSQL is selected because the system may
later require stronger data integrity and production-like behavior.

## Alternatives Considered

- SQLite: simpler for local prototype but less suitable for production
  concurrency.
- MongoDB: less aligned with structured relational scheduling data.
- Laravel: viable, but not selected because this product direction favors
  TypeScript-based AI coding agent compatibility.

## Assumptions

- Prototype-first project.
- User wants a learnable and verifiable stack.
- Patient data may be sensitive.

## Risks

- PostgreSQL setup may be harder for beginners.
- Authentication and role design require review before production.

## Confidence

Medium-high for prototype and learning use. Medium for production use until
reviewed by a senior developer.

## Reviewed By

- AI Critic: challenged MongoDB and SQLite trade-offs
- Security Reviewer: flagged patient data and role design risks
- AI Arbiter: selected final stack under stated assumptions
```

---

## AI-Generated Rule Lifecycle

Because the product vision allows AI to create rules, rules must have a
lifecycle. AI-generated rules should not be enforced simply because they were
generated. The system should govern rules through generation, critique, testing,
arbitration, enforcement, monitoring, and update.

The lifecycle is:

1. **Trust Kernel Installed**
   - `vgai init` installs the minimal meta-rules that govern AI autonomy. Some
     agent environments may document the same entrypoint as a slash command (for
     example `/vgai-init`) for compatibility with agent command UX.
   - These rules define how AI-generated outputs become reviewable and
     trustworthy.

2. **Project and Product Discovery**
   - The system identifies project type, users, workflows, data sensitivity,
     deployment assumptions, learning goals, and technical constraints.

3. **Tech Stack Decision**
   - For **new projects**: AI proposes and selects a suitable stack using
     multiple roles when the decision is high-impact. The system writes a Tech
     Stack Decision Record with rationale, alternatives, assumptions, risks, and
     confidence.
   - For **existing projects**: The system detects the current stack from the
     repository. Tech stack decision applies only if the task requires a
     stack-level change.

4. **Candidate Rule Generation**
   - AI generates candidate rules for workflow, project conventions, security,
     testing, production readiness, cost/token usage, repair, stop conditions,
     and learning.

5. **Rule Critique**
   - A separate AI role checks for unsupported rules, over-broad rules,
     contradictions, false positives, false negatives, and rules that should be
     converted into guided questions instead of hard constraints.

6. **Security and Risk Review**
   - Security-sensitive rules are reviewed for authentication, authorization,
     data deletion, sensitive data, secrets, migration, dependency, and
     production risks.

7. **Rule Scenario Testing**
   - AI creates examples of when a rule should trigger and when it should not.
   - Deterministic scripts or structured checks may use these scenarios to
     evaluate rule behavior.

8. **Rule Arbitration**
   - Rules are classified into the rule registry (see Rule Registry Categories
     below).

9. **Instruction Artifact Generation**
   - The system generates or updates `AGENTS.md`, `CLAUDE.md`, skill files,
     workflow files, and templates from the governed rule registry.
   - A Safety Reviewer checks that these instruction files do not allow
     bypassing verification, uncontrolled repair, unsafe autonomy, or
     unsupported production/security claims.

10. **Runtime Enforcement and Evidence Collection**
    - Rules are applied during planning, implementation, verification, repair,
      reporting, and reflection.
    - The system records which rules triggered, what evidence supported them,
      and whether they caused useful or noisy behavior.

11. **Rule Update Loop**
    - After each task, AI may propose rule updates based on failures, repeated
      risks, false positives, missed checks, user confusion, or human review
      feedback.
    - Proposed updates must re-enter the rule review lifecycle before becoming
      active.

---

## Rule Registry Categories

After arbitration, every rule is classified into one of the following
categories. The rule registry is the authoritative source for what rules are
currently active, pending, or retired.

| Category                       | Description                                                                                                                                                                                              |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Active rules**               | Rules that have passed critique, risk review, and scenario testing. Enforced in the workflow.                                                                                                            |
| **Warning rules**              | Rules that trigger an advisory notice but do not block the workflow. Useful when a concern is real but context-dependent.                                                                                |
| **Guided-question rules**      | Rules that convert an uncertain decision into a guided question with a recommended default and an assumption log entry. Used when the correct answer depends on product context the user should confirm. |
| **Human-review trigger rules** | Rules that flag a decision or artifact as requiring senior, security, instructor, or production review before it can be treated as production-ready.                                                     |
| **Experimental rules**         | Rules under observation. Used for learning or testing behavior but not yet trusted as strong engineering constraints.                                                                                    |
| **Rejected rules**             | Rules that were found to be unsupported, over-broad, noisy, or contradicted by project evidence. Not enforced.                                                                                           |
| **Deprecated rules**           | Rules that were previously active but are no longer applicable, typically because the stack, scope, or project direction changed.                                                                        |

Example rule classification from a clinic booking project:

```text
Active Rules:
- Do not implement before acceptance criteria exist.
- Authorization must be enforced server-side for protected actions.
- Run available build/typecheck/lint/test checks after implementation.
- Stop automated modification when stop conditions are met.

Warning Rules:
- Audit logging is recommended for delete operations.
- Tests should be added for authorization behavior.

Guided-Question Rules:
- Soft delete or permanent delete?
- Should admins have unrestricted deletion rights?

Human-Review Trigger Rules:
- Production authentication design.
- Sensitive patient data handling.
- Data deletion policy.

Rejected Rules:
- "All code must have 100% test coverage" — over-broad for prototype scope.
```

---

## AI-Generated AGENTS.md / CLAUDE.md Review Flow

Instruction artifacts such as `AGENTS.md` and `CLAUDE.md` are generated from the
governed rule registry. Because incorrect instruction files can cause the entire
workflow to behave incorrectly, they must be reviewed by a Safety Reviewer
before use.

The review flow is:

1. **Rule Arbiter** compiles the rule registry into its final categories.
2. **AI Instruction Generator** produces `AGENTS.md`, `CLAUDE.md`, and other
   agent-specific instruction files from the active and warning rules.
3. **AI Safety Reviewer** checks that the generated instruction files:
   - do not allow bypassing verification gates
   - do not allow uncontrolled or unlimited repair
   - do not claim unsafe autonomy without evidence
   - do not make unsupported production-readiness or security claims
   - correctly reference stop conditions and human-review triggers
4. If issues are found, the instruction files are revised and re-reviewed before
   being written to the project.
5. The final approved instruction files are written to the project repository.

Generated instruction file paths:

```text
AGENTS.md
CLAUDE.md
.vgai/rules/active-rules.md
.vgai/rules/warning-rules.md
.vgai/rules/guided-question-rules.md
.vgai/rules/human-review-triggers.md
```

---

## Rule Metadata

Each rule should include metadata such as:

```yaml
id: AUTHZ-API-001
title: Enforce server-side authorization for protected API actions
type: security
created_by: ai-rule-generator
reviewed_by:
  - rule-critic
  - security-risk-reviewer
source_basis:
  - project has authenticated roles
  - task modifies protected data
scope:
  applies_to:
    - API routes
    - server actions
  does_not_apply_to:
    - public health checks
risk_if_ignored:
  - unauthorized access
  - privilege escalation
confidence: medium
enforcement_level: guided-question-or-warning
human_review_trigger_when:
  - production deployment
  - sensitive data
  - deletion operation
examples:
  should_trigger:
    - DELETE /api/appointments/:id
  should_not_trigger:
    - GET /api/public/health
```
