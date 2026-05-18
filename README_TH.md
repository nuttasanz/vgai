# VG-AI

> ระบบ discipline + การเรียนรู้ที่วางทับ AI coding agent (Claude Code, Codex,
> Cursor) เพื่อช่วย junior–mid dev ship code คุณภาพ production **พร้อม** พัฒนา
> engineering judgment ไปด้วยทุก task

VG-AI **ไม่ใช่** AI ใหม่ ไม่ใช่ runtime ใหม่ ไม่ใช่ platform แต่เป็นชุดกฎ + hook
+ slash commands เล็ก ๆ ที่บังคับให้ agent ที่มีอยู่แล้ว:

1. ถามก่อน implement — list Acceptance Criteria + risk
2. ขอ approve ทีละ layer
3. อธิบายแต่ละ decision ระหว่างทำ
4. บันทึก decision เข้า `DECISION_LOG.md`
5. สรุปบทเรียนตอนจบพร้อม risk coverage check 4 ข้อ

ผลลัพธ์: ทุก task = code ใช้งานได้ + ผู้ใช้เข้าใจว่าทำไม Senior ถึงคิดแบบนั้น

> Source of truth ของ vision อยู่ที่
> [`docs/agvi/th/00_WHAT_IS_VGAI.md`](docs/agvi/th/00_WHAT_IS_VGAI.md)
> อ่านเอกสารนั้นก่อนสำหรับ context เต็ม

## สถานะ

| Phase | สถานะ | สิ่งที่มี |
| --- | --- | --- |
| **P0 — Discipline Layer** | done | กฎ R1-R16, hook, slash commands, decision log |
| **P1 — Chassis** | pending | Next.js + TS + Tailwind + env validation |
| **P2 — Data Layer** | pending | PostgreSQL + Drizzle + migrations |
| **P3 — Security Layer** | pending | NextAuth + protected routes + authz |
| **P4 — API Layer** | pending | Zod + error format + example endpoint + tests |
| **P5 — Ship Layer** | pending | Dockerfile + docker-compose + deploy guide |

Discipline Layer ใน `template/` ใช้งานได้แล้ว apply กับ project ใด ๆ ก็ได้
ไม่ว่าจะเลือก stack ไหน

## วิธีใช้ template

```bash
git clone <this-repo> my-project
cd my-project/template
# อ่าน CLAUDE.md ก่อน แล้วใน Claude Code session:
#   /start-task <สิ่งที่อยากให้ทำ>
```

สิ่งที่ template บังคับ:

- ต้องมี Acceptance Criteria **ก่อน** ทุก `Edit`/`Write` (hook block)
- Classify risk (Low/Medium/High) ก่อน implement
- Reuse check (grep) ก่อนสร้าง code ใหม่
- List risk ก่อนสร้าง API endpoint ใหม่
- Log entry สำหรับทุก Medium/High decision
- Reflection report ตอนจบพร้อม risk coverage check 4 ข้อ

ดู [`template/README.md`](template/README.md) สำหรับรายละเอียดไฟล์ทั้งหมด

## โครงสร้าง repo

| Path | คืออะไร |
| --- | --- |
| `template/` | P0 Discipline Layer พร้อม drop เข้า project ใหม่ |
| `docs/agvi/th/00_WHAT_IS_VGAI.md` | Vision + pitch + decisions (source of truth) |
| `README.md` / `README_TH.md` | ไฟล์นี้ |

## VG-AI **ไม่ใช่**

- ไม่ใช่ AI coding agent ใหม่
- ไม่ใช่ runtime / orchestrator ใหม่
- ไม่ใช่ web platform / dashboard
- ไม่ใช่ CLI (ยังไม่มี `vgai init` — ใช้ clone template เอาก่อน)
- ไม่ใช่งานวิจัย (ใช้เองก่อน, thesis เลื่อน)

Vision เก่า (multi-role governance, Trust Kernel v0.1, dashboard ฯลฯ) ดูได้
จาก git history บน branch `main` commit `d425b77` หรือก่อนหน้า
