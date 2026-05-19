---
title: Maintenance Log
type: log
status: active
created: 2026-05-11
updated: 2026-05-11
tags:
  - masterbrain
  - maintenance
sensitivity: local
source: maintenance
review: 2026-06-11
---

# Maintenance Log

## 2026-05-11

- Created initial template vault structure.
- Added DIGEST-first context model.
- Added maintenance and memory workflow placeholders.
- Captured the decision to use restricted MCP/filesystem/Obsidian-CLI tool access for central cross-workspace MasterBrain updates.
- Validated `AGENTS.md`, `CLAUDE.md`, and `.github/copilot-instructions.md` against the installed local vault setup; updated them to distinguish local private memory from the public template, clarify DIGEST-first workflow, maintenance fallback, and privacy boundaries.
- Strengthened `.github/copilot-instructions.md` as the explicit GitHub Copilot entry point, mirroring the clarity of `CLAUDE.md` with Copilot-specific workflow, maintenance, and safety sections.
- Added root `readme.md` as the human setup guide with workflow diagram, `.code-workspace` guidance, safety rules, and external learning resources; linked it from `Home.md` and `DIGEST/00_catalog.md`.
- Extended `readme.md` with local multi-folder `.code-workspace` guidance, including SharePoint libraries synced through OneDrive.
- Captured `Abwesenheiten.xlsx` as a local Inbox reference in `00_Inbox/2026-05-11 Abwesenheiten Workbook.md`; workbook contents were not analyzed.
- Captured Fusion-UI Playwright GraphQL interception lesson in `40_Resources/Fusion-UI Playwright GraphQL Interception.md` after resolving PFXPlan age-restriction E2E mismatch.

## 2026-05-11 (Maintenance Pass 1)

- First real vault maintenance pass completed.
- Triaged `00_Inbox/2026-05-11.md`: extracted agent-framework knowledge to `40_Resources/Microsoft Agent Framework.md`; SL Workbench test entry deemed obsolete. File pending user deletion decision.
- Created `30_Projects/MasterBrain Setup.md` — resolved long-standing open item.
- Created `DIGEST/20_folders/50_people.md` — folder digest for 77 CTRM contacts in vcf-contacts (vCard 4.0) format.
- Updated `DIGEST/projects.md`: updated next action, added Completed Projects section, linked `30_Projects/MasterBrain Setup.md`.
- Updated `DIGEST/decisions.md`: added vcf-contacts plugin decision.
- Updated `DIGEST/00_catalog.md`: added `50_People/` to Quick Navigation and Query Routing tables.
- Confirmed `70_AI/` and `20_Areas/` notes are current; no changes needed.
- Sensitivity scan: `50_People/` (77 files, `sensitivity: local`) OK. **Risk flagged**: no `.gitignore` in local vault — these files could be accidentally committed to a public repo.

## Open Items

- Validate install scripts on Windows and macOS.
- Configure and test the restricted MasterBrain tool adapter from another workspace.
- Decide whether enabled Obsidian community plugins should be installed automatically or moved to recommended-plugin documentation.
- Replace the folder wikilink to `00_Inbox` with an index note or a plain folder reference.
- Decide which Obsidian plugins should be mandatory versus recommended.
- **User decision needed**: Delete `00_Inbox/2026-05-11.md`? Content fully triaged (agent-framework → `40_Resources/`, note added to SL Workbench `Notizen`).
- **User decision needed**: Move `00_Inbox/2026-05-11 Abwesenheiten Workbook.md` to `40_Resources/` or leave in inbox? → **Done: moved to `40_Resources/Abwesenheiten Workbook.md`**.