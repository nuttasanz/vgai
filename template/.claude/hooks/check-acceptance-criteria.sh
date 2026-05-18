#!/usr/bin/env bash
# Pre-tool-use hook: block Edit/Write/MultiEdit if no Acceptance Criteria marker in recent transcript
# VG-AI rule R5 (see CLAUDE.md)
#
# Hook protocol:
# - reads JSON from stdin (contains transcript_path)
# - exit 0 = allow
# - exit 2 = block (stderr shown to model)

set -euo pipefail

INPUT=$(cat)

# Get transcript path from input (Claude Code provides this)
TRANSCRIPT_PATH=$(echo "$INPUT" | grep -o '"transcript_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*"transcript_path"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/' || echo "")

if [ -z "$TRANSCRIPT_PATH" ] || [ ! -f "$TRANSCRIPT_PATH" ]; then
  # Can't verify — pass through (don't break if hook env is unexpected)
  exit 0
fi

# Look in last ~500 lines for "Acceptance Criteria" marker
# (rough heuristic — refine if false positives/negatives)
RECENT=$(tail -n 500 "$TRANSCRIPT_PATH" 2>/dev/null || echo "")

if echo "$RECENT" | grep -qi "Acceptance Criteria"; then
  exit 0
fi

# No AC found — block
cat >&2 <<'EOF'
🛑 VG-AI Hook Block: ห้าม Edit/Write/MultiEdit ก่อนมี Acceptance Criteria

ตามกฎ R5 ใน CLAUDE.md ทุก task ใหม่ต้องเขียน Acceptance Criteria ก่อน

วิธีแก้:
  1. หยุด tool call นี้
  2. List 3-5 acceptance criteria:

     Acceptance Criteria:
     1. ...
     2. ...

  3. Classify risk (Low / Medium / High) ตาม R6
  4. ถาม user: "approve ให้เริ่มได้ไหมครับ?"
  5. รอ user ตอบ approve แล้วค่อยกลับมา Edit/Write

ถ้านี่คือ continuation ของ task เดิม (AC ผ่านไปแล้วใน message เก่าที่หลุดออกจาก context):
  พิมพ์ "Acceptance Criteria (continuing from earlier): <สรุปสั้น>" เพื่อให้ hook ตรวจเจอ

ใช้ /start-task เพื่อช่วย flow นี้ได้
EOF

exit 2
