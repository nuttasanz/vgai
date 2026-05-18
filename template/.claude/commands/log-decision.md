---
description: บันทึก decision เข้า DECISION_LOG.md (VG-AI R12)
---

# /log-decision

ใช้เมื่อทำ Medium/High decision และต้อง persist สำหรับอนาคต (R12 ใน CLAUDE.md)

Title ที่ user ส่งมา: `$ARGUMENTS`

## ขั้นตอน

### 1. อ่าน `DECISION_LOG.md`

หา DEC number ถัดไป (DEC-001, DEC-002, ... หา max แล้ว +1)

### 2. รวบรวมข้อมูล 6 หัวข้อ

ถ้าข้อมูลพอจาก conversation context, infer ได้
ถ้าไม่พอ ถาม user ที่ละข้อ:

1. **Title** — 1 ประโยคสั้น (ถ้า `$ARGUMENTS` มีอยู่แล้วใช้เป็น hint)
2. **Risk Level** — Low / Medium / High (ใช้นิยามใน CLAUDE.md R6)
3. **Status** — Proposed / Accepted (ส่วนใหญ่ Accepted ถ้าทำไปแล้ว)
4. **Context** — situation ที่ต้องตัดสินใจ (2-4 ประโยค)
5. **Decision** — สิ่งที่เลือก (ระบุชัด ๆ)
6. **Alternatives Considered** — ทางเลือกอื่นที่ดู + ทำไมไม่เลือก (อย่างน้อย 2 alternatives)
7. **Trade-offs** — benefit + drawback (bullet form, ใช้ ✅ / ⚠️)
8. **Source / Evidence** — reference (สำคัญสำหรับกฎระดับ 3)
   - OWASP / official docs / industry benchmark / user preference
   - ถ้าไม่มี source ที่ trust ได้ → flag ให้ user

### 3. Append entry ใหม่ลง DECISION_LOG.md

ใช้ format ที่อยู่ที่หัวของ DECISION_LOG.md ห้ามแก้ format

### 4. ยืนยันกับ user

```
บันทึก DEC-XXX แล้ว: <title>
```

---

## ข้อควรระวัง

- ❌ ห้าม invent alternatives — ถ้า user ไม่ได้พิจารณา alternative ใด ให้ note ว่า "ไม่ได้พิจารณา" หรือถาม user
- ❌ ห้าม fabricate source — ถ้าไม่มี source จริง บอก "no formal source — based on user preference / project context"
- ✅ Decision ระดับ High (auth, payment, schema, deletion) ควรมี source ภายนอก (OWASP, official docs) อย่างน้อย 1 link
