---
title: Central MasterBrain Tool Access
type: workflow
status: active
created: 2026-05-11
updated: 2026-05-11
tags:
  - masterbrain
  - ai
  - mcp
sensitivity: local
source: conversation
review: 2026-06-11
---

# Central MasterBrain Tool Access

## Purpose

Use MasterBrain as central cross-workspace AI memory without adding the vault as a folder to every project workspace.

## Decision

Expose the MasterBrain vault through an explicit, restricted tool adapter such as an MCP filesystem server or an Obsidian CLI wrapper. The adapter should grant access only to the MasterBrain vault, not to unrelated project folders or the full user profile.

## Access Boundary

- Allowed root: the local MasterBrain vault.
- Preferred read path: `DIGEST/00_catalog.md` first, then the relevant digest.
- Preferred write targets: `DIGEST/preferences.md`, `DIGEST/decisions.md`, `DIGEST/projects.md`, `DIGEST/maintenance-log.md`, `30_Projects/`, `60_Decisions/`, `70_AI/`, and `00_Inbox/`.
- `RAW/` should be read only when exact source detail is needed.
- `LOCAL/` and private source material should remain local-only and should not be copied into public template files.

## Agent Workflow

1. Decide whether the new information is durable enough to remember.
2. Read `DIGEST/00_catalog.md` and the relevant digest before writing.
3. Update the smallest appropriate digest or note.
4. Record meaningful maintenance actions in `DIGEST/maintenance-log.md`.
5. If the tool adapter is unavailable, return a compact `Memory Update` block for later capture.

## Configuration Sketch

- Filesystem MCP option: configure a server with a single allowlisted root pointing to the MasterBrain vault.
- Obsidian CLI option: expose a wrapper that targets the MasterBrain vault and supports read, create, append, search, and property updates.
- Do not require every project workspace to include the MasterBrain folder directly.

## Related

- [[../DIGEST/00_catalog]]
- [[../DIGEST/preferences]]
- [[../DIGEST/decisions]]
- [[MasterBrain Maintenance Workflow]]