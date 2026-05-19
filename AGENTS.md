# MasterBrain Agent Instructions

This workspace is the installed local MasterBrain vault at `~/.MasterBrain`. Treat it as the user's private working memory, not as the public template repository.

## Operating Model

- Start with `DIGEST/00_catalog.md` for orientation, then read the smallest relevant digest before opening long source notes.
- Keep memory current autonomously: capture durable preferences, decisions, project context, lessons learned, and reusable workflows when they become clear.
- Prefer updating existing DIGEST files and notes over creating duplicate context.
- Read `RAW/` only when exact source detail is needed, and summarize only durable, useful context back into DIGEST.
- Use `00_Inbox/` for unsorted captures, then route them during maintenance.
- If a maintenance skill is available, use it for upkeep. If not, follow `70_AI/MasterBrain Maintenance Workflow.md`.

## Privacy Boundary

- This local vault may contain private working memory. Do not copy local private content into public templates, public artifacts, or shared repositories.
- Do not store raw secrets, credentials, access tokens, private keys, passwords, connection strings, or recovery codes in notes.
- Keep sensitive source material in `LOCAL/` or `RAW/` when it must remain local-only; summarize carefully into DIGEST only when useful and safe.
- If private material is needed for a reusable example, use placeholders such as `<PROJECT_NAME>`, `<PERSON_NAME>`, `<INTERNAL_URL>`, or `<SECRET_NAME>`.
- Before publishing, exporting, committing, or packaging any content, review it for accidental sensitive data.

## Knowledge Architecture

- `DIGEST/` contains compact agent-facing context and should stay small.
- `00_Inbox/` is for temporary captures awaiting triage.
- `10_MOC/` supports human navigation in Obsidian.
- `20_Areas/`, `30_Projects/`, `40_Resources/`, `50_People/`, and `60_Decisions/` contain durable organized notes.
- `70_AI/` contains AI workflows, tool-access notes, and maintenance guidance.
- `80_Templates/` contains reusable note templates.
- `90_Archive/` contains obsolete or inactive material.
- `RAW/` contains original source material; `LOCAL/` contains local-only working material.

## Quality Rules

- Every durable note should have frontmatter with `title`, `type`, `status`, `created`, `updated`, `tags`, and `sensitivity`.
- Every durable note should answer: what is this, why does it matter, what changed, where is the source, and what should happen next.
- Every meaningful RAW/source addition should update the matching DIGEST entry.
- Every decision should include context, decision, alternatives, consequences, owner, and review date.
- Every project note should include current status, desired outcome, next action, risks, and relevant links.
- Mark uncertain, stale, or unverified knowledge explicitly instead of writing it as fact.

## Agent Behavior

- Be proactive about maintaining the vault when the user asks to improve the MasterBrain setup or when durable memory appears during normal work.
- Ask before destructive actions, pruning knowledge, publishing/exporting content, overwriting this vault, or changing shared/cloud systems.
- Keep changes focused and local-vault-safe.
- After meaningful maintenance or workflow changes, update the relevant DIGEST file and `DIGEST/maintenance-log.md`.
