---
description: สรุปบทเรียนของ task ที่เพิ่งเสร็จ — generate Engineering Reflection Report
---

# /reflect

ใช้หลังจบ task เพื่อสรุปบทเรียน + จับ risk ที่อาจตกหล่น + update OPEN_QUESTIONS

## ขั้นตอนที่คุณต้องทำ

### 1. รวบรวม evidence ของ session

```bash
git diff --stat HEAD~1 2>/dev/null || git diff --stat
git diff HEAD~1 2>/dev/null || git diff
```

ถ้ายังไม่ได้ commit ใช้ `git diff` ดู uncommitted changes

### 2. สร้าง Reflection Report

เขียนเป็น markdown ใน `reflections/YYYY-MM-DD-<task-slug>.md` โดยใช้ format นี้:

```markdown
# Reflection: <task title>

- **Date:** YYYY-MM-DD
- **Risk Level:** Low / Medium / High
- **Status:** Complete / Partial / Blocked

## What Changed

- `<file path>` — <สิ่งที่ทำ>
- ...

## Why It Changed (key decisions)

- <decision สำคัญ> — <rationale สั้น ๆ> — ดู DECISION_LOG.md DEC-XXX ถ้ามี

## Verification Evidence

- build: pass / fail / not run
- typecheck: pass / fail / not run
- lint: pass / fail / not run
- tests: X passed / Y total (หรือ "not applicable / not added")
- manual checks: <สิ่งที่ทดสอบด้วยมือ>

## Risk Coverage Check

ตอบทั้ง 4 ข้อ (สำคัญ — จับ unknown unknowns):

1. **Authorization**: ทุก new endpoint มี auth check ที่ server ไหม? ที่ไหน?
2. **Concurrency**: ทุก mutation มี transaction ที่เหมาะสมไหม?
3. **Input Validation**: ทุก user input ถูก validate ที่ไหน? schema?
4. **Scale**: ถ้า 1,000 user ใช้พร้อมกัน อะไรจะพังก่อน?

## Open Questions / Assumptions

- <สิ่งที่ไม่แน่ใจ — ต้องเพิ่มเข้า OPEN_QUESTIONS.md ด้วย>
- ...

## Engineering Lessons (สำหรับ user)

อธิบาย pattern / concept ที่ user ควรเข้าใจจาก task นี้:

- **<concept>**: <อธิบายให้ junior dev เข้าใจ — ทำไมสำคัญ ใช้เมื่อไหร่>
- **<concept>**: ...

ตัวอย่าง concept ที่อาจปรากฏ:
- Server-side authorization vs UI hiding (OWASP A01)
- Idempotent operations
- Optimistic vs pessimistic locking
- Input validation at boundary
- Error response format consistency
- Test pyramid (unit vs integration vs E2E)

## Next Suggested Task

จาก state ปัจจุบันของ project ผมแนะนำ next task:

- <task แนะนำ> — เหตุผล
```

### 3. Append assumptions ใหม่เข้า OPEN_QUESTIONS.md

ทุก "Open Questions / Assumptions" ที่ list ใน reflection ต้อง append เข้า `OPEN_QUESTIONS.md` ด้วย type tag ที่เหมาะสม

### 4. แสดง reflection ให้ user

อย่าแค่ save ไฟล์เงียบ ๆ — print summary ออกมาให้ user อ่านในแชต

---

## เกณฑ์คุณภาพของ reflection

reflection ที่ดี:

- ✅ ระบุไฟล์ + บรรทัดได้ ไม่ใช่คำอธิบายลอย
- ✅ ตอบ Risk Coverage Check ทั้ง 4 ข้อ ไม่ skip ถ้าไม่เกี่ยวให้ระบุว่า "N/A เพราะ ..."
- ✅ Engineering Lessons อธิบายในระดับที่ junior dev เข้าใจ ไม่ใช่ jargon
- ✅ ระบุ next task ตามสถานะจริงของ project ไม่ใช่ generic suggestion

reflection ที่ไม่ดี:

- ❌ "everything looks good" — ไม่ specific
- ❌ ข้าม Risk Coverage Check
- ❌ Engineering Lessons เป็นแค่ list คำศัพท์ ไม่อธิบาย
