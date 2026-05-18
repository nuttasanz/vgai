---
description: เริ่ม task ใหม่ — gather AC, classify risk, plan (VG-AI R5/R6/R7/R8)
---

# /start-task

ใช้ slash command นี้ก่อนเริ่มงานใหม่ทุกครั้ง เพื่อให้ครบกฎ R5, R6, R7, R8 ใน CLAUDE.md

Task description ที่ user ส่งมา: `$ARGUMENTS`

## ขั้นตอนที่คุณต้องทำ

### 1. อ่าน context ของ project

- Read `DECISION_LOG.md` — มี decision ที่เกี่ยวข้องไหม
- Read `OPEN_QUESTIONS.md` — มีคำถามค้างที่เกี่ยวไหม
- Read `CLAUDE.md` (ถ้ายังไม่มีใน context) — refresh กฎ
- ถ้ามี `CLAUDE.<stack>.md` ก็อ่านด้วย

### 2. List Acceptance Criteria 3-5 ข้อ

ในรูปแบบ:

```
Acceptance Criteria:
1. <criterion ที่ verify ได้ — observable behavior หรือ test-able>
2. ...
```

AC ที่ดีต้อง:
- สังเกตหรือทดสอบได้
- ครอบ success + failure + unauthorized + edge cases ที่สำคัญ
- ไม่ใช่ "code is clean" หรือ "follows best practices" (vague)

### 3. Classify Risk

ตอบในรูปแบบ:

```
Risk: <Low | Medium | High>
เหตุผล: <ทำไม>
- ไฟล์ที่คาดว่าจะแตะ: ~N ไฟล์
- แตะ auth/schema/secret/deletion/payment? <yes/no — ถ้า yes อะไร>
- มี dep ใหม่? <yes/no>
```

ใช้ตารางใน CLAUDE.md R6 เป็นเกณฑ์

### 4. Reuse Check (R7)

```
Reuse check:
- Grep "<keyword 1>" — เจอ/ไม่เจอ
- Grep "<keyword 2>" — เจอ/ไม่เจอ
- ...
ผลสรุป: <จะ reuse ของเดิม X / จะสร้างใหม่ Y เพราะ Z>
```

### 5. ถ้าเป็น API endpoint ใหม่ → List 4 Risks (R8)

```
API Risks for <endpoint path>:
1. ใครเรียกได้? <answer>
2. ผิดคนเรียก? <impact + mitigation>
3. Input ผิด? <validation strategy>
4. Concurrent? <transaction/lock/idempotency strategy>
```

### 6. เสนอ Plan (3-7 bullets)

```
Plan:
1. <step ตามลำดับ>
2. ...
```

### 7. ขอ approve

```
approve ให้เริ่มได้ไหมครับ? (หรือต้องการปรับ AC/scope ก่อน?)
```

### 8. รอ user ตอบ approve

ห้าม Edit/Write ใด ๆ ก่อน user ตอบ approve อย่างชัดเจน

---

## ตัวอย่าง

ถ้า `$ARGUMENTS = "เพิ่ม API ยกเลิกการจอง"` คุณควรตอบประมาณนี้:

> Reading DECISION_LOG.md... พบ DEC-003 (NextAuth) — relevant สำหรับ auth check
> Reading OPEN_QUESTIONS.md... ไม่มีคำถามค้างที่เกี่ยวข้อง
>
> Acceptance Criteria:
> 1. เจ้าของ booking ยกเลิกการจองของตัวเองได้ (200 + status updated)
> 2. คนอื่นเรียก endpoint → 403
> 3. unauthenticated → 401
> 4. booking id ไม่มีจริง → 404
> 5. tests ครอบทั้ง 4 cases ข้างต้น
>
> Risk: **High**
> เหตุผล: แตะ authorization + state-change ที่กลับไม่ได้ → OWASP A01 risk
> - ไฟล์: ~3-5 (route handler, auth helper, test, schema reference)
> - แตะ auth: YES (authorization check)
> - dep ใหม่: ไม่มี
>
> Reuse check:
> - Grep "authorize" — ยังไม่เจอ helper จะสร้างใหม่
> - Grep "booking" — เจอ schema ใน db/schema.ts
> ผลสรุป: สร้าง pattern แรกของ authorization helper ที่ reuse ได้
>
> API Risks for POST /api/bookings/[id]/cancel:
> 1. ใครเรียกได้? เฉพาะ authenticated user ที่เป็น owner ของ booking
> 2. ผิดคนเรียก? เสี่ยงสูง → ลบ booking คนอื่น → ต้อง check ownership ที่ server (OWASP A01)
> 3. Input ผิด? id format ผิด → 400, id ไม่มีจริง → 404
> 4. Concurrent? ยกเลิกซ้ำ → idempotent (return 200 หรือ 409 ถ้าต้องการเข้มงวด)
>
> Plan:
> 1. สร้าง route handler `/api/bookings/[id]/cancel` (POST)
> 2. เพิ่ม auth check (NextAuth session)
> 3. Query booking + compare userId เพื่อ check ownership
> 4. Update booking.status = 'cancelled'
> 5. เขียน test 4 cases ที่ระบุใน AC
>
> approve ให้เริ่มได้ไหมครับ?
