---
part_of: VG-AI product vision (modular)
---

**การนำทาง:** ดู [ภาพรวม](PRODUCT_VISION.md)

# หลักการผลิตภัณฑ์

เอกสารนี้กำหนด scope, research concept, product layers, problem, target users และ safe claims ของ VG-AI

VG-AI ไม่ใช่เพียงเว็บแอป และไม่ใช่ coding agent ตัวใหม่ แต่เป็น framework-first workflow system ที่ช่วยให้ผู้ใช้ควบคุมและตรวจสอบ AI coding agents ที่มีอยู่แล้วผ่าน rules, workflows, verification gates, learning artifacts และ governance

หลักการสำคัญ:

- AI อาจ manage workflow ได้ แต่ verification เป็นสิ่งที่กำกับ trust
- ใช้ existing AI coding agents เป็น governed execution tools
- เริ่มแบบ solo-first และ project-local ก่อน platform เต็มรูปแบบ
- ผู้ใช้ประสบการณ์น้อยต้องได้รับ guided questions, defaults, assumption logs และ human review paths
- หลีกเลี่ยงการ claim correctness, security หรือ production readiness โดยไม่มี evidence
- แยก deterministic evidence ออกจาก AI interpretation
- ให้ stop conditions สำคัญพอ ๆ กับ repair
- เปลี่ยน AI-assisted development ให้เป็น learning process ไม่ใช่เพียง code generation

# Research Concept

แนวคิดวิจัยคือระบบ workflow ที่ช่วยผู้พัฒนาที่มีประสบการณ์น้อยใช้ AI coding agents อย่างเป็นระบบและปลอดภัยขึ้น โดยเพิ่ม verification, risk reporting, stop/repair decisions และ reflection mechanisms ที่ฝึก judgment

โจทย์ไม่ใช่ “AI เขียน code ได้หรือไม่” แต่คือ:

- ผู้ใช้รู้ได้อย่างไรว่าควรเชื่อ output ของ AI หรือไม่?
- ระบบช่วยค้น missing requirements, risks และ verification gaps ได้อย่างไร?
- ระบบช่วยให้ผู้ใช้เรียนรู้ engineering judgment แทนการ copy code ได้อย่างไร?
- ระบบควรหยุด AI-driven modification เมื่อใด?

# Full-Scope Product Vision (eleven major product layers)

สถาปัตยกรรมแบบครบขอบเขตแบ่งเป็นสิบเอ็ดชั้นหลัก:

1. **AI Orchestration Layer** — ประสาน roles, workflows, agent calls และ tool calls
2. **Core Framework / Trust Kernel Layer** — meta-rules ขั้นต่ำ, autonomy constraints, evidence requirements และ stop rules
3. **Requirement and Planning Layer** — product discovery, requirement analysis, assumptions, acceptance criteria และ task planning
4. **Tech Stack and Rule Generation Layer** — tech stack decision, rule lifecycle, rule registry และ instruction artifacts
5. **Agent Adapter Layer** — `AGENTS.md`, `CLAUDE.md`, skills, scripts, MCP/CLI และ compatibility กับ agents เดิม
6. **Build and Repair Layer** — build/test execution, error analysis, bounded repair และ failure reports
7. **Verification and Risk Layer** — gates, risk-based approval, severity, trust/risk reports และ human review handoff
8. **Cost and Token Optimization Layer** — context selection, caching, compression, model routing และ budgets
9. **Engineering Thinking and Judgment Layer** — critical thinking, framing, risk, verification, stop/continue judgment และ decision documentation
10. **Learning, Reflection, and Skill Development Layer** — reflection reports/questions, rubrics, skill maps, mentor mode และ learning paths
11. **Productization and Platform Layer** — CLI, Git/PR, dashboard, integrations, audit, secret protection, team/organization support และ roadmap

ชั้นเหล่านี้แยก concerns เพื่อให้ระบบไม่พึ่ง AI authority เพียงอย่างเดียว และทำให้แต่ละส่วน verify, review และ evolve ได้

# Main Problem

ผู้พัฒนาที่มีประสบการณ์น้อยสามารถใช้ AI coding agents เพื่อสร้าง code ได้เร็ว แต่ยังมักขาดวิจารณญาณในการประเมินว่า:

- requirement เพียงพอหรือยัง
- architecture เหมาะสมหรือไม่
- code ที่ AI สร้างปลอดภัยหรือ maintainable หรือไม่
- tests/checks ที่มีพอหรือไม่
- ควร repair ต่อหรือหยุด
- เมื่อใดต้องให้ senior/security/instructor review
- decision และ trade-offs ควรถูกบันทึกอย่างไร

ผลลัพธ์คือผู้ใช้อาจ trust AI output เกินจริง สร้าง code ที่ดูใช้งานได้แต่มี security/production risks หรือพลาดโอกาสเรียนรู้หลักการวิศวกรรมที่อยู่เบื้องหลัง

# Target Users

ผู้ใช้เป้าหมาย:

- นักศึกษาและผู้เริ่มต้นที่ใช้ AI ช่วยทำ software projects
- junior developers ที่ต้องการ workflow แบบมี guardrails
- solo developers ที่ใช้ Claude Code, Codex, Cursor-class tools หรือ agent อื่น
- instructors/mentors ที่ต้องการ artifact สำหรับ review และ learning

# What This Project Is

โปรเจกต์นี้คือ:

- framework-first workflow system สำหรับ AI-assisted development
- governance layer สำหรับ existing AI coding agents
- verification-gated process สำหรับ requirement, implementation, repair และ production readiness
- learning scaffold ที่ฝึก engineering judgment ผ่าน reflection, rubrics และ skill progression
- project-local package ที่เริ่มได้ด้วย files/scripts และขยายเป็น CLI/dashboard/platform ได้
- research/product vision ที่เน้น reliability, safety, human review และ learning support

# What This Project Is Not

โปรเจกต์นี้ไม่ใช่:

- replacement ของ Claude Code, Codex หรือ coding agent อื่น
- guarantee ว่า AI-generated code ถูกต้อง ปลอดภัย หรือ production-ready
- tool ที่ทำให้ junior developer กลายเป็น senior โดยอัตโนมัติ
- web app เป็นแกนหลักตั้งแต่แรก
- RAG-only system
- system ที่ควร bypass human review สำหรับ high-risk decisions

# Safe Claim

claim ที่ปลอดภัยคือ:

> VG-AI เสนอ framework แบบ AI-managed และ verification-governed เพื่อช่วยผู้พัฒนาที่มีประสบการณ์น้อยใช้ AI coding agents อย่างมีโครงสร้างมากขึ้น ตรวจสอบ output อย่างเป็นระบบมากขึ้น และฝึก software engineering judgment ผ่าน reports, gates, reflection และ human review handoff

ระบบอาจช่วยเพิ่ม reliability และ learning outcomes ได้ แต่ต้องประเมินด้วย evidence และไม่ควร claim ว่ารับประกัน correctness, security หรือ production readiness

