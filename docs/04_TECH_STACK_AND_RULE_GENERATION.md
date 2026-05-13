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

# Tech Stack and Rule Generation

See also [02 AI-Managed Workflow](02_AI_MANAGED_WORKFLOW.md) (new project initialization) and [09 Agent Adapters and Framework Files](09_AGENT_ADAPTERS_AND_FRAMEWORK_FILES.md) (instruction artifacts).

---

## AI-Generated Rule Lifecycle

Because the product vision allows AI to create rules, rules must have a lifecycle. AI-generated rules should not be enforced simply because they were generated. The system should govern rules through generation, critique, testing, arbitration, enforcement, monitoring, and update.

The lifecycle is:

1. **Trust Kernel Installed**
   - `vgai init` installs the minimal meta-rules that govern AI autonomy. Some agent environments may document the same entrypoint as a slash command (for example `/vgai-init`) for compatibility with agent command UX.
   - These rules define how AI-generated outputs become reviewable and trustworthy.

2. **Project and Product Discovery**
   - The system identifies project type, users, workflows, data sensitivity, deployment assumptions, learning goals, and technical constraints.

3. **Tech Stack Decision**
   - AI proposes and selects a suitable stack using multiple roles when the decision is high-impact.
   - The system writes a Tech Stack Decision Record with rationale, alternatives, assumptions, risks, and confidence.

4. **Candidate Rule Generation**
   - AI generates candidate rules for workflow, project conventions, security, testing, production readiness, cost/token usage, repair, stop conditions, and learning.

5. **Rule Critique**
   - A separate AI role checks for unsupported rules, over-broad rules, contradictions, false positives, false negatives, and rules that should be converted into guided questions instead of hard constraints.

6. **Security and Risk Review**
   - Security-sensitive rules are reviewed for authentication, authorization, data deletion, sensitive data, secrets, migration, dependency, and production risks.

7. **Rule Scenario Testing**
   - AI creates examples of when a rule should trigger and when it should not.
   - Deterministic scripts or structured checks may use these scenarios to evaluate rule behavior.

8. **Rule Arbitration**
   - Rules are classified as active rules, warning rules, guided-question rules, human-review triggers, experimental rules, rejected rules, or deprecated rules.

9. **Instruction Artifact Generation**
   - The system generates or updates `AGENTS.md`, `CLAUDE.md`, skill files, workflow files, and templates from the governed rule registry.

10. **Runtime Enforcement and Evidence Collection**
    - Rules are applied during planning, implementation, verification, repair, reporting, and reflection.
    - The system records which rules triggered, what evidence supported them, and whether they caused useful or noisy behavior.

11. **Rule Update Loop**
    - After each task, AI may propose rule updates based on failures, repeated risks, false positives, missed checks, user confusion, or human review feedback.
    - Proposed updates must re-enter the rule review lifecycle before becoming active.

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
