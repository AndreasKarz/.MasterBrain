# Claude Code Instructions

Follow the shared instructions in `AGENTS.md` first. This file adds Claude-specific workflow guidance for the installed local MasterBrain vault at `~/.MasterBrain`.

## Claude-Specific Workflow

- Start MasterBrain work by reading `AGENTS.md`, then `DIGEST/00_catalog.md`.
- Load the relevant DIGEST file before reading long notes, `RAW/`, or `LOCAL/` material.
- Keep durable memory and DIGEST files updated without waiting for explicit bookkeeping requests.
- Prefer updating existing notes and digests over creating duplicate context.
- Use local-only files for private notes, source URLs, credentials references, and machine-specific working details.

## Maintenance Workflow

- Prefer the `masterbrain-maintenance` skill for cleanup, quality checks, and digest refreshes when it is available.
- Prefer the `masterbrain-memory` skill when deciding whether session knowledge should become persistent memory.
- If the skills are unavailable, follow `70_AI/MasterBrain Maintenance Workflow.md` step by step.
- Record meaningful maintenance actions, unresolved issues, and open questions in `DIGEST/maintenance-log.md`.

## Safety

- Treat this vault as private local working memory, not as a public template repository.
- Do not store raw secrets, credentials, access tokens, private keys, passwords, connection strings, or recovery codes in notes.
- Do not copy local private content into public templates or shared artifacts.
- Ask before deleting notes, pruning knowledge, publishing/exporting content, or overwriting this vault.
