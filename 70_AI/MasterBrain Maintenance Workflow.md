---
title: MasterBrain Maintenance Workflow
type: workflow
status: active
created: 2026-05-11
updated: 2026-05-11
tags:
  - masterbrain
  - ai
  - maintenance
sensitivity: template
source: template
review: 2026-06-11
---

# MasterBrain Maintenance Workflow

## Trigger

Run this workflow after major AI sessions, after adding sources, or on a weekly review cadence.

## Steps

1. Read `DIGEST/00_catalog.md`.
2. Review `00_Inbox/` and route items.
3. Update preferences, decisions, projects, and skills digests.
4. Refresh topic and folder digests for changed areas.
5. Check for stale, duplicate, or conflicting notes.
6. Check template-tracked files for sensitive content.
7. Update `DIGEST/maintenance-log.md`.

## Fallbacks

- Preferred: use the `masterbrain-maintenance` skill.
- Fallback: use `prompts/maintain-masterbrain.prompt.md`.
- Manual: follow this note step by step.