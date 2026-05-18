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

### การเลือก Governance Level

| Task risk level | Governance level ที่ต้องใช้ |
| --- | --- |
| Low | Level 1 สำหรับเก็บ evidence; Level 2 สำหรับ summary และ reporting |
| Medium | Level 1 สำหรับ evidence; Level 2 สำหรับ summary; Level 3 ถ้าแตะ rules, architecture หรือ security decisions |
| High | Level 1 สำหรับ evidence; Level 3 required สำหรับทุก decision — ห้ามใช้ single AI judgment |
| Rule/framework changes | Level 3 เสมอ — ไม่ว่าจะมีกี่ไฟล์ |

Risk classification rubric: [doc 05 — Risk-Based Approval](05_VERIFICATION_AND_RISK.md#risk-based-approval)

### ความหมายของ "บทบาท AI"

**บทบาท AI** คือ prompt template — ชุดคำสั่งที่บอก LLM ให้คิดจากมุมมองเฉพาะและสร้าง output ประเภทที่กำหนด บทบาทไม่ใช่ AI service แยกต่างหาก, API endpoint แยก หรือ model deployment แยก บทบาทสองอย่างขึ้นไปอาจรวมอยู่ใน LLM call เดียวผ่าน multi-section prompt ที่แต่ละส่วนให้ model คิดจากมุมมองต่างกันก่อนสร้าง output รวม

จำนวน LLM calls ถูกกำหนดโดย governance level ไม่ใช่จำนวนบทบาท ที่ Level 3 prompt เดียวอาจให้ model สร้าง proposal ก่อน แล้ววิจารณ์จากมุม security แล้วจัดประเภทผลลัพธ์ — ทั้งหมดใน call เดียว

### กลุ่มบทบาท AI (5 กลุ่ม)

framework กำหนด **5 กลุ่มบทบาท** ภายในกลุ่ม sub-roles อาจรวมเป็น multi-section prompt เดียว หรือแยกเป็น sequential calls เมื่อต้องการ independent context

| กลุ่มบทบาท | Sub-roles ที่รวม | ความรับผิดชอบ |
| --- | --- | --- |
| **Planner** | Product / Requirement Planner, Tech Stack Recommender, Implementation Planner | ทำให้ goals ชัดเจน เลือก technology stack และสร้าง task plans ก่อนเริ่ม implement |
| **Rule Workshop** | Rule Generator, Rule Critic, Security and Risk Reviewer, Rule Scenario Designer, Rule Arbiter | สร้าง candidate rules, วิจารณ์, เพิ่มมุม security, สร้าง trigger scenarios และจัดประเภทแต่ละ rule |
| **Builder** | Builder / Coding Agent | implement การเปลี่ยนแปลงที่อนุมัติแล้วผ่าน coding agent ที่มีอยู่ (Claude Code, Codex, Cursor หรือ agent ที่คล้ายกัน) |
| **Verifier** | Verifier, Repair Agent, Stop-Condition Reviewer | ประเมิน verification gates, เสนอ controlled repairs และตัดสินว่าควรหยุดเมื่อใด |
| **Reflector** | Reflection and Learning Agent | สร้าง engineering reflection, skill progression และ learning-path artifacts |

เมื่อต้องใช้ governance Level 3 Rule Workshop อาจแบ่งเป็น 2 sequential calls เพื่อรักษา independence:

- **Generation call**: Rule Generator + Rule Arbiter — เสนอและจัดประเภทกฎ
- **Critique call**: Rule Critic + Security and Risk Reviewer + Rule Scenario Designer — ท้าทาย ทดสอบ และ validate กฎจาก context แยกต่างหาก

Builder เป็น call แยกเสมอ เพราะโต้ตอบกับ external coding agent tool แทนที่จะทำ internal reasoning

เมื่อการวิจารณ์ต้องเป็น independent (Level 3) critique prompt ไม่ควรได้รับ reasoning trace เต็มของ generation prompt ใน context เป้าหมายคือตรวจจับ assumptions ที่ผิดพลาด ไม่ใช่ validate chain ที่ model เห็นด้วยอยู่แล้ว

โมเดลนี้อาจ implement ได้หลายแบบ เช่น model เดียวที่ prompt เป็นคนละ role sections, sequential calls ที่มี isolated contexts, cloud models หลายตัว, local LLM สำหรับ summarization เสี่ยงต่ำ, deterministic scripts สำหรับ evidence collection หรือ MCP/CLI orchestrator ที่ประสาน components เหล่านี้

