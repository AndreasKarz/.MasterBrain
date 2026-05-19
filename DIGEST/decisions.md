---
title: Decisions Digest
type: digest
status: active
created: 2026-05-11
updated: 2026-05-11
tags:
  - masterbrain
  - decisions
sensitivity: local
source: template
review: 2026-06-11
---

# Decisions Digest

Record durable decisions that shape the MasterBrain.

| Date | Decision | Rationale | Consequence | Review |
|---|---|---|---|---|
| 2026-05-11 | Use this repo as a public template and `~/.MasterBrain` as the private local vault. | Keeps reusable setup separate from private memory. | Install scripts copy template files into a local working vault. | 2026-06-11 |
| 2026-05-11 | Use a DIGEST-first context model. | AI agents need compact, stable context before reading large source material. | Every meaningful RAW/source addition should update a digest. | 2026-06-11 |
| 2026-05-11 | Maintenance should be available as skill, prompt, and agent. | Different AI tools expose different customization primitives. | The fallback chain is skill first, prompt second, manual workflow third. | 2026-06-11 |
| 2026-05-11 | Use a restricted tool adapter for cross-workspace MasterBrain updates. | MasterBrain should be central knowledge for all projects without being added to every workspace. | Configure MCP/filesystem or Obsidian CLI access with the MasterBrain vault as the only allowed root. | 2026-06-11 |
| 2026-05-11 | Use vcf-contacts plugin (vCard 4.0 YAML frontmatter) for contact management. | The broekema41/obsidian-vcf-contacts plugin enables import/export and Obsidian integration with a standard format. | All contact notes in `50_People/` follow vCard 4.0 YAML frontmatter. Notes are `sensitivity: local` and must never be committed to a public repository. | 2026-08-11 |

## Decision Template

Use `80_Templates/Decision Note.md` for full decision notes.