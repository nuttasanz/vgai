---
part_of: VG-AI product vision (modular)
---

**การนำทาง:** ดู [ภาพรวม](PRODUCT_VISION.md)

# ตำแหน่งทางงานวิจัย

สำหรับ problem statement, users และ safe claims ดู [01 Product Principles](01_PRODUCT_PRINCIPLES.md)

---

## Research Contributions

contributions หลักคือ:

1. เวิร์กโฟลว์การพัฒนาที่ AI ช่วยและมีโครงสร้างสำหรับผู้พัฒนาที่มีประสบการณ์น้อย
2. กระบวนการที่มี verification gates เพื่อตรวจ output ของ AI ก่อนผู้ใช้ trust หรือ continue
3. trust/risk report ที่อธิบายสิ่งที่ครอบคลุม สิ่งที่ขาด สิ่งที่เสี่ยง และสิ่งที่ต้อง human review
4. learning scaffold ที่ช่วยให้ผู้พัฒนาเรียนรู้ software engineering judgment แทนการ copy output ของ AI
5. Build-and-Repair Loop ที่ verify implementation ผ่าน build, lint, typecheck และ test แล้ว repair แบบควบคุมก่อน escalate
6. Stop-Condition mechanism ที่ป้องกัน AI-driven code changes ที่ไม่จำเป็น
7. Cost and Token Optimization Layer ที่ลด LLM calls และ context usage ผ่าน selective retrieval, codebase mapping, caching, error-log compression, diff-based repair context, model routing และ budgets
8. Engineering Reflection Report ที่เปลี่ยน AI-assisted sessions เป็น learning artifacts ที่อธิบาย project understanding, rationale, alternatives, trade-offs, evidence, repair history, stop decisions, risks และ learning topics
9. Skill Progression Map สำหรับ track exposure ต่อ skill areas เช่น requirements, architecture, security, testing, maintainability, production readiness, observability และ risk-based decision making
10. Repeated Reflection และ Mentor Mode ที่ฝึกให้ผู้ใช้ reason ก่อน/หลัง AI feedback และเทียบ judgment ของตนกับ analysis ของระบบ
11. Acceptance Criteria และ Test-Aware Workflow ที่นิยาม task completion และสนับสนุน behavior-focused verification
12. Risk-Based Approval, Versioning, Diff Preview และ Rollback ที่ทำให้ AI changes inspectable และปลอดภัยขึ้น
13. Human Review Handoff Package และ Failure Mode Report สำหรับ escalation เมื่อ AI ควรหยุด
14. Project Decision Log ที่เก็บ rationale, alternatives, trade-offs และ unresolved risks ข้าม sessions
15. full-scope product vision ที่เริ่มจาก solo-first developer workflow และขยายไป Git/PR, project rules, integrations, audit trails, secret protection, independent AI review, quality dashboards และ team/organization support ได้

## Possible Research Questions

- **RQ1:** structured AI-assisted workflow พร้อม verification gates ช่วยผู้พัฒนาที่มีประสบการณ์น้อยสร้าง web applications อย่างเป็นระบบกว่า ad-hoc LLM prompting หรือไม่?
- **RQ2:** verification gates ตรวจพบ security, code quality และ production readiness gaps ได้มากกว่า direct prompting หรือไม่?
- **RQ3:** verification reports ของระบบ align กับ expert review มากเพียงใด?
- **RQ4:** ระบบช่วยให้ผู้ใช้เข้าใจ trade-offs, risks และ design decisions ดีขึ้นหลังใช้งานหรือไม่?
- **RQ5:** Build-and-Repair Loop เพิ่มโอกาสที่ AI-generated code build/pass checks หรือ produce unresolved-error reports ที่ชัดขึ้นหรือไม่?
- **RQ6:** explicit Stop Conditions ลด unnecessary repair, over-refactoring หรือ regression โดยยังรักษา build/test success และ verification quality ได้หรือไม่?
- **RQ7:** cost-aware context selection, caching, error-log compression และ repair budgeting ลด token usage/LLM calls โดยยังรักษาคุณภาพได้หรือไม่?
- **RQ8:** Engineering Reflection Reports ช่วยผู้ใช้เข้าใจ concerns ด้าน requirements, architecture, security, maintainability, testing, production readiness และ risk-based decisions หรือไม่?
- **RQ9:** Repeated Reflection และ Mentor Mode เพิ่มความสามารถในการระบุ risks, trade-offs, missing tests, stop conditions และ human review needs ก่อนพึ่ง AI answers หรือไม่?
- **RQ10:** Skill Progression Map ช่วย track growth และ identify learning gaps หรือไม่?
- **RQ11:** Acceptance Criteria Generation และ Test-Aware Workflow เพิ่ม correctness/completeness ของ implementation หรือไม่?
- **RQ12:** Risk-Based Approval, Diff Preview และ Rollback ลด unsafe/unnecessary AI-driven changes โดยยังรักษา productivity ได้หรือไม่?
- **RQ13:** Human Review Handoff Packages และ Failure Mode Reports ช่วยสื่อสาร unresolved risks และ review questions ให้ senior reviewers ได้ดีขึ้นหรือไม่?

## Evaluation Metrics ที่เป็นไปได้

metrics อาจรวม:

- build/typecheck/lint/test pass rate
- repair success rate และจำนวน repair iterations เฉลี่ย
- unresolved errors และ issues ใหม่ที่เกิดระหว่าง repair
- human review required rate
- expert judgment ต่อความเหมาะสมของ repair และ stop decision
- unnecessary changes avoided, diff size, regression count
- LLM calls, prompt/completion/total tokens และ cost ต่อ task
- token reduction เทียบกับการส่ง full repository context
- context precision และ cache hit rate
- error-log compression ratio, repair cost, latency
- ความสามารถผู้ใช้ในการระบุ missing requirements, security risks และ engineering trade-offs ก่อน/หลังใช้ระบบ
- ความสามารถแยก Critical/High findings จาก Low/Informational findings
- ความสามารถตัดสินว่า AI ควร stop, continue หรือ escalate
- คุณภาพ reflection answers เทียบ expert judgment
- learning topics ที่ map ถูกต้อง และ Skill Progression coverage
- Mentor Mode usefulness, Repeated Reflection completion และ improvement ระหว่าง pre/post reflection
- acceptance criteria coverage, criteria satisfied และ ambiguous criteria ที่ตรวจพบก่อน implement
- test plan coverage สำหรับ success, failure, unauthorized และ edge cases
- risk classification accuracy, high-risk approvals, rollback frequency/success
- AI changes ที่ถูก reject หลัง diff preview
- handoff packages และ failure mode reports ที่สร้าง รวมถึง usefulness rating จาก expert
- จำนวน decisions ที่บันทึกและคุณภาพของ rationale/alternatives/trade-offs

metrics เหล่านี้ช่วยประเมินว่าระบบเพิ่ม implementation reliability เทียบกับ ad-hoc prompting ได้หรือไม่ โดยยังยอมรับว่า build/tests ผ่านไม่ได้ guarantee correctness, security หรือ production readiness และ learning metrics ต้องหลีกเลี่ยง claim ที่ไม่ปลอดภัยว่าเครื่องมือทำให้ junior กลายเป็น senior โดยอัตโนมัติ

