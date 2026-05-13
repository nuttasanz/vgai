---
part_of: VG-AI product vision (modular)
---

**การนำทาง:** ดู [ภาพรวม](PRODUCT_VISION.md)

# ตัวอย่างและสถานการณ์

เอกสารนี้แสดงตัวอย่างการใช้ framework ทั้งแบบ Chief-style และแบบ AI-managed ผ่าน use case ระบบจองคลินิก

---

# Example Chief-Style Project Creation Scenario

## Step 1: Create or open a project

ผู้ใช้สร้างโปรเจกต์ใหม่หรือเปิด repository เดิมในเครื่อง local

## Step 2: Initialize the framework

ผู้ใช้รัน:

```text
vgai init
```

หรือใน agent UI ที่รองรับ:

```text
/vgai-init
```

ระบบเพิ่ม framework files เช่น `.vgai/`, `AGENTS.md`, `CLAUDE.md`, workflows, templates และ scripts

## Step 3: Start an existing AI coding agent

ผู้ใช้เปิด Claude Code, Codex หรือ agent อื่นใน project directory agent อ่าน framework instructions และรู้ว่าต้องไม่ implement ทันทีโดยไม่มี requirements, acceptance criteria และ approval

## Step 4: Provide the initial project idea

ผู้ใช้บอก:

```text
I want to build a clinic booking system.
Patients can book appointments, cancel, and view history.
Doctors see their schedule. Admins manage users and appointments.
```

## Step 5: The agent must not code immediately

agent ต้องถามคำถามนำทางก่อน เช่น:

- นี่เป็น prototype หรือจะใช้กับ real users soon?
- ใช้ real patient data หรือ dummy data?
- ผู้ใช้แต่ละ role ต้อง login แยกกันหรือไม่?
- cancellation มี policy เช่น cut-off time หรือไม่?
- ต้อง deploy online หรือรัน local ก่อน?

ถ้าผู้ใช้ไม่รู้คำตอบ agent อาจเสนอ prototype defaults และบันทึก assumptions

## Step 6: The framework records assumptions

```markdown
# Assumption Log

## Authentication

- Default: role-based login for patient, doctor, and admin
- Risk: production authentication requires review

## Appointment cancellation

- Default: patients can cancel future appointments only
- Risk: clinic policy must be confirmed before production
```

## Step 7: The agent implements only after approval

agent แสดง acceptance criteria, plan และ risk level ให้ผู้ใช้ approve ก่อน implement ตัวอย่าง criteria:

- patient can book appointment
- patient can cancel future appointment
- doctor can view schedule
- admin can manage users and appointments
- authorization is enforced server-side
- build/typecheck pass

## Step 8: The framework stops unnecessary AI changes

หลัง checks ผ่านและ findings ที่เหลือ low severity ระบบใช้ stop conditions เพื่อหยุดการแก้ต่อ แม้ AI ยังสามารถ refactor หรือ polish ต่อได้

## Step 9: The user receives learning artifacts

ระบบสร้าง:

- Trust/Risk Report
- Engineering Reflection Report
- Decision Log update
- Skill Progression update
- suggested next task from Mentor Mode

# Example AI-Managed New Project Creation Scenario

## Step 1: User provides a product idea

ผู้ใช้บอกว่าต้องการสร้าง clinic booking system แต่ไม่รู้ stack ที่ควรใช้

## Step 2: AI asks only context questions the user can answer

AI ถาม product-level questions:

1. prototype หรือ real users soon?
2. real patient data หรือ dummy data?
3. roles ต้องแยก login หรือไม่?
4. local first หรือ deploy soon?
5. อยากเรียน stack ที่ verify ง่ายหรือไม่?

## Step 3: AI roles select the technology stack

บทบาท AI ทำงานร่วมกัน:

- Product Planner ระบุ user roles และ workflows
- Tech Stack Recommender เสนอ Next.js + TypeScript + PostgreSQL + Prisma
- AI Critic เทียบ SQLite, MongoDB, Laravel และ risks
- Security Reviewer flag patient data, auth และ role design
- AI Arbiter เลือก stack พร้อม confidence และ assumptions

## Step 4: AI writes the Tech Stack Decision Record

```markdown
# Tech Stack Decision Record

## Selected Stack

- Framework: Next.js (App Router)
- Language: TypeScript
- Database: PostgreSQL
- ORM: Prisma
- Authentication: Session-based with role support
- CSS: Tailwind CSS
- Testing: Vitest, Playwright optional

## Why This Stack Was Selected

ระบบมี roles และ relational scheduling data จึงเหมาะกับ TypeScript, Prisma และ PostgreSQL

## Alternatives Considered

- SQLite: ง่ายกว่าแต่ production concurrency อ่อนกว่า
- MongoDB: ไม่เหมาะเท่ากับ structured scheduling data
- Laravel: ใช้ได้ แต่ product direction เน้น TypeScript agent compatibility

## Assumptions

- prototype-first
- patient data อาจ sensitive
- user ต้องการ stack ที่เรียนรู้และ verify ได้

## Risks

- PostgreSQL setup ยากกว่า
- auth/role design ต้อง review ก่อน production

## Confidence

Medium-high สำหรับ prototype และ learning; medium สำหรับ production จนกว่าจะ review
```

## Step 5: AI generates and reviews project rules

AI Rule Generator สร้าง project rules แล้ว Rule Critic, Security Reviewer และ Rule Scenario Designer รีวิว ตัวอย่าง active rules:

- ห้าม implement ก่อนมี acceptance criteria
- protected actions ต้อง enforce server-side authorization
- database schema changes ต้องมี migration notes
- หลัง implementation ต้องรัน checks ที่มี
- automated modification ต้องหยุดเมื่อ stop conditions เข้าเงื่อนไข

## Step 6: AI generates `AGENTS.md` and `CLAUDE.md`

ระบบสร้าง instruction files จาก approved rule registry แล้ว Safety Reviewer ตรวจว่าไม่ bypass gates, ไม่อนุญาต repair ไม่จำกัด และไม่ claim production/security โดยไม่มี evidence

## Step 7: AI begins implementation under governed rules

หลัง setup, rules และ instructions ผ่าน governance แล้ว coding agent จึงเริ่ม implement ตาม approved plan

# Expected Output of the System

ผลลัพธ์ที่ควรได้:

- project-local framework files
- Tech Stack Decision Record
- rule registry และ instruction files
- acceptance criteria
- implementation plan
- risk classification และ approval record
- diff preview
- build/typecheck/lint/test evidence
- Trust/Risk Report
- Engineering Reflection Report
- Decision Log
- Skill Progression update
- Human Review Handoff ถ้าจำเป็น

# Example Use Case

งาน: เพิ่มการลบ appointment เฉพาะ admin

ระบบควร:

1. ตรวจ requirement และถามว่า soft delete หรือ permanent delete
2. ระบุ risk ด้าน authorization และ data deletion
3. สร้าง acceptance criteria สำหรับ admin, normal user, unauthenticated user และ API-level authorization
4. ขอ approval เพราะเป็น medium/high risk หากแตะ deletion/data
5. ให้ agent implement เฉพาะ scope ที่อนุมัติ
6. รัน build/typecheck/tests
7. ถ้า fail ให้ repair ใน budget
8. ถ้า pass ให้ stop เมื่อไม่มี high findings เหลือ
9. สร้าง Trust/Risk Report และ Reflection Report
10. flag human review ถ้า production deletion policy หรือ sensitive patient data ยังไม่ confirm

