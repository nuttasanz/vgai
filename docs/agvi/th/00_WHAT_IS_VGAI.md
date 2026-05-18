---
part_of: VG-AI product vision (modular)
status: current understanding as of 2026-05-18 — supersedes earlier framing
implementation_status: P0 (Discipline Layer) — done — see `template/`
---

# VG-AI คืออะไร

เอกสารนี้คือ **source of truth ของ VG-AI** สรุปจากการคุยกันวันที่ 2026-05-18 และ pivot scope ครั้งใหญ่ (เอกสาร 01-14 ของ vision เดิมถูกลบทิ้งใน branch `pivot/p0-discipline`)

---

## ใน 1 ประโยค

VG-AI ช่วย **junior-mid developer** ship code คุณภาพ production ด้วย AI โดยไม่ต้องมีความรู้ Senior ก่อน — และค่อย ๆ ฝึกให้คิดแบบ Senior Engineer จากการใช้งานทุกครั้ง

**ขยายอีกประโยค (insight ใหม่ 2026-05-18):**

VG-AI เปลี่ยน prompt vague ๆ ของ junior (เช่น "ช่วยสร้าง template สำหรับขึ้น project ใหม่") ให้กลายเป็น **production output + การเรียนรู้แบบ Senior** ในขั้นตอนเดียวกัน — สิ่งของ × บทเรียน เกิดพร้อมกัน ไม่ใช่แยกขั้นตอน

## ใครคือผู้ใช้

developer ที่:

- ใช้ AI coding tool (Claude Code, Codex, Cursor) ในงานจริง
- อยาก ship product จริง ไม่ใช่ prototype ทดลอง
- ยังไม่มีความรู้เชิงลึกพอจะตีกรอบ AI ด้วยตัวเอง
- อยากใช้ทุก task เป็นโอกาสฝึก engineering judgment

ผู้ใช้คนแรกคือเจ้าของโปรเจกต์เอง — กำลังสร้าง **ระบบจองสนามแบดมินตัน** เป็น first case study

## ปัญหา 3 ข้อที่ VG-AI แก้

ปัญหาที่ผู้ใช้เจอเมื่อ vibe code ด้วย AI:

1. **AI ไม่สม่ำเสมอ** — เขียน error/response format แล้วไม่ reuse, สร้าง function ใหม่ทั้งที่มีของเดิมอยู่
2. **AI เถียงตัวเอง** — ครั้งแรกบอกว่าวิธี 1 ดี ถามอีกครั้งกลับบอกวิธี 2 ดีกว่า ไม่มี decision log ที่ผูกกับ evidence
3. **ผู้ใช้ไม่มีความรู้พอจะตีกรอบ AI** — ไม่รู้ว่ามี risk อะไร, ไม่รู้ว่าควรถามอะไร, ไม่รู้ว่า output ที่ AI ส่งมาถูกหรือผิด

## ภาพรวม: VG-AI ทำงานยังไง (insight สำคัญ)

prompt ของ junior dev มักเป็น vague: "ช่วยสร้าง X", "ทำ Y ให้ดีหน่อย"

AI เปล่า ๆ → ตีความเดา → ทำตามตีความที่เดา → output อาจไม่ตรงสิ่งที่ผู้ใช้ต้องการ + ผู้ใช้ไม่เรียนรู้

AI + VG-AI → บังคับให้:

1. **ถามก่อน implement** — list ตัวเลือก + ตัวเลือกที่เหมาะ + เหตุผล (ผู้ใช้เห็น trade-off)
2. **ขอ approve ทีละ layer** — ผู้ใช้ตัดสินใจ ไม่ใช่ AI เดา
3. **อธิบายระหว่างทำ** — แต่ละ decision มี rationale (ผู้ใช้เรียนรู้)
4. **บันทึก decision** — DECISION_LOG.md เก็บไว้อ้างอิงและกัน AI เถียงตัวเอง
5. **สรุปบทเรียนตอนจบ** — `/reflect` ตกตะกอนสิ่งที่ผู้ใช้ควรเข้าใจ

ผลที่ได้: ผู้ใช้จบ task แล้ว = ได้ทั้ง code ใช้งานได้ + เข้าใจว่าทำไมต้องทำแบบนั้น

## VG-AI ไม่ใช่อะไร

- ❌ ไม่ใช่ AI ใหม่
- ❌ ไม่ใช่ coding agent ใหม่
- ❌ ไม่ใช่ runtime / orchestrator ใหม่
- ❌ ไม่ใช่ web platform / dashboard
- ❌ ไม่ใช่งานวิจัยปริญญาโท (ตอนนี้) — เครื่องมือใช้เองก่อน

## VG-AI คืออะไร (ของจริง — P0 implemented)

ชุดไฟล์ที่วางทับ Claude Code (และ Codex ผ่าน AGENTS.md) ใน repo ดู `template/` ใน repo นี้สำหรับของจริง

**Discipline Layer (universal — stack-agnostic):**

1. **`CLAUDE.md`** — 16 กฎ (R1-R16) แบ่งเป็น 3 ส่วน:
   - R1-R4: กฎเชิงกล (build/typecheck/test ต้องผ่าน)
   - R5-R14: กฎกระบวนการ (AC ก่อน code, classify risk, reuse check, list API risks, scope guard, log assumption, log decision, repair budget = 3)
   - R15-R16: จัดการกฎเทคนิค (ระดับ 3 ต้องมี `Source:` ห้ามเดา)
2. **`AGENTS.md`** — subset ของ CLAUDE.md สำหรับ Codex/Cursor
3. **`.claude/settings.json` + `.claude/hooks/check-acceptance-criteria.sh`** — bash hook ที่ block Edit/Write/MultiEdit ถ้าไม่เจอ "Acceptance Criteria" marker ใน transcript
4. **3 slash commands**:
   - `/start-task` — gather AC, classify risk, reuse check, list API risks, plan
   - `/reflect` — สร้าง reflection report พร้อม risk coverage 4 ข้อ + engineering lessons
   - `/log-decision` — append entry เข้า DECISION_LOG.md
5. **`DECISION_LOG.md`** — engineering decisions + rationale + alternatives + source
6. **`OPEN_QUESTIONS.md`** — assumptions ที่ยังไม่ confirm รอ review

**Stack-specific Layer (เพิ่มเมื่อเลือก stack):**

- `CLAUDE.<stack>.md` (เช่น `CLAUDE.nextjs.md`) — กฎเทคนิคเฉพาะ framework, ORM, etc.
- เพิ่มทีหลังเมื่อเลือก stack แล้ว ไม่ผูก template main กับ stack ใด

ติดตั้ง: clone template → `pnpm install` → เริ่มงานผ่าน `/start-task`

> ในอนาคต `vgai init` จะเป็น CLI ที่ scaffold ทั้งหมดให้ แต่ตอนนี้ใช้ clone template ก่อน

## ตัวอย่างการใช้งาน (จริง)

**ผู้ใช้:** "ช่วยทำ API ยกเลิกการจองให้หน่อย"

**AI** (ถูกกฎใน CLAUDE.md บังคับ ต้องตอบก่อนเขียน code):

> ก่อนเขียน ขอ list risk ก่อนครับ:
> - ใครเรียก `/cancel-booking?id=123` ได้? → ควรเป็นเจ้าของ booking เท่านั้น
> - ถ้าคนอื่นเรียกล่ะ? → **คนอื่นจะลบ booking ของคนอื่นได้** ต้องตรวจ ownership ที่ server
> - input แปลก ๆ (id ไม่มีจริง / format ผิด) จะทำยังไง? → return 404 / 400
> - มี 2 request พร้อมกัน? → ใช้ DB transaction
>
> acceptance criteria:
> 1. เจ้าของ booking ยกเลิกของตัวเองได้
> 2. คนอื่นเรียก endpoint นี้ได้ 403
> 3. unauthenticated ได้ 401
> 4. id ไม่มีจริง ได้ 404
>
> approve ให้เริ่มได้ไหมครับ?

**ผู้ใช้:** อ่านแล้วเห็น risk โดยไม่ต้องรู้ OWASP มาก่อน → "approve ทำเลย"

**AI:** เขียน code → รัน build/typecheck/test → รายงานผลพร้อม diff

**ผู้ใช้:** เรียก `/reflect` → AI สรุป task พร้อมชี้ว่ายังมี risk อะไรที่ยังไม่ครอบ → ผู้ใช้เรียนรู้ pattern ที่ Senior จะคิด

ผู้ใช้ไม่ต้องรู้ "Broken Access Control" มาก่อน AI รู้แล้ว — VG-AI แค่บังคับให้ AI *บอก* ผู้ใช้ทุกครั้ง

## กฎ 3 ระดับใน CLAUDE.md (Rule Trust Hierarchy)

นี่คือคำตอบของคำถาม "ผมจะเชื่อ CLAUDE.md ที่ AI เขียนได้ยังไง"

| ระดับ | ตัวอย่าง | ใครรับรอง | ก่อนใส่ต้องทำอะไร |
| --- | --- | --- | --- |
| **1 — เชิงกล** | `npm run build` ต้องผ่าน, typecheck ต้องผ่าน, test ที่เคยผ่านห้ามพัง | เครื่อง (exit code) | ไม่ต้องทำอะไร เครื่อง verify ให้ |
| **2 — กระบวนการ** | เขียน AC ก่อน code, grep ก่อนสร้าง function ใหม่, list risk ก่อนเขียน API | ตาผู้ใช้ (อ่านแชต/diff) | ไม่ต้องทำอะไร — ผู้ใช้เห็นด้วยตาว่า AI ทำตามไหม |
| **3 — เทคนิค** | "ตรวจ authorization ที่ server", "hash password ด้วย bcrypt rounds ≥ 12" | OWASP / official docs / AI ≥3 ตัวตรงกัน | ต้องมี `Source:` comment ใต้ทุกข้อ ถ้าไม่มี source ห้ามใส่ |

**กฎทอง:** เริ่มต้น CLAUDE.md ใส่แค่ระดับ 1+2 ก่อน — กฎพวกนี้ผู้ใช้ verify เองได้ ไม่ต้องเป็น SE

ระดับ 3 เพิ่มทีหลังเมื่อเจอ pain จริงในโปรเจกต์ + cross-check กับ source ที่เชื่อถือได้แล้ว ทุกข้อต้องระบุ source

## วิธีจัดการกับสิ่งที่ผู้ใช้ไม่รู้ (Unknown Unknowns)

ผู้ใช้ไม่ต้องรู้ทุก risk ก่อนเริ่มใช้ VG-AI — กลไกที่ช่วยให้ risk โผล่ขึ้นมาเอง:

1. **กฎกระบวนการบังคับ AI ให้ enumerate risk** — เช่น "ก่อนเขียน API ใหม่ list ว่าใครเรียกได้, ถ้าผิดคนเรียกล่ะ"
2. **Hook บังคับ AI ทำตามกฎ** — ไม่ใช่แค่ "ขอ" แต่ block ไม่ให้ผ่าน
3. **Reflection report จับ gap หลัง task** — AI อ่าน diff อีกครั้งหลังเขียนเสร็จ list risk ที่ตอน plan ไม่เห็น
4. **OPEN_QUESTIONS.md** — risk ที่ไม่แน่ใจ → log ไว้ก่อน → review ก่อน launch
5. **ลงทุนความรู้พื้นฐานครั้งเดียว** — อ่าน OWASP Top 10 ~2 ชม. รู้แค่ "หมวด" ไม่ต้องจำรายละเอียด

ส่วนที่ **ลบไม่ออก:** ก่อน launch ขายจริง ควรมี 1 session กับคนรู้จริง (เพื่อน senior, community, จ้างที่ปรึกษา) review CLAUDE.md + diff หลัก ๆ + OPEN_QUESTIONS.md

VG-AI ไม่ทำให้ความรู้ที่จำเป็น = 0 แต่ลดจาก "Senior-level" เหลือ "junior + OWASP 2 ชม. + ใช้ AI สำรวจ risk"

## Stack Flexibility (DEC-006)

VG-AI **ไม่ผูก stack** — Universal layer (CLAUDE.md + AGENTS.md + hooks + slash commands) ทำงานกับทุก stack เพราะกฎทั้งหมดเป็นเรื่องกระบวนการ ไม่ใช่เทคนิคเฉพาะ

Stack-specific layer แยกเป็นไฟล์ต่างหาก:

| Stack | ไฟล์เพิ่ม | สถานะ |
| --- | --- | --- |
| Next.js + TypeScript + Drizzle + NextAuth | `CLAUDE.nextjs.md` | จะทำใน P1-P4 |
| Python + FastAPI + SQLAlchemy | `CLAUDE.python.md` | future |
| Go + Echo/Gin | `CLAUDE.go.md` | future |

template main ตอนนี้ใช้ Next.js stack (เลือกตามที่ user ต้องการสำหรับ first project) แต่ Universal layer reusable

## สิ่งที่ไม่อยู่ใน scope (ตอนนี้)

ตัดออกจาก vision เดิม:

- ❌ Custom runtime / orchestrator
- ❌ Web dashboard
- ❌ MCP server เต็มรูปแบบ
- ❌ 18 Trust Kernel rules ตั้งแต่ MVP (เริ่มจาก ~8 กฎที่ verify ได้)
- ❌ 5 role groups เป็น primitive แยก (ใช้ Claude Code sub-agents)
- ❌ observations.jsonl ecosystem เต็มรูปแบบ (เริ่มจาก git diff + reflection)
- ❌ Multi-tier workflow (Tier 0/1/2) — เริ่มจาก flow เดียวก่อน
- ❌ Skill Progression Map / Mentor Mode formal — reflection report พอ
- ❌ การวางตำแหน่งเป็นงานวิจัย — ใช้เองก่อน case study ทีหลัง

สิ่งเหล่านี้อาจกลับมาในอนาคต แต่ไม่ใช่ตอนนี้

## เก็บไว้ใน vision เดิม (ยังใช้ได้)

- ✅ แนวคิด verification gates (doc 05) — เป็น checklist ใน CLAUDE.md
- ✅ Build-and-repair stop conditions (doc 06) — เป็น hook script
- ✅ Engineering judgment principles (doc 07) — เป็น prompt ใน /reflect
- ✅ Reflection report structure (doc 08) — เป็น template ของ /reflect
- ✅ Rule trust hierarchy (เอกสารนี้, doc 04 ฉบับ update) — กฎทอง

## สถานะปัจจุบัน

- **Phase:** P0 done — Discipline Layer พร้อมใช้ใน `template/`
- **Next phases:**
  - P1 — Chassis (Next.js + TS + Tailwind + env validation)
  - P2 — Data Layer (Drizzle + PostgreSQL + migrations)
  - P3 — Security Layer (NextAuth + protected routes + authz pattern)
  - P4 — API Layer (Zod + error format + example endpoint + tests)
  - P5 — Ship Layer (Dockerfile + docker-compose + deploy guide)
- **Validation horizon:** ใช้ template สร้างฟีเจอร์จริงในระบบจองสนามแบด → จดสิ่งที่ขาด → revise vision จาก evidence
- **Thesis:** เลื่อนออกไป — ใช้เอง + ทำให้ work ก่อน ค่อยคิดเรื่อง publish

---

## เอกสารและไฟล์ที่เกี่ยวข้อง

| ถ้าคุณต้องการ... | ดู |
| --- | --- |
| Pitch + scope + insight (เอกสารนี้) | `docs/agvi/th/00_WHAT_IS_VGAI.md` |
| ใช้ template จริง | `template/README.md` |
| กฎ R1-R16 ที่ AI ต้องทำตาม | `template/CLAUDE.md` |
| Subset สำหรับ Codex/Cursor | `template/AGENTS.md` |
| Engineering decisions + rationale | `template/DECISION_LOG.md` |
| Assumptions ที่ค้างอยู่ | `template/OPEN_QUESTIONS.md` |
| Hook script ที่ block Edit/Write | `template/.claude/hooks/check-acceptance-criteria.sh` |
| Slash commands | `template/.claude/commands/{start-task,reflect,log-decision}.md` |

> Vision เก่า (runtime, multi-role, TK 18 rules, dashboard) ถูกตัดออกใน pivot นี้ ดูได้จาก git history บน branch `main` (commit `d425b77` ก่อน pivot)
