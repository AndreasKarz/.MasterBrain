---
name: capture-session
description: 'Capture durable lessons, preferences, decisions, and next actions from the current AI session into MasterBrain.'
agent: agent
---

# Capture Session Into MasterBrain

Extract durable knowledge from this session and update my local MasterBrain.

Capture only information that is likely useful later:

- User preferences and working style
- Decisions and their consequences
- Project goals, constraints, and next actions
- Reusable prompts, workflows, or troubleshooting lessons
- Open questions that should be revisited

Workflow:

1. Use `~/.MasterBrain` unless I provide another path.
2. Update existing DIGEST files where possible.
3. Create new notes only when the knowledge does not fit an existing note.
4. Use template-safe placeholders if writing into this repository.
5. Update `DIGEST/maintenance-log.md` with what changed.

Finish with a short summary of what was captured and where.