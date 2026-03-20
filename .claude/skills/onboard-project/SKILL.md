---
name: onboard-project
description: Onboard a new OSS project. Run this when given a GitHub URL or org/repo pair for a project to contribute to. Creates the project folder, walks through DeepWiki, CONTRIBUTING.md, community channels, and all unknown unknowns. Never skip steps.
allowed-tools: WebFetch,WebSearch,Bash(gh:*),Read,Write,Glob,Grep
---

# Skill: onboard-project

## When to use

Any time a new OSS project is introduced — a GitHub URL, an `org/repo` slug, or a project name.
Do not start contributing before this skill has been completed for the project.

## Argument

The argument is `{org}/{repo}` or a GitHub URL. Extract the org and repo from it.

## Phase 1 — Architecture via DeepWiki

Fetch `https://deepwiki.com/{org}/{repo}` and read the wiki structure.

Ask the user:
> "Before I show you the architecture summary — what do you think this project does?
> What is its core abstraction? What problem does it solve?"

Wait for their answer. Then present the DeepWiki summary and ask:
> "How close was your mental model? What surprised you?"

Record the architecture in `projects/{name}/overview.md`:

```markdown
# {Project name} — Architecture Overview
Source: deepwiki.com/{org}/{repo} | Date: {YYYY-MM-DD}

## What it does (one sentence)

## Core abstractions
<!-- key interfaces, base classes, protocols -->

## Module map
<!-- directory → responsibility -->

## Entry points
<!-- where execution starts, main packages, CLI commands -->

## Key design decisions
<!-- anything non-obvious about why it's structured this way -->

## Data flow
<!-- how data moves through the system end-to-end -->
```

## Phase 2 — Community guidelines

Fetch and read the following files from the repo in order. For each, summarize the key rules
that affect contributors:

1. `CONTRIBUTING.md` (or `CONTRIBUTING.rst`, `docs/contributing.md`)
2. `CODE_OF_CONDUCT.md`
3. `SECURITY.md` (if it exists)
4. `.github/ISSUE_TEMPLATE/` (list all templates)
5. `.github/PULL_REQUEST_TEMPLATE.md`

After reading CONTRIBUTING.md, ask:
> "What surprised you about the contribution process for this project?
> What is different from what you expected?"

## Phase 3 — Development environment setup

Read the README and CONTRIBUTING.md for setup instructions. Ask:
> "Have you set up this project locally before? What step do you think will be hardest?"

Walk through setup:
- Identify the exact commands to build and test
- Identify the linter/formatter and how to run it
- Identify the pre-commit config (`.pre-commit-config.yaml`) if present
- Identify how to run a specific test file or test case (important for iteration speed)
- Identify environment variables or secrets needed

Record in `projects/{name}/setup.md`:
```markdown
# {Project name} — Setup Notes
Date: {YYYY-MM-DD}

## Build
<!-- exact commands -->

## Test (full suite)
<!-- exact commands -->

## Test (single file/case)
<!-- how to run just one test -->

## Lint / format
<!-- commands and config files -->

## Pre-commit hooks (project's own)
<!-- what the project enforces on commit -->

## Environment variables / secrets needed
<!-- list any required env vars -->

## CI matrix
<!-- what language versions CI tests against -->

## Setup issues encountered
<!-- anything that wasn't in the docs -->
```

## Phase 4 — PR archaeology (read before contributing)

Fetch the 10 most recently merged PRs using `gh pr list --state merged --limit 10 --repo {org}/{repo}`.

For each PR, look for patterns in:
- Commit message format (conventional commits? ticket prefix?)
- PR description format
- How long review took
- What maintainers asked contributors to change most often

Ask:
> "Based on these PRs, what do you think maintainers here care most about?
> What would make a PR get rejected?"

Document findings in `projects/{name}/setup.md` under `## PR patterns`.

## Phase 5 — Unknown unknowns checklist

Go through each item and mark it:

```markdown
## Unknown unknowns checklist
- [ ] Copyright/license headers required on new files? (check existing new files in recent PRs)
- [ ] DCO sign-off required? (`git commit -s` — check CONTRIBUTING.md or recent PR commits)
- [ ] GPG signature required? (check repo settings or CONTRIBUTING.md)
- [ ] Changelog entry required? (check CHANGELOG.md, `changes/`, `NEWS` — check recent PRs)
- [ ] Breaking change documentation policy? (semver? feature flags?)
- [ ] Vendored dependencies — never update without explicit instruction
- [ ] CI matrix — note all language/runtime versions tested
- [ ] Integration tests that need external services (database, network, etc.)
- [ ] Known flaky tests (check issue tracker for "flaky" label)
- [ ] Backport policy — does a fix go to main only or also release branches?
- [ ] Issue claiming etiquette — comment before starting? Maintainer ack required?
- [ ] Draft PR convention — open draft early or only when ready?
- [ ] Mailing list / Discord / Slack — where to ask questions?
- [ ] Maintainer response time expectation (check recent issue activity)
```

## Phase 6 — First issue selection

Search for beginner-appropriate issues:

```
gh issue list --repo {org}/{repo} --label "good first issue" --state open --limit 20
```

Also try: `"help wanted"`, `"beginner"`, `"easy"`, `"starter"`.

Do NOT suggest picking an issue yet. Ask:
> "Read through these issues. Which one do you understand best — not which one seems easiest,
> but which one you can explain back to me in terms of what the code is doing wrong?"

## Phase 7 — Update memory

After all phases complete:
1. Update `memory/landscape.md` — add the project entry
2. Update `memory/MEMORY.md` — add a link to the project overview under "Active projects"
3. Write `memory/daily/{YYYY-MM-DD}.md` session entry

Say: "Onboarding complete. Overview and setup notes saved. Ready to explore issues — use
/explore-issue when you've picked one."
