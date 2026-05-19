---
name: maintain-masterbrain
description: 'Run a MasterBrain maintenance pass: quality checks, digest refresh, stale notes, and memory hygiene.'
agent: agent
---

# Maintain MasterBrain

Run a maintenance pass on my local MasterBrain vault.

Scope:

- Use `~/.MasterBrain` unless I provide another vault path.
- Check `00_Inbox/`, `DIGEST/`, `10_MOC/`, `20_Areas/`, `30_Projects/`, `60_Decisions/`, and `70_AI/`.
- Do not delete content without asking. You may add, update, rename suggestions, and mark stale content.

Maintenance workflow:

1. Read `DIGEST/00_catalog.md` first.
2. Find notes missing required frontmatter or key sections.
3. Move actionable unsorted ideas from `00_Inbox/` into proposed target notes or create a maintenance report if moving automatically is unsafe.
4. Refresh `DIGEST/preferences.md`, `DIGEST/decisions.md`, `DIGEST/projects.md`, and relevant topic/folder digests.
5. Mark stale, duplicate, or conflicting knowledge and propose resolution.
6. Update `DIGEST/maintenance-log.md` with the date, changed files, unresolved issues, and next maintenance actions.

Output:

- Summarize changes made.
- List open questions or items that need my decision.
- List any sensitive content risk found in files that might be committed.