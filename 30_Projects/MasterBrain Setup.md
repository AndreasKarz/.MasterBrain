---
title: MasterBrain Setup
type: project
status: active
created: 2026-05-11
updated: 2026-05-11
tags:
  - masterbrain
  - project
  - setup
sensitivity: template
source: conversation
review: 2026-06-11
---

# MasterBrain Setup

## Outcome

A reusable, public Obsidian vault template for local AI-assisted knowledge workflows with GitHub Copilot and Claude.

## Current Status

Active. Initial template structure created 2026-05-11. First real maintenance pass completed 2026-05-11.

## Completed

- Created DIGEST-first context model with all core DIGEST files.
- Validated `AGENTS.md`, `CLAUDE.md`, and `.github/copilot-instructions.md` for local vs. public template distinction.
- Added root `readme.md` as human setup guide with workflow diagram and multi-folder workspace guidance.
- Added maintenance and memory workflows: `masterbrain-maintenance` skill, `maintain-masterbrain.prompt.md`, and `MasterBrain Maintenance Workflow.md` manual fallback.
- Imported 77 CTRM contacts into `50_People/` using vcf-contacts vCard 4.0 YAML frontmatter (broekema41/obsidian-vcf-contacts).
- Ran first real maintenance pass (2026-05-11): scanned inbox, checked frontmatter, refreshed DIGESTs, created missing project note.

## Next Actions

1. Validate install scripts on Windows and macOS.
2. Configure and test the restricted MasterBrain tool adapter (MCP/filesystem or Obsidian CLI) from another workspace.
3. Decide which Obsidian community plugins are mandatory vs. recommended.
4. Replace folder wikilink to `00_Inbox` with an index note or plain folder reference.
5. Create `60_Decisions/` individual notes from decisions captured in `DIGEST/decisions.md`.

## Risks

- Install script not validated on macOS; may need path or shell adaptation.
- Restricted tool adapter not yet configured or tested in a real project workspace.
- No `.gitignore` in local vault — ensure `50_People/` and other local-only content are never accidentally pushed if vault is ever put under git.

## Links

- [[../DIGEST/projects|Projects Digest]]
- [[../DIGEST/decisions|Decisions Digest]]
- [[../70_AI/Central MasterBrain Tool Access|Central MasterBrain Tool Access]]
- [[../70_AI/MasterBrain Maintenance Workflow|MasterBrain Maintenance Workflow]]
