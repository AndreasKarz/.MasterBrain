---
name: masterbrain-maintenance
description: 'Maintain an Obsidian MasterBrain: update DIGEST files, complete note metadata, triage inbox items, detect stale or duplicate knowledge, refresh decisions/preferences/projects, and run safety checks before committing a template.'
---

# MasterBrain Maintenance

Use this skill whenever the user asks to maintain, clean up, review, update, or improve a MasterBrain vault or this template repository.

## Default Scope

- Template work: current repository.
- Local user work: `~/.MasterBrain` unless another vault path is given.
- Local vault content can be broadly read and updated unless the user restricts access.
- The public template repository must stay free of sensitive content.

## Maintenance Pass

1. Read `DIGEST/00_catalog.md` for orientation.
2. Check `DIGEST/preferences.md`, `DIGEST/decisions.md`, `DIGEST/projects.md`, and `DIGEST/maintenance-log.md`.
3. Scan `00_Inbox/` for unsorted notes and route them to the right folder or propose routing.
4. Check durable notes for required frontmatter: `title`, `type`, `status`, `created`, `updated`, `tags`, `sensitivity`.
5. Refresh folder digests under `DIGEST/20_folders/` when source folders change.
6. Refresh topic digests under `DIGEST/10_topics/` when recurring themes change.
7. Update `DIGEST/00_catalog.md` when topics, folders, or workflow files change.
8. Record maintenance actions, open questions, and unresolved issues in `DIGEST/maintenance-log.md`.

## Quality Checklist

- Notes have clear purpose, source/provenance, next action, and related links.
- DIGEST entries are compact enough for agent context.
- RAW/source content is not duplicated into long digest prose.
- Decisions include context, decision, alternatives, consequences, owner, and review date.
- Preferences are stated as durable, actionable facts.
- Stale or uncertain knowledge is labelled explicitly.
- Private or sensitive content is local-only and not template-tracked.

## Safety Check Before Commit

Search changed files for obvious secret indicators: `password`, `token`, `secret`, `apikey`, `api_key`, `private key`, `connection string`, `internal`, `customer`, `client`, `tenant`, and real URLs. Replace template examples with placeholders.

Ask before deleting notes, overwriting a local vault, or publishing any generated content.