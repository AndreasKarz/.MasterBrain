---
name: start-masterbrain
description: 'Hydrate an AI session from the local MasterBrain vault before starting work.'
agent: agent
---

# Start MasterBrain Session

You are helping me with my local MasterBrain.

Use this workflow:

1. Locate the local vault at `~/.MasterBrain` unless I provide another path.
2. Read `DIGEST/00_catalog.md`, `DIGEST/preferences.md`, `DIGEST/decisions.md`, and any topic digest that matches my current request.
3. If the DIGEST layer is stale or incomplete, read the relevant source notes and update the DIGEST layer before continuing.
4. Work proactively. If the task implies edits, implement them.
5. Keep memory current: update preferences, decisions, project notes, and maintenance log when durable information appears.
6. Do not write private content into the template repository unless I explicitly ask for a sanitized example.

After orientation, give me a concise status: what context you loaded, what seems relevant, and what you will do next.