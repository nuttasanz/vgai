# AGENTS.md — VG-AI Discipline Layer (universal subset)

ไฟล์นี้คือ subset ของ `CLAUDE.md` ที่ใช้ได้กับทุก AI coding agent
ถ้าคุณคือ Claude Code อ่าน `CLAUDE.md` แทน (ครบกว่า)

## Mandatory before any code change

1. List 3-5 acceptance criteria → ขอ user approve
2. Classify risk: Low / Medium / High (นิยามใน CLAUDE.md R6)
3. ถ้า Medium/High → ขอ approve plan ก่อน edit
4. Grep หา code ที่ทำคล้ายกันก่อนสร้างใหม่
5. ถ้าเป็น API endpoint ใหม่ → list 4 risks (auth, error case, input validation, concurrency)

## Mandatory after code change

1. รัน checks ที่มี (build, typecheck, lint, test)
2. รายงานผลพร้อม diff
3. ถ้า repair bug เดิม 3 ครั้งแล้วยังไม่ผ่าน → หยุด, escalate

## Mandatory documentation

- Assumptions → append เข้า `OPEN_QUESTIONS.md`
- Medium/High decisions → append เข้า `DECISION_LOG.md`
- กฎเทคนิคใน CLAUDE.md ต้องมี `Source:` comment

## Hard rules

- ห้าม claim "production-ready" / "secure" / "scalable" โดยไม่มี evidence
- ห้ามแก้ไฟล์นอก scope ที่ตกลงไว้ โดยไม่ขอ approve
- ห้าม bypass hook blocks — แก้ root cause แทน
- ห้ามเดาคำตอบเทคนิคที่ไม่แน่ใจ — log ใส่ `OPEN_QUESTIONS.md`
