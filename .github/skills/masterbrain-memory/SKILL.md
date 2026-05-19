---
name: masterbrain-memory
description: 'Decide what AI session information should become persistent MasterBrain memory: preferences, decisions, project context, lessons, workflows, goals, and open loops. Use for automatic memory capture and updates.'
---

# MasterBrain Memory

Use this skill to update the user's local MasterBrain memory autonomously.

## What To Capture

Capture information that is durable and likely useful later:

- User preferences, style, constraints, and recurring expectations
- Project goals, scope, current status, risks, and next actions
- Decisions and their consequences
- Lessons learned from mistakes or successful workflows
- Reusable prompts, commands, templates, and checklists
- Important people, roles, and collaboration context
- Open loops the user expects to revisit

## What Not To Capture In The Template Repo

- Secrets, credentials, tokens, keys, passwords, private URLs, customer data, personal data, confidential company content, and exact local machine paths.
- Use placeholders in public template files.

## Update Targets

- Preferences: `DIGEST/preferences.md`
- Decisions: `DIGEST/decisions.md`
- Projects: `DIGEST/projects.md` and `30_Projects/`
- AI workflows: `70_AI/`
- Maintenance history: `DIGEST/maintenance-log.md`
- Unsorted but valuable capture: `00_Inbox/`

## Capture Workflow

1. Identify whether the information is durable, temporary, or sensitive.
2. Update an existing note or digest when possible.
3. Create a new note only when no appropriate note exists.
4. Add source/provenance and date.
5. Mark uncertain information as uncertain.
6. Update the maintenance log with what changed.

## Conflict Handling

If new information contradicts existing memory, do not silently replace it. Add a short conflict note, preserve both claims, and ask the user to resolve when needed.