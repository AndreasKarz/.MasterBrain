---
name: 'MasterBrain Knowledge Standards'
description: 'Use when creating, updating, reviewing, or maintaining MasterBrain Obsidian notes, DIGEST files, prompts, agents, skills, and memory workflows.'
applyTo: '**/*.md'
---

# MasterBrain Knowledge Standards

Use these standards when working on MasterBrain content.

- Treat this repository as a public template. Do not add real secrets, private personal data, confidential company data, internal URLs, or machine-specific paths.
- In a local installed vault, update memory autonomously when you learn durable preferences, decisions, goals, project context, lessons, or reusable workflows.
- Prefer `DIGEST/` for compact agent-facing context and `RAW/` for original source material.
- Update `DIGEST/00_catalog.md` when adding or changing major folders, topics, or workflows.
- Update `DIGEST/decisions.md` when a durable architectural, workflow, or personal operating decision is made.
- Update `DIGEST/preferences.md` when durable user preferences appear.
- Use frontmatter on durable notes:

```yaml
---
title: <Title>
type: note
status: draft
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags:
  - masterbrain
sensitivity: local
source: manual
review: YYYY-MM-DD
---
```

- Keep notes useful to both a human and an AI: explain context, decision or insight, evidence/source, next action, and related links.
- Mark uncertain knowledge explicitly instead of writing it as fact.
- If a note becomes obsolete, update its `status` to `archived` or `superseded` and link to the replacement.