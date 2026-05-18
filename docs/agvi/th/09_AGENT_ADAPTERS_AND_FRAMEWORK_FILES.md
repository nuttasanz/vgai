---
part_of: VG-AI product vision (modular)
---

**การนำทาง:** ดู [ภาพรวม](PRODUCT_VISION.md)

# Agent Adapters และ Framework Files

เอกสารนี้เก็บ framing ตอนต้นจาก vision เดิมแบบ monolithic ในส่วน “productization + platform” แต่ **จำกัด scope ที่นี่** อยู่ที่ **solo-first adoption**, **project-local framework layout**, **agent compatibility modes** และ **rule / instruction layers** ที่ coding agents เดิมอ่านและทำตาม ส่วน Git/PR workflow, CLI, web app, integrations, audit trail, roadmap และ product diagram อยู่ใน [10 Productization and Platform](10_PRODUCTIZATION_AND_PLATFORM.md)

## Framework surfaces สำหรับ agent

สิ่งต่อไปนี้อธิบายว่า framework จะถูก adopt และ govern **ภายใน repo** ได้อย่างไร โดยไม่สื่อว่า adapters คือ platform ทั้งหมด adapters คือทางที่ governed execution ไปถึง **agents ที่มีอยู่แล้ว**

shift สำคัญของผลิตภัณฑ์คือ:

> framework สามารถทำงานได้โดยไม่ต้องมี web app ผ่าน project-local files, agent instructions, skills, scripts และ reports ส่วน web app สามารถเพิ่มภายหลังเป็น dashboard หรือ interface layer

## Solo-First Framework Path

เวอร์ชันแรกออกแบบสำหรับผู้ใช้หนึ่งคน: developer ที่ต้องการใช้ Claude Code, Codex หรือ AI coding agent อื่นให้ปลอดภัยและเป็นระบบขึ้น

workflow แบบ solo-first อาจมี:

1. สร้าง local project หรือเปิด repository เดิม
2. รัน **`vgai init`** หรือ alias `/vgai-init`
3. เพิ่ม `AGENTS.md`, `CLAUDE.md`, workflows, rules, templates และ scripts
4. เริ่ม Claude Code, Codex หรือ compatible coding agent
5. ขอให้ agent ทำตาม framework ที่มี verification gates
6. รีวิว guided questions, acceptance criteria และ implementation plan
7. อนุมัติ change risk level
8. ให้ external agent แก้ code ภายใต้ framework rules
9. รัน build/typecheck/lint/test scripts
10. ใช้ Build-and-Repair Loop และ Stop Conditions
11. สร้าง Trust/Risk Report, Engineering Reflection Report, Human Review Handoff, Decision Log และ Skill Progression update
12. ทำงานถัดไปตามที่ Mentor Mode แนะนำ

เส้นทางนี้ไม่ควรต้องมี team accounts, organization policies หรือ web platform เต็มรูปแบบในช่วงแรก สิ่งเหล่านั้นเพิ่มภายหลังได้หลัง core framework พิสูจน์ว่ามีประโยชน์กับ individual developers

## Framework Package Structure

ตัวอย่าง package แบบ project-local:

```text
.vgai/
  core/
    trust-kernel/
      common/           ← TK-001..TK-018 universal governance rules
      typescript/       ← extends common/ + TS-specific rules
      python/           ← extends common/ + Python-specific rules

  hooks/
    hooks.json          ← event → script mapping
    scripts/
      pre-tool-use.js   ← ตรวจ acceptance criteria, ป้องกัน scope drift
      post-tool-use.js  ← นับ repair iterations, append observation
      stop.js           ← flush observations, trigger Reflector
      session-start.js  ← โหลด trust-kernel layer

  observations.jsonl    ← append-only event log (universal data source)

  workflows/
    01-project-initiation.md
    02-requirement-analysis.md
    03-architecture-planning.md
    04-implementation.md
    05-build-and-repair.md
    06-verification-gates.md
    07-engineering-reflection.md

  skills/
    acceptance-criteria.md
    guided-verification-gate.md
    build-and-repair.md
    stop-condition.md
    trust-risk-report.md
    engineering-reflection.md
    human-review-handoff.md

  templates/
    project-brief-template.md
    acceptance-criteria-template.md
    assumption-log-template.md
    trust-risk-report-template.md
    engineering-reflection-template.md
    human-review-handoff-template.md
    failure-mode-report-template.md
    decision-log-template.md

  scripts/
    run-checks.sh
    summarize-diff.sh
    extract-errors.sh

AGENTS.md
CLAUDE.md
```

framework files บอก external coding agent ว่าควรประพฤติอย่างไร agent ยังทำ implementation แต่ framework ควบคุม process

## Hook-Based Enforcement Layer

ไฟล์อย่าง `AGENTS.md` และ `CLAUDE.md` บอก agent ว่าต้องทำอะไร แต่ขึ้นอยู่กับ agent ว่าจะอ่านและปฏิบัติตามหรือไม่ hooks บังคับกฎ framework แบบ mechanical ไม่ว่า agent จะมีไฟล์นั้นใน context window หรือไม่

hook fire ที่ lifecycle event เฉพาะและรัน script script สามารถ block operation, append observation หรือ trigger follow-up action ได้

framework กำหนด 4 enforcement hooks:

| Hook event | การบังคับ |
| --- | --- |
| **PreToolUse** (Edit / Write) | block code modification ถ้ายังไม่มี acceptance criteria สำหรับ task ปัจจุบัน (TK-001) |
| **PostToolUse** (Edit / Write) | นับ repair iterations; block ถ้า counter เกิน 3 (TK-008) |
| **Stop** | append session summary ลง `observations.jsonl`; trigger Reflector ถ้า task ไม่ trivial |
| **SessionStart** | โหลด `trust-kernel/common/` และ language layer ที่ตรวจพบเข้า active context |

### observations.jsonl

ทุก PreToolUse, PostToolUse และ Stop event append 1 บรรทัดลง `.vgai/observations.jsonl` แต่ละ entry บันทึก:

```json
{
  "timestamp": "2026-05-18T14:23:01Z",
  "event": "PostToolUse",
  "tool": "Edit",
  "file": "src/lib/auth.ts",
  "outcome": "success",
  "task_id": "task-042",
  "repair_iteration": 2
}
```

event log นี้คือ **universal data source** ของทุก framework artifact — Failure Mode Reports, Trust/Risk Reports, Engineering Reflection Reports และ Project Decision Log ถูกสร้างจาก evidence ใน `observations.jsonl` ไม่ใช่จาก working memory ของ agent

hooks ไม่ได้แทนที่ instruction files `CLAUDE.md` และ `AGENTS.md` ส่ง intent และ context ให้ agent hooks บังคับ hard limits ที่ agent ไม่สามารถ bypass ผ่าน reasoning ได้

## Agent Compatibility Layer

ผลิตภัณฑ์ควรทำงานกับ agentic coding tools ที่มีอยู่แล้ว ไม่ควรผูกกับ vendor หรือ agent เดียว

compatibility modes:

- `AGENTS.md` สำหรับ general agent instructions
- `CLAUDE.md` สำหรับ Claude Code
- instruction files หรือ skills ที่ compatible กับ Codex
- command-line scripts สำหรับ build/test/verification
- MCP tools ทางเลือกสำหรับ integration ที่ลึกขึ้น
- web dashboard ทางเลือกสำหรับดู reports และ skill progression

โหมดการทำงาน:

1. **Framework-only mode**: markdown rules, templates และ scripts ภายในโปรเจกต์
2. **Claude Code mode**: Claude Code อ่าน `CLAUDE.md` และทำตาม workflows
3. **Codex mode**: Codex อ่าน `AGENTS.md` หรือ skill instructions เฉพาะ Codex
4. **Companion mode**: ผู้ใช้ใช้ coding agent ใดก็ได้ แล้วรัน framework เพื่อ verify diff/reports
5. **MCP / Tool Server mode**: external agents เรียก framework tools เช่น `run_verification_gate()` หรือ `check_stop_condition()`
6. **Web app mode**: interface layer ในอนาคตสำหรับ dashboard, reports, learning history และ configuration

## Core Rules, AI-Generated Rules, and Project Rules

framework ควรแยกกฎเป็นชั้น ๆ ใน vision แบบเต็ม AI อาจสร้างและ refine กฎจำนวนมากได้ แต่กฎแต่ละประเภทมี authority ไม่เท่ากัน บางกฎเป็น trust kernel ขั้นต่ำ บางกฎ AI-generated, project-derived, task-specific หรือ learning-oriented

### Trust Kernel Rules

Trust Kernel Rules คือ meta-rules ขั้นต่ำที่ติดตั้งระหว่าง **`vgai init`** เพื่อกำกับ AI autonomy ก่อน AI สร้าง project-specific rules เป็น process-safety rules ที่ป้องกันการเชื่อ output ของ AI แบบตาบอด

ตัวอย่าง:

- AI-generated rules ไม่ถูก trust โดยอัตโนมัติ
- generated rule ทุกข้อมี rationale, scope, risk, confidence และ examples
- ห้าม implement ก่อนมี requirements และ acceptance criteria
- ห้าม invent missing requirements แบบเงียบ ๆ
- บันทึก assumptions เมื่อใช้ defaults
- classify risk ก่อนแก้ code
- รัน build/typecheck/lint/test ที่มีหลัง code changes
- repair ต่อเฉพาะเมื่อ evidence รองรับ
- หยุด automated modification เมื่อเข้า stop conditions
- ห้าม claim production readiness หรือ security โดยไม่มี evidence

### AI-Generated Project Rules

สำหรับโปรเจกต์ใหม่ project rules ควรถูกสร้างหลัง product discovery และ tech-stack decision AI อาจสร้าง candidate rules แต่ต้องผ่าน rule critique, risk review, scenario testing และ arbitration ก่อนเป็น active rules

ตัวอย่างหลังเลือก Next.js, TypeScript, Prisma และ PostgreSQL:

```markdown
# Project AI Rules

- Use TypeScript for all new source files.
- Follow Next.js App Router conventions unless the project uses another routing model.
- Use Prisma for database access.
- Do not introduce a second ORM without justification.
- API routes and server actions that mutate protected data must enforce server-side authorization.
- Database schema changes are high risk and require migration and rollback notes where possible.
- Authentication and authorization changes require security review flags before production use.
- Run available build, typecheck, lint, and test checks after implementation.
```

### Rule Enforcement Levels

- **Hard Rule** — block workflow เมื่อ violate เช่น implement ก่อน acceptance criteria
- **Warning Rule** — รายงาน concern แต่ไม่ block เช่น missing audit logging ใน prototype
- **Guided Question Rule** — แปลง decision ที่ไม่แน่นอนเป็นคำถามหรือ default พร้อม assumption log
- **Human Review Trigger** — flag decisions ที่ต้อง senior/security/instructor/production review
- **Experimental Rule** — ใช้เพื่อ learning/observation แต่ยังไม่ trust เป็น rule แข็ง
- **Rejected or Deprecated Rule** — ไม่ใช้เพราะ unsupported, over-broad, noisy หรือขัดกับ evidence

### Generated Instruction Artifacts

ระบบอาจสร้างหรืออัปเดต agent instruction files จาก governed rule registry:

```text
AGENTS.md
CLAUDE.md
.vgai/workflows/*.md
.vgai/skills/*.md
.vgai/rules/active-rules.md
.vgai/rules/warning-rules.md
.vgai/rules/guided-question-rules.md
.vgai/rules/human-review-triggers.md
```

ไฟล์เหล่านี้ควรถูกรีวิวโดย AI role critics หรือ safety reviewers ก่อนใช้ เพราะ instruction files ที่ผิดอาจทำให้ workflow ทั้งหมดผิด

### Task Rules

Task-specific rules สร้างจากงานของผู้ใช้เป็น acceptance criteria ใน autonomous mode AI อาจเลือก safe prototype defaults เมื่อผู้ใช้ขาด technical knowledge แต่ต้องบันทึก assumptions, risks และ confidence level

ผู้ใช้ควรสามารถ accept, edit, ขอคำอธิบาย หรือ mark uncertain items เพื่อ human review ได้ ถ้าผู้ใช้ตอบไม่ได้ ระบบอาจเลือก prototype default และบันทึกเป็น AI-selected assumption ไม่ใช่ requirement ที่ผู้ใช้ confirm แล้ว

