# GitHub Copilot Instructions

Follow the shared vault rules in [AGENTS.md](../AGENTS.md) first. This file is the GitHub Copilot entry point for the installed local MasterBrain vault at `~/.MasterBrain`.

## Copilot-Specific Workflow

- Treat this workspace as the user's private local working memory, not as the public MasterBrain template repository.
- Start MasterBrain work with `DIGEST/00_catalog.md`, then load the smallest relevant digest before reading long notes, `RAW/`, or `LOCAL/` material.
- Keep durable preferences, decisions, project context, lessons, and reusable workflows current when they become clear.
- Prefer updating existing notes and DIGEST files over creating duplicate context.
- Use `00_Inbox/` for quick unsorted captures when the right durable location is not yet clear.

## Maintenance Workflow

- Use the `masterbrain-maintenance` skill when reviewing, cleaning up, or refreshing the vault.
- Use the `masterbrain-memory` skill when deciding whether session knowledge should become persistent MasterBrain memory.
- If a skill is unavailable, follow `70_AI/MasterBrain Maintenance Workflow.md` step by step.
- Record meaningful upkeep, unresolved issues, and open questions in `DIGEST/maintenance-log.md`.

## Safety

- Treat local MasterBrain content as private by default.
- Do not store raw secrets, credentials, access tokens, private keys, passwords, connection strings, or recovery codes in notes.
- Do not copy local private content into public templates, public artifacts, shared repositories, prompts, agents, or skills.
- Use placeholders in reusable examples: `<PROJECT_NAME>`, `<PERSON_NAME>`, `<INTERNAL_URL>`, or `<SECRET_NAME>`.
- Ask before deleting notes, pruning knowledge, publishing/exporting content, overwriting this vault, or changing shared/cloud systems.