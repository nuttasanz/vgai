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
[11 Research](11_RESEARCH_POSITIONING.md) · [12 Chief](12_CHIEF_COMPARISON.md) ·
[13 Examples](13_EXAMPLES_AND_SCENARIOS.md) · [Glossary](14_GLOSSARY.md)

# Glossary

Cross-cutting terms used across the modular vision docs.

| Term                                        | Meaning                                                                                                                                                                                                                                                                                                                    |
| ------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **AI-managed, verification-governed**       | AI may propose and drive workflow steps, but trust comes from evidence, gates, critique, budgets, stop rules, and human escalation—not from model authority alone.                                                                                                                                                         |
| **Full product mode**                       | End-to-end AI-managed flows including stack/rule generation, multi-role review, and governed implementation. See [02](02_AI_MANAGED_WORKFLOW.md), [03](03_AI_ORCHESTRATION_AND_MULTI_ROLE_GOVERNANCE.md), [04](04_TECH_STACK_AND_RULE_GENERATION.md).                                                                      |
| **Chief compatibility mode**                | Running the framework primarily through agent-readable project files so existing coding agents follow structured workflows. See [12](12_CHIEF_COMPARISON.md).                                                                                                                                                              |
| **Existing AI coding agents**               | Claude Code, Codex, Cursor-class tools, etc.—treated as **governed execution tools**, not as the entire product.                                                                                                                                                                                                           |
| **Trust kernel**                            | Minimal meta-rules installed with **`vgai init`** (optional agent slash alias **`/vgai-init`**) that constrain autonomy and require reviewable artifacts.                                                                                                                                                                  |
| **Guided Verification Gate**                | Gate that combines AI first-pass review with guided questions, defaults, and assumption logging for less-experienced users.                                                                                                                                                                                                |
| **Build-and-Repair Loop**                   | Execute checks, analyze failures, apply bounded repairs, re-run checks. See [06](06_BUILD_REPAIR_AND_STOP_CONDITIONS.md).                                                                                                                                                                                                  |
| **Stop Conditions**                         | Evidence-based rules for when automated modification should stop. See [06](06_BUILD_REPAIR_AND_STOP_CONDITIONS.md).                                                                                                                                                                                                        |
| **Risk-Based Approval**                     | Classify proposed changes by risk before applying. See [05](05_VERIFICATION_AND_RISK.md).                                                                                                                                                                                                                                  |
| **Eleven major product layers**             | The **major product layers** architecture used in [01](01_PRODUCT_PRINCIPLES.md#full-scope-product-vision-eleven-major-product-layers); separates orchestration, core framework, planning, rules, adapters, build/repair, verification, cost/token, **judgment**, **learning mechanics**, and **platform/productization**. |
| **Engineering Thinking and Judgment Layer** | Layer 9: habits of critical thinking, framing, questioning, trade-offs, risk, verification, security, system impact, stop/continue and human-review judgment, AI skepticism, and decision documentation. See [07](07_ENGINEERING_THINKING_AND_JUDGMENT.md).                                                                |
| **Learning / Skill scaffold**               | Layer 10: reflection reports and questions, decision log and rubric patterns, skill maps, mentor mode, repeated reflection. See [08](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md).                                                                                                                                     |
| **RAG**                                     | Optional supporting retrieval for guidelines—not the core research contribution. See [05](05_VERIFICATION_AND_RISK.md#role-of-rag).                                                                                                                                                                                        |
