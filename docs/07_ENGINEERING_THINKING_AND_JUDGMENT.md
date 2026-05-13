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

# Engineering Thinking and Judgment

Under the **AI-managed, verification-governed** model, AI may propose plans, rules, code, and narratives—but **trust is earned through evidence, role-separated critique, gates, budgets, stop rules, and human escalation.** The Engineering Thinking and Judgment layer is the **human-facing competence layer**: it describes what “good supervision of AI-assisted work” looks like *inside the user’s head*, independent of any single UI.

This document is intentionally about **mental models and habits**, not about the mechanics of logging skills or generating mentor prompts. Those mechanics live in [08 Learning, Reflection, and Skill Development](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md), which produces artifacts (reflection report, question sets, rubrics, decision logs) meant to **practice** the judgment described here.

---

## Critical thinking and AI skepticism

Critical thinking here means treating AI outputs as **claims subject to challenge**, not as authority.

- Separate **observation** (diffs, logs, tool output) from **interpretation** (why something failed, what is “safe enough”).
- Ask what would falsify the AI’s conclusion: what evidence could contradict it, and was that evidence actually collected?
- Prefer **calibrated skepticism**: distrust generic confidence; trust repeatable checks, independent review roles, and explicit assumption logging.

This aligns directly with verification governance: what the model *says* must converge with what tools and gates *show*.

---

## Problem framing

Good framing precedes good implementation. Users should practice:

- Stating the problem in terms of **actors, workflows, data, constraints, and failure modes**, not only features.
- Identifying whether the work is **prototype scope vs production intent**, because the acceptable risk posture changes.
- Naming what would count as **done** before debating solutions (connects to acceptance criteria in [05 Verification and Risk](05_VERIFICATION_AND_RISK.md)).

## Questioning (disciplined inquiry)

Users should internalize a habit of **question-led engineering**: asking the missing-advice questions a senior reviewer would ask even when the AI does not volunteer them.

Examples of question patterns:

- What requirements are still implicit or ambiguous?
- What assumptions are we leaning on, and which ones are unsafe defaults?
- What trade-offs did we choose, and what did we give up?
- What evidence would convince a reviewer this is correct *for this risk level*?

These questions are exercised repeatedly through the reflection workflows in [08](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md#engineering-reflection-questions) but the *capability* is judgment, not the template.

---

## Engineering judgment (umbrella capability)

Engineering judgment is the integrated ability to align technical work with **intent, risk, evidence, and maintainability**. It spans the more specific “thinking modes” below and is reflected in artifacts such as decision logs and rubrics ([08 — Decision log](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md#project-decision-log), [08 — Rubric](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md#rubric-based-scoring)).

---

## Requirement thinking

- Distinguish **functional** from **non-functional** requirements (security, operability, maintainability).
- Track **scope boundaries**: what is explicitly out of scope for this task vs deferred debt.
- Connect requirements to **acceptance criteria** that can be tested or verified (see [05 — Acceptance criteria generation](05_VERIFICATION_AND_RISK.md#acceptance-criteria-generation)).

## Assumption management

Less-experienced users often unknowingly rely on implicit assumptions. Judgment practice includes:

- Naming assumptions explicitly and labeling them **user-confirmed vs AI-chosen default vs unknown**.
- Treating sensitive assumptions (auth, data retention, deletion, roles) as **high human-review affinity** even when the prototype still “works.”

## Trade-off thinking

Users should practice comparing alternatives along **multiple axes**—complexity, delivery speed, security, operability, team skill, and future change cost—not optimizing a single metric (for example “fastest code written”).

## Risk thinking

Risk thinking includes:

- Classifying change and findings by severity and blast radius ([05 Verification and Risk](05_VERIFICATION_AND_RISK.md)).
- Separating **prototype-acceptable** residual risk from **production-blocking** residual risk.
- Recognizing when “more AI changes” increases operational risk without new evidence ([06 Build, Repair, and Stop Conditions](06_BUILD_REPAIR_AND_STOP_CONDITIONS.md)).

## Verification thinking

Verification thinking ties claims to **repeatable checks** when possible: build, lint, typecheck, tests, and structured reviews.

- It asks: **What evidence exists**, what evidence is missing, and what evidence would be too expensive *not* to collect?
- It complements guided verification gates: the user should understand *why* a gate exists, not only how to click through it.

## Security thinking

Security thinking means assuming hostile inputs and misuse scenarios by default for externally reachable behavior.

- Authorization must be understood where it **must** hold (typically server-side for protected mutations), not only in UI affordances.
- Data sensitivity, deletion, and auditability are first-class considerations even in early prototypes when they inform later production posture.

## System impact thinking

Users should reason about **blast radius** of changes:

- What modules, interfaces, schemas, tests, and operational concerns does this touch?
- Could this change create subtle coupling or operational burden (migrations, observability, rollback complexity)?
- Does the change respect the approved task scope, or does it justify a new task/plan cycle?

This connects to impact analysis steps in [02 AI-Managed Workflow](02_AI_MANAGED_WORKFLOW.md).

---

## Stop / continue judgment

Users must learn when further AI modification is **evidence-backed** vs **cosmetic churn**.

- Continue / repair primarily when there are failing checks, violated acceptance criteria, material risk findings, or unresolved gate failures ([06](06_BUILD_REPAIR_AND_STOP_CONDITIONS.md)).
- Stop when required checks pass and remaining issues are low-severity or out-of-scope, even if the model could still “polish.”

## Human review thinking

Human review thinking is the skill of recognizing **when another human must be in the loop** and preparing for that conversation efficiently.

- It includes knowing what evidence to bring (diffs, assumptions, verification outputs) and what questions are not answerable alone.
- It pairs with the human review handoff structure in [05](05_VERIFICATION_AND_RISK.md#human-review-handoff-package).

---

## Decision documentation

Good judgment is **durable** when it is recorded: alternatives considered, rationale, trade-offs, residual risks, and what would change the decision.

- Decision documentation supports accountability across sessions and prevents “silent rewrites” of intent under AI pressure.
- The canonical artifact patterns for decision logging and heuristic rubrics sit in [08 — Project Decision Log](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md#project-decision-log) and [08 — Rubric-based scoring](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md#rubric-based-scoring).

---

## Relationship to the eleven major product layers

In the **eleven major product layers** / **major product layers** model ([01 — Full-Scope Product Vision](01_PRODUCT_PRINCIPLES.md#full-scope-product-vision-eleven-major-product-layers)), this capability area is **Layer 9: Engineering Thinking and Judgment**. It is adjacent to—**not merged with**—**Layer 10: Learning, Reflection, and Skill Development**, which operationalizes practice through artifacts and workflows.
