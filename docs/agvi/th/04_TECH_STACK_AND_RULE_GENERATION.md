---
part_of: VG-AI product vision (modular)
---

**การนำทาง:** ดู [ภาพรวม](PRODUCT_VISION.md)

# เทคสแต็กและการสร้างกฎ

ดูเพิ่มเติม [02 AI-Managed Workflow](02_AI_MANAGED_WORKFLOW.md) สำหรับการเริ่มโปรเจกต์ใหม่ และ [09 Agent Adapters and Framework Files](09_AGENT_ADAPTERS_AND_FRAMEWORK_FILES.md) สำหรับ instruction artifacts

---

## โปรเจกต์ใหม่เทียบกับโปรเจกต์เดิม

**โปรเจกต์ใหม่:** ระบบทำ AI-managed tech stack decision ก่อนสร้างกฎ ผู้ใช้ไม่ต้องเลือก stack เอง AI Orchestrator ประสานหลายบทบาทเพื่อเสนอ วิจารณ์ รีวิว และตัดสิน stack จากนั้น technical rules จึงถูกสร้างจาก stack ที่เลือก

**โปรเจกต์เดิม:** ระบบตรวจ tech stack จาก repository เดิมก่อน เช่น framework, language, database, authentication, test tooling และ build tooling แล้วสร้างกฎจาก stack ที่ตรวจพบ ระบบไม่เลือก stack ใหม่ทุก task Tech stack review ใช้เฉพาะเมื่อ task ต้องเปลี่ยนระดับ stack เช่น เพิ่ม database ใหม่ เปลี่ยน framework หรือเพิ่ม dependency ใหญ่

## AI Multi-Role Tech Stack Decision Flow (โปรเจกต์ใหม่)

สำหรับโปรเจกต์ใหม่ ระบบใช้ decision flow หลายบทบาทตามความเสี่ยง เพื่อให้ stack choice ถูกเสนอ ถูก challenge ถูกรีวิวด้าน security และถูก arbitrate ก่อนสร้างกฎ

1. **Product Planner** ระบุ system type, user roles, data sensitivity, deployment expectations และ learning goals จากคำถาม product discovery
2. **Tech Stack Recommender** เสนอ stack จาก product needs, verification capability, maintainability, learning difficulty, deployment assumptions และ tooling
3. **AI Critic** challenge stack ที่เลือกโดยเทียบ alternatives และระบุ risks เช่น setup complexity, production limitations, security concerns หรือ over-engineering
4. **Security and Risk Reviewer** ตรวจ concerns ด้าน authentication, authorization, data, secret, migration และ production-readiness
5. **AI Arbiter** เลือก stack สุดท้ายพร้อม confidence level และเขียน Tech Stack Decision Record
6. **AI Rule Generator** สร้าง stack-aware project rules, workflow rules, security rules, testing rules, production-readiness rules และ learning rules

ถ้าผู้ใช้ขาดความรู้เทคนิค ระบบอาจเลือก safe prototype defaults และบันทึก rationale, assumptions, alternatives, risks, confidence level และ production-review limitations แทนการบังคับให้ผู้ใช้ตัดสินใจทางเทคนิคที่ยังประเมินไม่ได้

## ตัวอย่าง Rough Prompt → Stack ที่ AI เลือก

```text
I want to build a clinic booking system.
Patients can book appointments, cancel, and view history.
Doctors see their schedule. Admins manage users and appointments.
I don't know which stack to use.
```

ระบบถามเฉพาะคำถามระดับ product ที่ผู้ใช้ตอบได้:

```text
1. นี่เป็น prototype ก่อน หรือจะมีผู้ใช้จริงเร็ว ๆ นี้?
2. ระบบจะใช้ข้อมูลผู้ป่วยจริงหรือ dummy data?
3. ผู้ป่วย แพทย์ และ admin ต้องมี login แยกกันหรือไม่?
4. ระบบควรรัน local ก่อนหรือ deploy online เร็ว ๆ นี้?
5. ต้องการ stack ที่เรียนรู้และตรวจสอบง่ายหรือไม่?
```

หลัง product discovery บทบาท AI ประสานกันและเลือก:

```text
Next.js + TypeScript
PostgreSQL
Prisma
Session-based authentication with role support
Tailwind CSS
Vitest for unit tests
Playwright (optional future E2E)
```

## Tech Stack Decision Record

หลัง AI Arbiter เลือก stack สุดท้าย ระบบเขียน Tech Stack Decision Record ซึ่งเป็น governance artifact ที่ต้องมีอยู่ก่อนสร้างกฎ

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

ระบบเป็น role-based web application ที่มี relational data แบบมีโครงสร้าง เช่น users, doctors, appointments, roles และ schedules TypeScript และ Prisma ช่วยให้ maintainability และ verification ดีขึ้น PostgreSQL ถูกเลือกเพราะระบบอาจต้องการ data integrity และ behavior ที่ใกล้ production ในภายหลัง

## Alternatives Considered

- SQLite: ง่ายกว่าสำหรับ local prototype แต่ไม่เหมาะเท่า PostgreSQL สำหรับ production concurrency
- MongoDB: ไม่สอดคล้องเท่ากับ structured relational scheduling data
- Laravel: ใช้ได้ แต่ทิศทางผลิตภัณฑ์นี้ให้ความสำคัญกับ compatibility ของ AI coding agents ใน ecosystem TypeScript

## Assumptions

- Prototype-first project
- ผู้ใช้ต้องการ stack ที่เรียนรู้และตรวจสอบได้
- Patient data อาจ sensitive

## Risks

- PostgreSQL setup อาจยากสำหรับผู้เริ่มต้น
- Authentication และ role design ต้อง review ก่อน production

## Confidence

Medium-high สำหรับ prototype และ learning use; Medium สำหรับ production use จนกว่าจะถูก senior developer review
```

## วงจรชีวิตของกฎที่ AI สร้าง

เพราะ vision อนุญาตให้ AI สร้างกฎ กฎจึงต้องมี lifecycle และไม่ควรถูก enforce เพียงเพราะถูก generate ระบบควรกำกับกฎผ่าน generation, critique, testing, arbitration, enforcement, monitoring และ update

1. **Trust Kernel Installed** — `vgai init` ติดตั้ง meta-rules ขั้นต่ำที่กำกับ AI autonomy และทำให้ output review/trust ได้
2. **Project and Product Discovery** — ระบุ project type, users, workflows, data sensitivity, deployment assumptions, learning goals และ constraints
3. **Tech Stack Decision** — โปรเจกต์ใหม่ใช้หลายบทบาทเลือก stack; โปรเจกต์เดิมตรวจ stack ปัจจุบันและตัดสินใหม่เฉพาะเมื่อ task ต้องเปลี่ยนระดับ stack
4. **Candidate Rule Generation** — AI สร้าง candidate rules สำหรับ workflow, project conventions, security, testing, production readiness, cost/token, repair, stop conditions และ learning
5. **Rule Critique** — AI role แยกตรวจ unsupported rules, over-broad rules, contradictions, false positives/negatives และกฎที่ควรเป็น guided questions
6. **Security and Risk Review** — รีวิวกฎที่ sensitive ด้าน authentication, authorization, deletion, data, secrets, migration, dependency และ production risks
7. **Rule Scenario Testing** — สร้างตัวอย่างว่า rule ควร trigger หรือไม่ และอาจใช้ scripts/structured checks ประเมิน behavior
8. **Rule Arbitration** — จัดกฎเข้า rule registry
9. **Instruction Artifact Generation** — สร้างหรืออัปเดต `AGENTS.md`, `CLAUDE.md`, skill files, workflow files และ templates จาก registry ที่กำกับแล้ว พร้อม Safety Review
10. **Runtime Enforcement and Evidence Collection** — ใช้กฎระหว่าง planning, implementation, verification, repair, reporting และ reflection พร้อมบันทึก evidence
11. **Rule Update Loop** — หลังแต่ละ task AI อาจเสนอ rule updates จาก failures, repeated risks, false positives, missed checks, user confusion หรือ human review feedback โดย updates ต้องกลับเข้า lifecycle ก่อน active

## Rule Registry Categories

| Category | Description |
| --- | --- |
| **Active rules** | กฎที่ผ่าน critique, risk review และ scenario testing แล้ว และ enforce ใน workflow |
| **Warning rules** | แจ้งเตือนแต่ไม่ block เหมาะกับ concern จริงที่ขึ้นกับ context |
| **Guided-question rules** | แปลง decision ที่ไม่แน่นอนเป็นคำถามนำทางพร้อม default และ assumption log |
| **Human-review trigger rules** | flag decision หรือ artifact ที่ต้อง senior/security/instructor/production review |
| **Experimental rules** | กฎที่อยู่ระหว่าง observation เพื่อเรียนรู้หรือทดสอบ behavior |
| **Rejected rules** | กฎที่ unsupported, กว้างเกิน, noisy หรือขัดกับ evidence |
| **Deprecated rules** | กฎที่เคย active แต่ไม่ applicable แล้วเพราะ stack, scope หรือ direction เปลี่ยน |

ตัวอย่างจาก clinic booking project:

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
- "All code must have 100% test coverage" — กว้างเกินไปสำหรับ prototype scope
```

## AI-Generated AGENTS.md / CLAUDE.md Review Flow

Instruction artifacts เช่น `AGENTS.md` และ `CLAUDE.md` สร้างจาก governed rule registry และต้องถูก Safety Reviewer รีวิวก่อนใช้ เพราะไฟล์ที่ผิดอาจทำให้ workflow ทั้งหมดทำงานผิด

1. **Rule Arbiter** รวม rule registry เป็น categories สุดท้าย
2. **AI Instruction Generator** สร้าง `AGENTS.md`, `CLAUDE.md` และ instruction files เฉพาะ agent จาก active/warning rules
3. **AI Safety Reviewer** ตรวจว่าไฟล์ที่สร้างไม่ bypass verification gates, ไม่เปิดทาง repair แบบ uncontrolled/unlimited, ไม่ claim unsafe autonomy, ไม่อ้าง production/security โดยไม่มี evidence และอ้าง stop conditions/human-review triggers ถูกต้อง
4. ถ้าพบปัญหา ให้ revise และ re-review ก่อนเขียนลงโปรเจกต์
5. เขียน instruction files ที่อนุมัติแล้วลง repository

## Rule Metadata

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

