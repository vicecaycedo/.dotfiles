---
name: commit-message-writer
description: Write high-quality git commit messages from staged changes. Trigger this skill only when the user explicitly invokes "$commit-message-writer" (or directly names this skill).
---

# Commit Message Writer

## Goal

Produce commit messages that are concise, plain, and motivation-driven.
Prioritize why the change exists, not only what files changed.

## Trigger Mode

Manual only. Do not auto-trigger from intent; run this skill only on explicit invocation.

## Workflow

1. Inspect staged changes only.
2. Summarize the change intent in one sentence.
3. Detect whether the staged diff mixes unrelated concerns.
4. Generate message options in the format requested by the user.

Use these commands:

```sh
git diff --cached --name-only
git diff --cached --
```

## Message Rules

- Use imperative mood in the subject.
- Keep wording direct and not wordy.
- Emphasize motivation and behavioral impact.
- Avoid marketing language and filler.
- Avoid `feat:`, `fix:`, `chore:` prefixes unless explicitly requested.
- If no staged changes exist, say so and ask the user to stage changes first.

## Default Output Format

When the user does not request a specific format, return 3 options:

1. Very brief subject line.
2. Concise subject + short body (2-4 lines).
3. Slightly more detailed subject + body.

Use this structure:

```text
1) <subject>

2) <subject>

<body>

3) <subject>

<body>
```
