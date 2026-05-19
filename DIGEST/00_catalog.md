---
title: MasterBrain Context Catalog
type: digest
status: active
created: 2026-05-11
updated: 2026-05-11
tags:
  - masterbrain
  - digest
sensitivity: template
source: template
review: 2026-06-11
---

# MasterBrain Context Catalog

This is the first file an AI assistant should read when hydrating context from the local MasterBrain.

## Quick Navigation

| Area | Purpose | Agent use |
|---|---|---|
| `readme.md` | Human onboarding guide for setup, workflow, workspace usage, and learning resources | Use for explaining the setup to people |
| `DIGEST/preferences.md` | Durable user preferences | Load early |
| `DIGEST/decisions.md` | Durable decisions | Load early |
| `DIGEST/projects.md` | Current project overview | Load for project work |
| `DIGEST/skills.md` | Available AI skills/workflows | Load for workflow design |
| `70_AI/Central MasterBrain Tool Access.md` | Restricted tool-access pattern for cross-workspace memory updates | Load when configuring MCP/filesystem/Obsidian-CLI access |
| `DIGEST/glossary.md` | Terms and abbreviations | Load for terminology |
| `DIGEST/maintenance-log.md` | Recent upkeep and open issues | Load before maintenance |
| `10_MOC/` | Human navigation | Use for Obsidian structure |
| `50_People/` | Swiss Life CTRM contacts (77 notes, vcf-contacts format) | Load `DIGEST/20_folders/50_people.md` for format details |
| `RAW/` | Original local-only source material | Read only when exact detail is needed |

## Query Routing

| User intent | Start here |
|---|---|
| Preferences or working style | `DIGEST/preferences.md` |
| Past choices or rationale | `DIGEST/decisions.md` |
| Current work | `DIGEST/projects.md` |
| AI workflow, prompt, agent, skill | `DIGEST/skills.md`, `70_AI/` |
| Cross-workspace memory tool access | `70_AI/Central MasterBrain Tool Access.md` |
| Source-specific details | `DIGEST/20_folders/`, then `RAW/` |
| Contact information | `50_People/` (see `DIGEST/20_folders/50_people.md`) |
| Concept overview | `DIGEST/10_topics/` |

## Maintenance State

| Metric | Value |
|---|---|
| Template created | 2026-05-11 |
| Last maintenance | 2026-05-11 (first real maintenance pass) |
| Open maintenance issues | See `DIGEST/maintenance-log.md` |

## Golden Rule

DIGEST first, RAW on demand, local private data never back into the public template.