# Decision Log

บันทึก decision สำคัญของ project นี้ — stack, architecture, security, trade-offs

ใช้ slash command `/log-decision` เพื่อเพิ่ม entry ใหม่

## Format

ใช้ template นี้สำหรับแต่ละ decision:

```
## DEC-XXX: <decision title>

- **Date:** YYYY-MM-DD
- **Risk Level:** Low / Medium / High
- **Status:** Proposed / Accepted / Superseded / Rejected

### Context
<situation ที่ต้องตัดสินใจ>

### Decision
<สิ่งที่เลือก>

### Alternatives Considered
<ทางเลือกอื่น + ทำไมไม่เลือก>

### Trade-offs
<benefit + drawback>

### Source / Evidence
<reference — OWASP / docs / AI consensus / user preference>
```

---

## DEC-001: Use Next.js (App Router) + TypeScript strict as base framework

- **Date:** 2026-05-18
- **Risk Level:** Medium (lock-in decision)
- **Status:** Accepted

### Context
ต้องสร้าง template สำหรับ web project ใหม่ที่ junior-mid dev จะใช้ ship product จริง ต้องการ ecosystem ที่ AI agent รู้จักดี และ resources การเรียนรู้เยอะ

### Decision
Next.js (App Router) + TypeScript strict + Tailwind CSS

### Alternatives Considered
- **SvelteKit** — modern, fast, ecosystem เล็กกว่า AI knowledge น้อยกว่า
- **Remix** — server-first ดี, market share ลดลงหลัง React Router merge
- **Vite + React + Express** — flexibility สูง, setup เยอะ, ไม่มี server component

### Trade-offs
- ✅ Ecosystem ใหญ่, AI รู้จักดี, docs/tutorials เยอะ
- ✅ Server Components ลด client JS bundle
- ✅ TypeScript strict จับ bug ก่อน runtime
- ⚠️ App Router ยังเปลี่ยนแปลงบ่อย — บางคน prefer Pages Router
- ⚠️ Lock-in ระดับหนึ่งกับ Next conventions

### Source / Evidence
- Next.js docs (App Router stable since v13.4)
- nuttasanz/next-boilerplate (reference repo ที่ user ชี้)

---

## DEC-002: Use Drizzle ORM + PostgreSQL

- **Date:** 2026-05-18
- **Risk Level:** Medium
- **Status:** Proposed (จะ confirm ใน P2)

### Context
ต้องการ ORM ที่ type-safe และ user มองเห็น SQL ที่ execute จริง เพื่อให้ user (junior) เรียนรู้ concurrency/transaction ได้ดีขึ้น

### Decision
Drizzle ORM + PostgreSQL (docker-compose สำหรับ dev)

### Alternatives Considered
- **Prisma** — popular, schema-first, hide SQL (เหมาะ junior ที่ไม่อยากรู้ SQL)
- **Kysely** — query builder pure, type-safe แต่ไม่มี schema
- **Raw SQL** — control สุด, type safety ต่ำ

### Trade-offs
- ✅ Type-safe + SQL-first (เห็น query ที่จะ execute → ดีต่อการเรียนรู้)
- ✅ Light bundle, ไม่มี runtime engine
- ⚠️ Smaller community vs Prisma
- ⚠️ Migration story ยังไม่ mature เท่า Prisma

### Source / Evidence
- nuttasanz/next-boilerplate (ใช้ pattern เดียวกัน)
- Drizzle docs

---

## DEC-003: Use NextAuth (Auth.js) v5 for authentication

- **Date:** 2026-05-18
- **Risk Level:** High (security domain — OWASP A07)
- **Status:** Accepted

### Context
User ต้องการ self-hosted auth ไม่ต้องการ subscription คาดว่าจะ deploy เอง ต้องเป็น production-grade

### Decision
NextAuth (Auth.js) v5 — self-hosted

### Alternatives Considered
- **Clerk** — managed, paid (free tier 10K MAU), ลด security risk เยอะ, UX ดี
- **Supabase Auth** — managed + DB ในตัว, lock-in กับ Supabase
- **Custom auth** — ❌ ห้ามเด็ดขาด (OWASP A07 — เกือบทุก vulnerability auth มาจาก custom)

### Trade-offs
- ✅ Free, control เต็มที่
- ✅ Support OAuth providers + email + credentials providers
- ⚠️ ต้อง manage session/CSRF/password-reset เอง (NextAuth จัดการให้ส่วนใหญ่แต่ต้องเข้าใจ)
- ⚠️ Learning curve สูงกว่า Clerk

### Source / Evidence
- OWASP A07:2021 — Identification and Authentication Failures
- NextAuth/Auth.js docs
- User preference (self-hosted)

---

## DEC-004: Deploy via Docker on VPS (not Vercel)

- **Date:** 2026-05-18
- **Risk Level:** Medium
- **Status:** Accepted

### Context
User explicit preference: ไม่ใช้ Vercel มองว่าแพงและทำอะไรได้น้อย ต้องการ control + ราคา predictable

### Decision
Docker image + docker-compose สำหรับ deploy บน VPS (เช่น Hetzner, DigitalOcean, Linode)

### Alternatives Considered
- **Vercel** — fast deploy, edge functions แต่ user reject
- **Railway / Render** — managed Docker, ราคากลาง, vendor lock-in
- **Kubernetes** — overkill สำหรับ MVP/solo project

### Trade-offs
- ✅ ราคา predictable (VPS cost คงที่)
- ✅ No function timeout limits
- ✅ Run anywhere ที่มี Docker
- ⚠️ ต้อง manage server, SSL, monitoring, backup เอง
- ⚠️ Scale ต้อง manual (เพิ่ม instance + load balancer)

### Source / Evidence
- User decision (2026-05-18)
- nuttasanz/next-boilerplate ใช้ pattern เดียวกัน (Docker + Caddyfile)

---

## DEC-005: Generic template, badminton booking as example branch

- **Date:** 2026-05-18
- **Risk Level:** Low
- **Status:** Accepted

### Context
User ต้องการ template ที่ใช้ซ้ำได้กับ project อื่น ไม่ผูกกับ domain ใด domain หนึ่ง

### Decision
Main branch ของ template = generic (dummy entity ใน example)
Feature branch หรือ separate repo = badminton booking specific (clone จาก template แล้ว customize)

### Trade-offs
- ✅ Template ใช้ซ้ำได้
- ⚠️ ต้องระวังไม่ให้ example มี domain-specific reference

### Source / Evidence
- User decision (2026-05-18)

---

## DEC-006: Stack เลือกตามงาน ไม่ fix

- **Date:** 2026-05-18
- **Risk Level:** Medium
- **Status:** Accepted

### Context
User insight: stack ที่เหมาะกับ project ขึ้นกับลักษณะงาน VG-AI ไม่ควรล็อก stack

### Decision
แบ่ง discipline layer ออกเป็น 2 ชั้น:
- **Universal layer** (`CLAUDE.md` + `AGENTS.md`) — stack-agnostic
- **Stack-specific layer** (`CLAUDE.<stack>.md`) — เพิ่มเมื่อเลือก stack แล้ว

Template main = Next.js stack แต่ universal layer สามารถ reuse กับ stack อื่นได้

### Trade-offs
- ✅ ใช้ universal rules กับ project อื่นได้ (Python, Go, etc.)
- ⚠️ ต้อง maintain stack-specific layer แยกต่อ stack ที่ support

### Source / Evidence
- User decision (2026-05-18)
- ECC repo pattern (`.vgai/core/trust-kernel/common/`, `typescript/`, `python/`)
