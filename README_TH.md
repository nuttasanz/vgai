# VG-AI

> **เวิร์กโฟลว์วิศวกรรมซอฟต์แวร์แบบ framework-first, AI-managed และ verification-governed
> ที่ประสานงานและกำกับ AI coding agents ที่มีอยู่แล้ว**

---

## VG-AI คืออะไร

VG-AI เป็น workflow framework แบบพกพาได้ที่ประสานงานและกำกับ AI coding agents ที่มีอยู่แล้ว เช่น Claude Code, Codex หรือเครื่องมือระดับ Cursor ผ่านกฎ เวิร์กโฟลว์ สกิล เทมเพลต สคริปต์ verification gates และ learning artifacts

framework ช่วยให้ผู้พัฒนาที่มีประสบการณ์น้อยลดการเชื่อ AI-assisted development แบบตาบอดผ่าน:

- การวิจารณ์หลายบทบาทและการรีวิวกฎที่ AI สร้าง
- deterministic evidence และ verification gates
- การซ่อมแซมที่ควบคุมได้และ stop conditions
- confidence labels และ audit trails
- rollback support และ diff preview
- โครงสร้างช่วยฝึก engineering judgment
- การ escalate ให้มนุษย์รีวิว

safe claim หลักคือ:

> วิสัยทัศน์ผลิตภัณฑ์นี้เสนอเวิร์กโฟลว์วิศวกรรมซอฟต์แวร์แบบ framework-first, AI-managed และ verification-governed ที่ประสานงานและกำกับ AI coding agents ที่มีอยู่แล้ว ช่วยให้ผู้พัฒนาที่มีประสบการณ์น้อยลดการเชื่อ AI-assisted development แบบตาบอดผ่าน multi-role critique, AI-generated rule review, deterministic evidence, verification gates, controlled repair, stop conditions, confidence labels, audit trails, rollback support, engineering judgment scaffolding และ human review escalation

---

## VG-AI ไม่ใช่อะไร

- ไม่ใช่ RAG chatbot
- ไม่ใช่ checklist app
- ไม่ใช่ prompt engineering demo
- ไม่ใช่ AI coding agent ตัวใหม่ที่สร้างจากศูนย์
- ไม่ใช่สิ่งทดแทน Claude Code, Codex, Cursor หรือ agent อื่นที่มีอยู่แล้ว
- ไม่ใช่สิ่งทดแทน senior engineers หรือ security engineers
- ไม่ใช่การรับประกันว่า software ที่ AI สร้างจะปลอดภัยหรือพร้อม production

---

## เอกสาร

เริ่มจากภาพรวม product vision แล้วอ่านเอกสารหลักด้านล่าง

| เอกสาร | คำอธิบาย |
| --- | --- |
| [Product Vision](docs/agvi/th/PRODUCT_VISION.md) | ภาพรวม สิบเอ็ดชั้นผลิตภัณฑ์หลัก และ navigation index |
| [01 Product Principles](docs/agvi/th/01_PRODUCT_PRINCIPLES.md) | scope, research concept, layers, problem, users และ safe claims |
| [02 AI-Managed Workflow](docs/agvi/th/02_AI_MANAGED_WORKFLOW.md) | workflow สำหรับโปรเจกต์เดิมเทียบกับการเริ่มโปรเจกต์ใหม่ |
| [03 Orchestration & Governance](docs/agvi/th/03_AI_ORCHESTRATION_AND_MULTI_ROLE_GOVERNANCE.md) | multi-role governance, AI roles และ operating model |
| [04 Tech Stack & Rules](docs/agvi/th/04_TECH_STACK_AND_RULE_GENERATION.md) | tech stack decision, rule generation lifecycle และ rule registry |
| [05 Verification & Risk](docs/agvi/th/05_VERIFICATION_AND_RISK.md) | verification gates, risk-based approval และ human review handoff |
| [06 Build, Repair & Stop](docs/agvi/th/06_BUILD_REPAIR_AND_STOP_CONDITIONS.md) | build-and-repair loop, stop conditions และ failure mode report |
| [07 Engineering Judgment](docs/agvi/th/07_ENGINEERING_THINKING_AND_JUDGMENT.md) | critical thinking, judgment dimensions และ AI skepticism |
| [08 Learning & Skills](docs/agvi/th/08_LEARNING_REFLECTION_AND_SKILL_DEVELOPMENT.md) | reflection reports, skill progression และ mentor mode |
| [09 Adapters & Framework Files](docs/agvi/th/09_AGENT_ADAPTERS_AND_FRAMEWORK_FILES.md) | agent compatibility, trust kernel และ project rule layers |
| [10 Productization & Platform](docs/agvi/th/10_PRODUCTIZATION_AND_PLATFORM.md) | CLI, Git/PR, web dashboard และ roadmap |
| [11 Research](docs/agvi/th/11_RESEARCH_POSITIONING.md) | research contributions, questions และ evaluation metrics |
| [12 Chief Comparison](docs/agvi/th/12_CHIEF_COMPARISON.md) | ความสัมพันธ์กับ Chief และ sequence diagram ของ compatibility mode |
| [13 Examples & Scenarios](docs/agvi/th/13_EXAMPLES_AND_SCENARIOS.md) | walkthrough scenarios และ expected outputs |
| [Glossary](docs/agvi/th/14_GLOSSARY.md) | definitions และ cross-links |

---

## CLI Quick Start

```bash
vgai init        # ติดตั้ง trust kernel, role contracts, workflow templates และ scripts
vgai discover    # สร้าง product/project profile และ codebase map
vgai plan        # สร้าง acceptance criteria, assumption log และ implementation plan
vgai run         # รัน task workflow ผ่าน coding agent ที่มีอยู่แล้ว
vgai verify      # รัน verification gates และสรุป evidence
vgai report      # สร้าง trust/risk, reflection และ handoff artifacts
```

> Agent slash-command alias: รองรับ `/vgai-init` เป็น alias ทางเลือกสำหรับใช้ใน agent command UIs
