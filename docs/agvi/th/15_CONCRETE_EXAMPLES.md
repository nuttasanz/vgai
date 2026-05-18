---
part_of: VG-AI product vision (modular)
---

**การนำทาง:** ดู [ภาพรวม](PRODUCT_VISION.md)

# ตัวอย่างเชิง Concrete และไฟล์อ้างอิง

เอกสารนี้อธิบายไฟล์อ้างอิงที่ใช้งานได้จริงในโฟลเดอร์ `examples/` ที่ root ของ
repository ไฟล์เหล่านี้คือ artifacts จริงที่ `vgai init` จะ copy ไปติดตั้งใน
project ของผู้ใช้เมื่อ install framework

---

## มีอะไรอยู่ใน `examples/`

| ไฟล์ | คืออะไร | ติดตั้งไปที่ |
| --- | --- | --- |
| `trust-kernel-v0.1.md` | กฎ governance หลัก 18 ข้อ | `.vgai/core/trust-kernel.md` |
| `AGENTS.md` | instruction file สำหรับ agent (Codex/Cursor/ทั่วไป) | `AGENTS.md` (project root) |
| `CLAUDE.md` | instruction file สำหรับ Claude Code โดยเฉพาะ | `CLAUDE.md` (project root) |

หลัง install แล้ว project ของผู้ใช้จะมีไฟล์เหล่านี้ AI coding agent ใดก็ตามที่เปิดใน
project นั้นจะอ่านไฟล์เหล่านี้และปรับพฤติกรรมตามนั้น

---

## กฎ Trust Kernel ทำงานยังไง

แต่ละกฎมี YAML metadata block ตามด้วยคำอธิบายภาษาอังกฤษ (กฎเขียนเป็น EN
เพื่อให้ AI agent อ่านได้แม่นที่สุด)

```yaml
id: TK-001
name: No Implementation Without Acceptance Criteria
category: active
tier: trust-kernel
enforcement: block
```

**ความหมายของแต่ละ field:**

| Field | ค่าที่เป็นไปได้ | ความหมาย |
| --- | --- | --- |
| `id` | TK-NNN | identifier ที่ unique และไม่เปลี่ยนแปลงข้ามเวอร์ชัน |
| `category` | active, warning, guided-question, human-review-trigger, experimental, rejected, deprecated | หมวดหมู่ใน rule registry (ดู doc 04) |
| `tier` | trust-kernel, ai-generated, task | ลำดับ priority — trust-kernel ชนะทุก tier |
| `enforcement` | block, escalate, warn, guide, log, note | สิ่งที่ agent ต้องทำเมื่อ rule นี้ถูก trigger |

**ความหมายของแต่ละ enforcement level:**

| ระดับ | agent ต้องทำอะไร |
| --- | --- |
| `block` | ห้ามดำเนินต่อจนกว่าเงื่อนไขจะผ่าน |
| `escalate` | ต้องสร้าง Human Review Handoff Package แล้วหยุด |
| `warn` | ต้องแจ้ง user และ log ไว้ แต่ดำเนินต่อได้หากผู้ใช้รับทราบ |
| `guide` | ต้องถามคำถามที่ระบุก่อนดำเนินต่อ |
| `log` | ต้องเขียน entry ลงใน artifact ที่ระบุ |
| `note` | ควร acknowledge แต่ไม่มี blocking action |

---

## AGENTS.md และ CLAUDE.md ทำงานยังไง

ทั้งสองไฟล์เป็น markdown ที่ AI agent อ่านตอน startup เพื่อเข้าใจว่าต้องทำงานใน
project นี้อย่างไร

- **AGENTS.md** มุ่งเป้าไปที่ Codex CLI, Cursor และ agent ที่ใช้ convention
  `AGENTS.md` แบบ OpenAI-compatible
- **CLAUDE.md** มุ่งเป้าไปที่ Claude Code โดยเฉพาะ ใช้ slash commands และ
  artifact location ที่ Claude Code รู้จัก

ทั้งสองไฟล์อ้างอิง `.vgai/core/trust-kernel.md` สำหรับรายการกฎ authoritative
AGENTS.md และ CLAUDE.md มีแค่สรุปสั้นๆ — Trust Kernel คือ source of truth

**หลักการสำคัญ:** AGENTS.md และ CLAUDE.md เป็น generated output จาก Trust
Kernel ไม่ใช่เอกสารที่เขียนมือ เมื่อ Trust Kernel อัปเดต ไฟล์เหล่านี้ต้อง
regenerate (via `vgai init --update` ในเวอร์ชันอนาคต)

---

## ความสัมพันธ์กับ rule lifecycle (doc 04)

กฎใน `trust-kernel-v0.1.md` ถูกวางไว้ใน category `active` โดยตรง — เหมาะสม
สำหรับเวอร์ชัน manual แรก

ใน Full mode (AI-managed workflow) กฎจะผ่าน 11 ขั้นของ lifecycle ก่อนเข้า
category `active`:

```
Trust Kernel → Discovery → Stack → Candidate Rules → Critique →
Security Review → Scenario Testing → Arbitration →
Instruction Generation → Enforcement → Update Loop
```

ไฟล์ใน `examples/` แสดงให้เห็นว่า output ของ **Instruction Generation** (ขั้น 9)
ควรมีหน้าตาอย่างไร สำหรับ v0.1 ไฟล์เหล่านี้เขียนด้วยมือเพื่อให้ framework
มีจุดเริ่มต้นที่ใช้งานได้

---

## อ่านควบคู่กับ clinic booking walkthrough

ดู [doc 13](13_EXAMPLES_AND_SCENARIOS.md) สำหรับ scenario clinic booking
แบบ step-by-step ที่แสดงให้เห็นไฟล์เหล่านี้ใช้งานจริง:

- ขั้น 3 ใน scenario: agent อ่าน `AGENTS.md` / `CLAUDE.md` ตอน startup
- ขั้น 5: TK-002 (clarifying questions) ถูก trigger
- ขั้น 7: TK-001 (no implementation before acceptance criteria) enforce
- ขั้น 8: TK-009 (stop on no high-severity findings) หยุด loop
- ขั้น 9: artifacts ถูก write ตาม artifact table ใน AGENTS.md

---

## การ versioning

Trust Kernel มีเวอร์ชันระบุใน YAML front matter (`version: 0.1`)

แผนการอัปเวอร์ชัน:
- **0.1** — baseline ที่เขียนด้วยมือ 18 กฎ ครอบคลุม core workflow
- **0.2** — กฎชุดแรกที่ AI generate (post-MVP, phase 2)
- **1.0** — stable release หลัง validate กับ use case จริง

ไฟล์ใน `examples/` ควร commit ไว้ใน VG-AI repository และ tag พร้อมกับ
framework release ไม่ใช่ไฟล์ที่ผู้ใช้แก้ไขเอง

---

## ต้องอัปเดตอะไรบ้างเมื่อเพิ่มกฎใหม่

1. เพิ่มกฎใน `examples/trust-kernel-v0.1.md` (หรือไฟล์เวอร์ชันปัจจุบัน)
2. อัปเดต summary table ที่ด้านล่างของ Trust Kernel
3. ถ้ากฎส่งผลต่อพฤติกรรม agent ให้อัปเดต `examples/AGENTS.md` และ
   `examples/CLAUDE.md` ด้วย
4. เพิ่มค่า `total_rules` ใน front matter ของ Trust Kernel
5. อัปเดต `version` field ถ้านี่คือ release boundary
6. อัปเดต Glossary (`14_GLOSSARY.md`) ถ้ามีคำใหม่เกิดขึ้น
