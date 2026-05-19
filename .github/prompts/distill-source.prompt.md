---
name: distill-source
description: 'Turn a source document, web page, transcript, or raw note into MasterBrain RAW plus DIGEST entries.'
agent: agent
---

# Distill Source Into MasterBrain

Distill the provided source into my local MasterBrain.

Workflow:

1. Save or reference the original in `RAW/` when appropriate.
2. Create or update a folder digest in `DIGEST/20_folders/`.
3. Create or update a topic digest in `DIGEST/10_topics/` when the content affects a broader theme.
4. Extract durable decisions into `DIGEST/decisions.md`.
5. Extract durable preferences into `DIGEST/preferences.md`.
6. Add important terms to `DIGEST/glossary.md`.
7. Update `DIGEST/00_catalog.md` if a new topic or folder is introduced.

Quality bar:

- Keep DIGEST entries compact.
- Preserve source provenance.
- Mark uncertainty.
- Do not store secrets or confidential data in this repository.