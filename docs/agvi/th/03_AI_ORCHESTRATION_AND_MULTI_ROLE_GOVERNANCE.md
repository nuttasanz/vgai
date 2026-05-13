---
part_of: VG-AI product vision (modular)
---

**การนำทาง:** ดู [ภาพรวม](PRODUCT_VISION.md)

# การประสานงาน AI และการกำกับหลายบทบาท

เอกสารนี้อธิบายว่า framework **ประสานงานและกำกับ** งานของ AI อย่างไร รวมถึงข้อเสนอจาก coding agent ที่มีอยู่แล้ว โดยใช้การรีวิวหลายบทบาทตามความเสี่ยง สำหรับ **สิบเอ็ดชั้นผลิตภัณฑ์หลัก** ดู [01 Product Principles — Full-Scope Product Vision](01_PRODUCT_PRINCIPLES.md#full-scope-product-vision-eleven-major-product-layers)

---

## โมเดลการทำงานแบบ AI-Managed, Verification-Governed

วิสัยทัศน์ผลิตภัณฑ์แบบครบขอบเขตขยายแนวคิด framework-first ไปเป็น **โมเดลการทำงานที่ AI จัดการ แต่ถูกกำกับด้วยการตรวจสอบ** ผลิตภัณฑ์ไม่ควรเป็นเพียงไฟล์ framework แบบ static ที่ coding agent ทำตาม เมื่อ mature เต็มที่ ระบบควรใช้ AI เพื่อสร้าง รีวิว ปรับปรุง และใช้ workflow rules, project rules, technical rules, agent instructions, verification policies, reports และ learning artifacts ที่จำเป็นสำหรับโปรเจกต์ใหม่

ระบบจึงควรรองรับ autonomy ที่ AI จัดการ แต่ autonomy นี้ต้องถูกกำกับ ไม่ใช่เชื่อแบบตาบอด AI agent ตัวเดียวไม่ควรสร้างกฎ ทำตามกฎของตัวเอง ตรวจสอบตัวเอง แล้วอ้างว่าผลลัพธ์น่าเชื่อถือ ระบบควรใช้ **risk-based multi-role decision flow** ที่บทบาท AI แยกกันเสนอ วิจารณ์ รีวิวความเสี่ยง ออกแบบ scenario ของกฎ ตัดสินขั้นสุดท้าย และเก็บ evidence

หลักการทำงานคือ:

> AI อาจจัดการเวิร์กโฟลว์ได้ แต่การตรวจสอบเป็นสิ่งที่กำกับว่าเวิร์กโฟลว์นั้นเชื่อถือได้หรือไม่

ระบบอาจให้ AI ทำสิ่งต่อไปนี้:

- เลือก technology stack ที่เหมาะกับโปรเจกต์ใหม่
- สร้าง `AGENTS.md`, `CLAUDE.md`, project rules, workflow rules และ task rules
- รีวิวและวิจารณ์ artifact ที่ตัวเองสร้างผ่านบทบาท AI ที่แยกกัน
- จัดระดับ rule confidence, enforcement level และ review status
- ตัดสินใจเดินหน้าด้วย prototype assumptions เมื่อเหมาะสม
- รันหรือขอ deterministic checks เช่น build, typecheck, lint และ tests
- ซ่อม implementation failures ภายใน budget ที่ควบคุมได้
- หยุดเมื่อ evidence แสดงว่าการแก้ไขเพิ่มโดย AI ไม่จำเป็นหรือเสี่ยง
- สร้าง trust/risk, failure, reflection, decision-log และ human-review artifacts
- เสนอ rule updates จาก project failures และ learning evidence ที่สังเกตได้

แต่ระบบต้องไม่ถือว่าการตัดสินใจที่ AI สร้างถูกต้องโดยอัตโนมัติ การตัดสินใจสำคัญควรถูกกำกับด้วยองค์ประกอบเหล่านี้ร่วมกัน:

- evidence จากโปรเจกต์
- assumptions ที่ระบุชัดเจน
- alternative options ที่พิจารณาแล้ว
- rationale และ trade-offs
- confidence level
- risk classification
- AI critique ที่ independent หรือแยกบทบาท
- deterministic check results เมื่อทำได้
- scenario tests สำหรับกฎ
- audit trail และ rollback support
- human review flags สำหรับเรื่องเสี่ยงสูงหรือไม่แน่นอน

## การกำกับหลายบทบาทตามความเสี่ยง

ไม่ใช่ทุกขั้นตอนต้องมี AI reviewer หลายตัว งาน deterministic เช่น อ่าน file tree, ตรวจ package scripts, รัน build commands หรือเก็บ git diffs ควรพึ่ง tools/scripts เป็นหลัก งานสรุปหรือ formatting report ที่เสี่ยงต่ำอาจใช้ AI บทบาทเดียวพร้อม template validation ส่วน multi-role AI review ควรใช้กับการตัดสินใจที่กระทบทิศทางโปรเจกต์ security posture production readiness หรือพฤติกรรมของ agent ในอนาคต

framework ควรใช้ **risk-based multi-role governance**:

- **Level 1: Deterministic-only** — file discovery, package parsing, git diff, build, lint, typecheck, tests และ evidence ที่เครื่องมือสังเกตได้
- **Level 2: Single AI with validation** — summaries เสี่ยงต่ำ report drafts, log compression และ template filling
- **Level 3: Multi-role AI review** — tech-stack selection, architecture decisions, rule generation, `AGENTS.md` / `CLAUDE.md` generation, security-sensitive changes, risk classification, repair strategy, stop-condition decisions และ final trust/risk reporting

บทบาท AI ที่เป็นไปได้:

- **Product / Requirement Planner** — ทำให้ product goals, users, workflows และ acceptance criteria ชัดเจน
- **Tech Stack Recommender** — เสนอ stack จาก requirements, learning needs, verification capability และ deployment assumptions
- **Rule Generator** — สร้าง candidate workflow, project, technical, security, testing และ learning rules
- **Rule Critic** — ท้าทายกฎที่กว้างเกินไป ไม่มีหลักฐาน ขัดแย้ง หรือเสี่ยง
- **Security and Risk Reviewer** — โฟกัส authentication, authorization, sensitive data, deletion, secrets, migrations และ production-sensitive decisions
- **Rule Scenario Designer** — สร้างตัวอย่างว่า rule ควร trigger และไม่ควร trigger เมื่อใด
- **Rule Arbiter** — จัดประเภทกฎเป็น active, warning, guided-question, human-review-trigger, rejected หรือ experimental
- **Implementation Planner** — แปลง accepted rules และ requirements เป็น task plans
- **Builder / Coding Agent** — implement การเปลี่ยนแปลงผ่าน Claude Code, Codex, agent แบบ Cursor หรือ agent ในอนาคต
- **Verifier** — ประเมิน build/test evidence, verification gates และ acceptance criteria
- **Repair Agent** — เสนอและใช้ controlled repairs เมื่อ checks fail
- **Stop-Condition Reviewer** — ตัดสินว่าการแก้ไขเพิ่มโดย AI ยังมี evidence รองรับหรือไม่
- **Reflection and Learning Agent** — สร้าง engineering reflection, skill progression และ learning-path artifacts

โมเดลหลายบทบาทนี้อาจ implement ได้หลายแบบ เช่น model เดียวที่ prompt เป็นคนละ role, calls แยกบริบท, cloud models หลายตัว, local LLM สำหรับ summary/log compression เสี่ยงต่ำ, deterministic scripts สำหรับ evidence หรือ MCP/CLI orchestrator ที่ประสาน components เหล่านี้

