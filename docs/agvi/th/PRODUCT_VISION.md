---
part_of: VG-AI product vision (modular)
---

**การนำทาง:**

- [ภาพรวม](PRODUCT_VISION.md)
- [01 หลักการ](01_PRODUCT_PRINCIPLES.md)
- [02 เวิร์กโฟลว์](02_AI_MANAGED_WORKFLOW.md)
- [03 การประสานงาน](03_AI_ORCHESTRATION_AND_MULTI_ROLE_GOVERNANCE.md)
- [04 เทคสแต็กและกฎ](04_TECH_STACK_AND_RULE_GENERATION.md)
- [05 การตรวจสอบ](05_VERIFICATION_AND_RISK.md)
- [06 การ build และซ่อมแซม](06_BUILD_REPAIR_AND_STOP_CONDITIONS.md)
- [07 วิจารณญาณทางวิศวกรรม](07_ENGINEERING_THINKING_AND_JUDGMENT.md)
- [08 การเรียนรู้](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md)
- [09 อะแดปเตอร์](09_AGENT_ADAPTERS_AND_FRAMEWORK_FILES.md)
- [10 แพลตฟอร์ม](10_PRODUCTIZATION_AND_PLATFORM.md)
- [11 งานวิจัย](11_RESEARCH_POSITIONING.md)
- [12 Chief](12_CHIEF_COMPARISON.md)
- [13 ตัวอย่าง](13_EXAMPLES_AND_SCENARIOS.md)
- [อภิธานศัพท์](14_GLOSSARY.md)
- [15 ตัวอย่าง Concrete](15_CONCRETE_EXAMPLES.md)

# วิสัยทัศน์ผลิตภัณฑ์ (ภาพรวม)

โฟลเดอร์นี้เก็บ **วิสัยทัศน์ผลิตภัณฑ์แบบครบขอบเขต** โดยแยกเป็นเอกสารย่อยที่โฟกัสเฉพาะด้าน ผลิตภัณฑ์นี้ **ไม่ใช่** เว็บแอปเป็นหลัก และไม่ใช่ coding agent ตัวใหม่ แต่เป็นระบบเวิร์กโฟลว์แบบ **พกพาได้, ยึด framework-first, ให้ AI จัดการ, และให้การตรวจสอบเป็นผู้กำกับความน่าเชื่อถือ** เพื่อ **ประสานงานและกำกับ coding agent ที่มีอยู่แล้ว** เช่น Claude Code, Codex หรือเครื่องมือระดับ Cursor ผ่านกฎ เวิร์กโฟลว์ สกิล เทมเพลต สคริปต์ verification gates และ artifact สำหรับการเรียนรู้

**Full product mode** เน้นการตั้งค่าโปรเจกต์ที่ AI จัดการ การสร้าง stack และกฎ การวิจารณ์หลายบทบาท และการดำเนินงานที่มีกลไกกำกับ ส่วน **Chief compatibility mode** เน้นคำสั่งสำหรับ agent ภายในโปรเจกต์ เพื่อให้ผู้ใช้ที่มีประสบการณ์สามารถรันเวิร์กโฟลว์แบบมีโครงสร้างกับ agent ที่ใช้อยู่แล้ว

สถาปัตยกรรมถูกอธิบายเป็น **สิบเอ็ดชั้นผลิตภัณฑ์หลัก** ใน [01 Product Principles](01_PRODUCT_PRINCIPLES.md#full-scope-product-vision-eleven-major-product-layers)

## อ่านต่อ

| เอกสาร | เนื้อหา |
| --- | --- |
| [01 Product Principles](01_PRODUCT_PRINCIPLES.md) | ขอบเขต แนวคิดวิจัย สิบเอ็ดชั้นผลิตภัณฑ์หลัก ปัญหา/ผู้ใช้ สิ่งที่ผลิตภัณฑ์เป็นและไม่เป็น และ claim ที่ปลอดภัย |
| [02 AI-Managed Workflow](02_AI_MANAGED_WORKFLOW.md) | เวิร์กโฟลว์สำหรับโปรเจกต์เดิม/งานเฉพาะ เทียบกับการเริ่มโปรเจกต์ใหม่ และแผนภาพเวิร์กโฟลว์รวม |
| [03 Orchestration & Governance](03_AI_ORCHESTRATION_AND_MULTI_ROLE_GOVERNANCE.md) | โมเดลการทำงานที่ AI จัดการ การกำกับหลายบทบาทตามความเสี่ยง และบทบาทของ AI |
| [04 Tech Stack & Rules](04_TECH_STACK_AND_RULE_GENERATION.md) | วงจรชีวิตกฎที่ AI สร้าง และ metadata ของกฎ |
| [05 Verification & Risk](05_VERIFICATION_AND_RISK.md) | Guided gates, approval ตามความเสี่ยง, โครงสร้าง handoff ให้มนุษย์รีวิว, มิติการตรวจสอบ และบทบาทของ RAG |
| [06 Build, Repair, Stop](06_BUILD_REPAIR_AND_STOP_CONDITIONS.md) | Build-and-repair, stop conditions, ชั้น cost/token, versioning/diff/rollback และ failure mode report |
| [07 Engineering Judgment](07_ENGINEERING_THINKING_AND_JUDGMENT.md) | การคิดเชิงวิพากษ์ การวางกรอบปัญหา การตั้งคำถาม มิติของวิจารณญาณ ความสงสัยต่อ AI และการบันทึกการตัดสินใจ |
| [08 Learning & Skills](08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md) | รายงานและคำถาม reflection, decision log, rubric, skill progression, repeated reflection, mentor mode และ post-task learning |
| [09 Adapters & Framework Files](09_AGENT_ADAPTERS_AND_FRAMEWORK_FILES.md) | เส้นทาง solo-first, layout `.vgai`, ความเข้ากันได้กับ agent, trust kernel และกฎโปรเจกต์ |
| [10 Productization & Platform](10_PRODUCTIZATION_AND_PLATFORM.md) | Git/PR, CLI, dashboard, integrations, audit, secrets, reviewer, dashboard, team mode และ roadmap |
| [11 Research](11_RESEARCH_POSITIONING.md) | Contributions, research questions และ evaluation metrics |
| [12 Chief Comparison](12_CHIEF_COMPARISON.md) | ความสัมพันธ์กับ Chief และ sequence diagram ของ Chief compatibility mode |
| [13 Examples & Scenarios](13_EXAMPLES_AND_SCENARIOS.md) | walkthrough แบบ Chief-style และ AI-managed สำหรับระบบจองคลินิก ผลลัพธ์ที่คาดหวัง และ use case |
| [14 Glossary](14_GLOSSARY.md) | คำจำกัดความและ cross-links |
| [15 Concrete Examples](15_CONCRETE_EXAMPLES.md) | Trust Kernel v0.1 (18 กฎ), AGENTS.md และ CLAUDE.md ไฟล์อ้างอิงพร้อมคำอธิบาย |

## ตำแหน่งผลิตภัณฑ์ในหนึ่งประโยค

> **AI อาจจัดการเวิร์กโฟลว์ได้ แต่การตรวจสอบเป็นสิ่งที่กำกับว่าเวิร์กโฟลว์นั้นเชื่อถือได้หรือไม่**

ก่อนหน้านี้ repository เก็บ vision ขนาดใหญ่ไฟล์เดียว ตอนนี้ไฟล์นั้นถูกแทนด้วยโมดูล `docs/` นี้ พร้อม pointer สั้น ๆ ที่ root ของ repository

