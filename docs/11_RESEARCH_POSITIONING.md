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

# Research Positioning

For the problem statement, users, and safe claims, see
[01 Product Principles](01_PRODUCT_PRINCIPLES.md).

---

## Research Contributions

The main contributions are:

1. A structured AI-assisted development workflow for less-experienced developers
2. A verification-gated process that checks AI-generated outputs before users
   trust or continue
3. A trust/risk report that explains what is covered, missing, risky, or
   requires human review
4. A learning scaffold that helps developers learn software engineering judgment
   instead of simply copying AI output
5. A Build-and-Repair Loop that verifies AI-generated implementation through
   build, lint, typecheck, and test execution where possible, then attempts
   controlled repair before escalating unresolved issues to human review
6. A Stop-Condition mechanism that prevents unnecessary AI-driven code changes
   by stopping automated repair when required checks pass, remaining findings
   are low-severity, or further changes may create regression
7. A Cost and Token Optimization Layer that reduces unnecessary LLM calls and
   excessive context usage through selective context retrieval, codebase
   mapping, caching, error-log compression, diff-based repair context, model
   routing, and repair/token budgets
8. An Engineering Reflection Report that converts AI-assisted development
   sessions into structured learning artifacts explaining project understanding,
   implementation rationale, alternatives, trade-offs, verification evidence,
   repair history, stop decisions, risks, and suggested learning topics
9. A Skill Progression Map that helps users track exposure to software
   engineering skill areas such as requirements, architecture, security,
   testing, maintainability, production readiness, observability, and risk-based
   decision making
10. A Repeated Reflection and Mentor Mode mechanism that encourages users to
    reason before and after AI feedback, compare their judgment with the
    system's analysis, and practice senior-like engineering review questions
11. An Acceptance Criteria and Test-Aware Workflow that defines task completion
    and encourages behavior-focused verification before and after AI
    implementation
12. A Risk-Based Approval, Versioning, Diff Preview, and Rollback mechanism that
    makes AI code changes safer and more inspectable
13. A Human Review Handoff Package and Failure Mode Report that structure
    escalation when the AI should stop and a human should inspect unresolved or
    high-risk issues
14. A Project Decision Log that preserves engineering rationale, alternatives,
    trade-offs, and unresolved risks across AI-assisted development sessions
15. A full-scope product vision that starts from a solo-first developer workflow
    and can later expand into Git/PR workflows, project rules, integrations,
    audit trails, secret protection, independent AI review, quality dashboards,
    and optional team or organization support

## Possible Research Questions

RQ1: Can a structured AI-assisted development workflow with verification gates
help less-experienced developers build web applications more systematically than
ad-hoc LLM prompting?

RQ2: Can verification gates detect more security, code quality, and production
readiness gaps than direct LLM prompting?

RQ3: How closely do the system's verification reports align with expert review?

RQ4: Can the system help users understand trade-offs, risks, and design
decisions better after using it?

RQ5: Can the Build-and-Repair Loop improve the likelihood that AI-generated code
builds, passes basic checks, or produces clearer unresolved-error reports
compared with ad-hoc LLM prompting?

RQ6: Can explicit Stop Conditions reduce unnecessary AI-driven repair,
over-refactoring, or regression while maintaining build/test success and
verification quality?

RQ7: Can cost-aware context selection, caching, error-log compression, and
repair budgeting reduce token usage and LLM calls while preserving build/test
success and verification quality?

RQ8: Can Engineering Reflection Reports help less-experienced developers better
understand software engineering concerns such as requirements, architecture,
security, maintainability, testing, production readiness, and risk-based
decision making?

RQ9: Can Repeated Reflection and Mentor Mode improve users' ability to identify
risks, trade-offs, missing tests, stop conditions, and human review needs before
relying on AI-generated answers?

RQ10: Can a Skill Progression Map help users track their growth across software
engineering skill areas and identify gaps for future learning?

RQ11: Can Acceptance Criteria Generation and a Test-Aware Workflow improve the
correctness and completeness of AI-assisted implementation compared with ad-hoc
prompting?

RQ12: Can Risk-Based Approval, Diff Preview, and Rollback reduce unsafe or
unnecessary AI-driven code changes while preserving development productivity?

RQ13: Can Human Review Handoff Packages and Failure Mode Reports help
less-experienced developers communicate unresolved risks and review questions
more effectively to senior reviewers?

## Possible Build-and-Repair, Stop-Condition, Cost/Token, and Learning Evaluation Metrics

The Build-and-Repair Loop, Stop Conditions, and Cost and Token Optimization
Layer may be evaluated using metrics such as:

- Build pass rate
- Typecheck pass rate
- Lint pass rate
- Test pass rate
- Repair success rate
- Average number of repair iterations
- Number of unresolved errors
- Number of new issues introduced during repair
- Human review required rate
- Expert judgment on whether the repair was appropriate
- Stop decision accuracy compared with expert judgment
- Number of unnecessary changes avoided
- Diff size before and after stop-condition enforcement
- Regression count after repair attempts
- Number of optional/low-severity findings correctly reported without automatic
  modification
- Total LLM calls per task
- Prompt tokens, completion tokens, and total tokens per task
- Estimated cost per task
- Cost per successful verified implementation
- Token reduction compared with sending the full repository context
- Context precision, or the proportion of selected files that are actually
  relevant to the task
- Cache hit rate for codebase summaries, file summaries, or previous
  verification artifacts
- Error-log compression ratio
- Repair cost per iteration
- Latency per task
- User ability to identify missing requirements before and after using the
  system
- User ability to identify security risks before and after using the system
- User ability to explain engineering trade-offs before and after using the
  system
- User ability to distinguish Critical/High findings from Low/Informational
  findings
- User ability to decide whether AI should stop, continue, or escalate to human
  review
- Quality of user reflection answers compared with expert judgment
- Number of learning topics correctly mapped to the task
- Skill Progression Map coverage across engineering skill areas
- User perceived improvement in software engineering judgment
- Mentor Mode usefulness rating
- Repeated Reflection completion rate
- Improvement between pre-reflection and post-reflection answers
- Acceptance criteria coverage rate
- Number of acceptance criteria satisfied by implementation
- Number of missing or ambiguous acceptance criteria detected before
  implementation
- Test plan coverage across success, failure, unauthorized, and edge cases
- Risk classification accuracy compared with expert judgment
- Number of high-risk changes requiring explicit approval
- Rollback frequency and rollback success rate
- Number of AI changes rejected after diff preview
- Number of human review handoff packages generated
- Expert usefulness rating of human review handoff packages
- Number of failure mode reports generated after repair budget exhaustion
- User ability to explain why automated repair stopped
- Number of project decisions recorded in the decision log
- Expert judgment on quality of recorded decisions, alternatives, and trade-offs

These metrics can help evaluate whether the system improves implementation
reliability compared with ad-hoc LLM prompting, while still acknowledging that
passing build or tests does not guarantee correctness, security, or production
readiness. Stop-condition metrics also help evaluate whether the system can
prevent unnecessary AI changes when the code is already good enough for the
current task scope. Cost/token metrics help evaluate whether the system can
reduce unnecessary model usage while preserving verification quality. Learning
metrics help evaluate whether the system supports the development of software
engineering judgment, while avoiding the unsafe claim that the tool
automatically turns junior developers into senior engineers.
