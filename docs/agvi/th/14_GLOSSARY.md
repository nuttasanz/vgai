---
part_of: VG-AI product vision (modular)
---

**การนำทาง:** ดู [ภาพรวม](PRODUCT_VISION.md)

# อภิธานศัพท์

คำที่ใช้ข้ามเอกสาร vision แบบ modular

| คำ | ความหมาย |
| --- | --- |
| **AI-managed, verification-governed** | AI อาจเสนอและขับเคลื่อนขั้นตอนเวิร์กโฟลว์ได้ แต่ความน่าเชื่อถือมาจาก evidence, gates, critique, budgets, stop rules และการ escalate ให้มนุษย์ ไม่ใช่จาก authority ของโมเดลเพียงอย่างเดียว |
| **Full product mode** | Flow แบบ end-to-end ที่ AI จัดการ รวมถึง stack/rule generation, multi-role review และ implementation ที่มีกลไกกำกับ ดู [02](02_AI_MANAGED_WORKFLOW.md), [03](03_AI_ORCHESTRATION_AND_MULTI_ROLE_GOVERNANCE.md), [04](04_TECH_STACK_AND_RULE_GENERATION.md) |
| **Chief compatibility mode** | การรัน framework ผ่านไฟล์โปรเจกต์ที่ agent อ่านได้เป็นหลัก เพื่อให้ coding agent ที่มีอยู่แล้วทำตาม workflow ที่มีโครงสร้าง ดู [12](12_CHIEF_COMPARISON.md) |
| **Existing AI coding agents** | Claude Code, Codex, เครื่องมือระดับ Cursor ฯลฯ โดยมองเป็น **เครื่องมือดำเนินงานที่ถูกกำกับ** ไม่ใช่ทั้งผลิตภัณฑ์ |
| **Trust kernel** | meta-rules ขั้นต่ำที่ติดตั้งด้วย **`vgai init`** และอาจมี alias **`/vgai-init`** เพื่อจำกัด autonomy และบังคับให้มี artifact ที่ review ได้ |
| **Guided Verification Gate** | Gate ที่รวม first-pass review จาก AI กับคำถามนำทาง ค่า default และ assumption log สำหรับผู้ใช้ที่มีประสบการณ์น้อย |
| **Build-and-Repair Loop** | รัน checks วิเคราะห์ failure ซ่อมในขอบเขตที่กำหนด แล้วรัน checks ซ้ำ ดู [06](06_BUILD_REPAIR_AND_STOP_CONDITIONS.md) |
| **Stop Conditions** | กฎตามหลักฐานสำหรับตัดสินว่า automated modification ควรหยุดเมื่อใด ดู [06](06_BUILD_REPAIR_AND_STOP_CONDITIONS.md) |
| **Risk-Based Approval** | การจัดระดับความเสี่ยงของการเปลี่ยนแปลงก่อนนำไปใช้ ดู [05](05_VERIFICATION_AND_RISK.md) |
| **Eleven major product layers** | สถาปัตยกรรม **major product layers** ใน [01](01_PRODUCT_PRINCIPLES.md#full-scope-product-vision-eleven-major-product-layers) แยก orchestration, core framework, planning, rules, adapters, build/repair, verification, cost/token, **judgment**, **learning mechanics** และ **platform/productization** |
| **Engineering Thinking and Judgment Layer** | ชั้นที่ 9: นิสัยการคิดเชิงวิพากษ์ การวางกรอบ การตั้งคำถาม trade-offs, risk, verification, security, system impact, stop/continue judgment, human-review judgment, AI skepticism และ decision documentation ดู [07](07_ENGINEERING_THINKING_AND_JUDGMENT.md) |
| **Learning / Skill scaffold** | ชั้นที่ 10: reflection reports/questions, decision log, rubric patterns, skill maps, mentor mode และ repeated reflection ดู [08](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md) |
| **RAG** | Retrieval เสริมสำหรับ guideline ไม่ใช่ contribution หลักของงานวิจัย ดู [05](05_VERIFICATION_AND_RISK.md#role-of-rag) |

