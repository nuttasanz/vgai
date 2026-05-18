# Project Template (Generic Web Stack)

Template สำหรับเริ่ม web project ใหม่ ภายใต้ discipline ของ **VG-AI** — ระบบที่ช่วย junior-mid dev ship code คุณภาพ production ด้วย AI โดยเรียนรู้ engineering judgment ไปพร้อมกัน

## สถานะ template

| Phase | สถานะ | สิ่งที่มี |
| --- | --- | --- |
| **P0 — Discipline Layer** | ✅ Done | CLAUDE.md, AGENTS.md, hooks, slash commands, DECISION_LOG, OPEN_QUESTIONS |
| **P1 — Chassis** | ⏳ Pending | Next.js + TS + Tailwind + env validation |
| **P2 — Data Layer** | ⏳ Pending | PostgreSQL + Drizzle + migrations |
| **P3 — Security Layer** | ⏳ Pending | NextAuth + protected routes + authz pattern |
| **P4 — API Layer** | ⏳ Pending | Zod + error format + example endpoint + tests |
| **P5 — Ship Layer** | ⏳ Pending | Dockerfile + docker-compose + deploy guide |

template นี้ใช้งานได้ตั้งแต่ P0 — สามารถ apply discipline layer กับ project ใด ๆ ได้ตั้งแต่ตอนนี้

## Stack ที่จะใช้ (ตาม DECISION_LOG)

- **Framework:** Next.js (App Router) + TypeScript strict — DEC-001
- **Styling:** Tailwind CSS — DEC-001
- **Database:** PostgreSQL + Drizzle ORM — DEC-002
- **Auth:** NextAuth (Auth.js) v5 — DEC-003
- **Deploy:** Docker + docker-compose (VPS-friendly, no Vercel) — DEC-004
- **Testing:** Vitest (จะ confirm ใน P4)

> **หมายเหตุ:** Stack ไม่ fix Universal layer (CLAUDE.md, AGENTS.md) ใช้กับ stack อื่นได้ เพิ่ม `CLAUDE.<stack>.md` แทน (DEC-006)

## ไฟล์หลัก

```
template/
├── CLAUDE.md              ← กฎ R1-R16 ที่ Claude Code ต้องทำตาม
├── AGENTS.md              ← subset สำหรับ Codex/Cursor/agent อื่น
├── DECISION_LOG.md        ← engineering decisions + rationale
├── OPEN_QUESTIONS.md      ← assumptions ที่ยังไม่ confirm
├── README.md              ← (ไฟล์นี้)
├── reflections/           ← reflection report หลังจบแต่ละ task
└── .claude/
    ├── settings.json      ← hook config
    ├── hooks/
    │   └── check-acceptance-criteria.sh  ← block Edit/Write ถ้าไม่มี AC
    └── commands/
        ├── start-task.md  ← เริ่ม task ใหม่
        ├── reflect.md     ← สรุปบทเรียน
        └── log-decision.md← บันทึก decision
```

## วิธีใช้

### 1. Clone template

```bash
git clone <this-template-repo> my-project
cd my-project
```

### 2. Read context

ก่อนสั่งงาน AI อ่านก่อน:
- `CLAUDE.md` — กฎที่บังคับใช้
- `DECISION_LOG.md` — เหตุผลของ choice ปัจจุบัน
- `OPEN_QUESTIONS.md` — สิ่งที่ค้างอยู่

### 3. เริ่ม task ใหม่ผ่าน `/start-task`

```
/start-task เพิ่มฟีเจอร์ X
```

AI จะ:
- อ่าน context ที่เกี่ยวข้อง
- เสนอ Acceptance Criteria 3-5 ข้อ
- Classify risk (Low/Medium/High)
- Reuse check (grep ของเดิม)
- ถ้าเป็น API endpoint → list 4 risks
- เสนอ plan + ขอ approve

**ห้ามให้ AI Edit/Write ก่อน approve** — hook จะ block ให้

### 4. หลังจบ task เรียก `/reflect`

```
/reflect
```

AI จะ:
- รวบรวม diff
- สร้าง reflection report ใน `reflections/`
- จับ risk coverage 4 ข้อ
- อธิบาย engineering lessons
- เสนอ next task

### 5. ทุก Medium/High decision เรียก `/log-decision`

```
/log-decision <title>
```

เพิ่ม entry เข้า DECISION_LOG.md พร้อม rationale + source

## หลักคิด

> **VG-AI ไม่ทำให้ AI เก่งขึ้น — มันบังคับ AI ให้ทำสิ่งที่เก่งอยู่แล้วอย่างสม่ำเสมอ และ output ออกมาในรูปที่ user เรียนรู้ได้**

ดูเพิ่มเติม: `docs/agvi/th/00_WHAT_IS_VGAI.md` ใน [VG-AI repo](https://github.com/...) (เพิ่ม link หลัง publish)

## ระดับกฎใน CLAUDE.md (Trust Hierarchy)

| ระดับ | ตัวอย่าง | ใครรับรอง |
| --- | --- | --- |
| 1 — เชิงกล | build/typecheck/test ต้องผ่าน | เครื่อง (exit code) |
| 2 — กระบวนการ | AC ก่อน code, grep ก่อนสร้าง, list risk ก่อน API | ตา user (อ่าน chat/diff) |
| 3 — เทคนิค | "auth ที่ server", "bcrypt rounds ≥ 12" | ต้องมี `Source:` comment |

template main ใส่แค่ระดับ 1+2 — ระดับ 3 เพิ่มทีหลังเมื่อเจอ pain จริง + cross-check OWASP/docs

## License

(TBD)
