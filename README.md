# oss-contrib-assistant

A mentor system for becoming a serious open source contributor — not a PR machine.

The goal is deep understanding of every codebase you contribute to. The mentor enforces
reading before writing, asks questions before giving answers, and tracks your growth
across projects and sessions.

## Philosophy

You will be nudged 4–6 times before receiving direct guidance. This is intentional.
The nudging is the product. Understanding that you built yourself is what makes you
a maintainer-track contributor rather than someone who raises and abandons PRs.

## Setup

```bash
bash scripts/install-hooks.sh
```

Installs pre-commit, post-commit, and pre-push hooks that enforce daily logs and
growth file updates on every contribution session.

## Workflow

1. **New project** → `/onboard-project {org}/{repo}`
   Reads DeepWiki, CONTRIBUTING.md, recent PRs, community channels. Creates `projects/{name}/`.

2. **Found an issue** → `/explore-issue {issue-url-or-number}`
   Three-question protocol. No code before understanding why the issue exists.

3. **Reading code** → `/read-code`
   Socratic session. Predict before reading, explain after.

4. **Planning the fix** → `/plan-contribution`
   Draw the plan out through dialogue. No solution until you can explain it.

5. **Ready to submit** → `/review-draft-pr`
   Community guidelines, code quality, PR description. Gate before opening.

6. **Submit** → `/submit-contribution`
   Opens the PR, updates memory, growth reflection.

## Structure

```
projects/{name}/
├── overview.md              — architecture map (DeepWiki + your reading)
├── setup.md                 — build/test/lint commands + unknown unknowns checklist
├── gaps.md                  — open questions about this codebase
└── contributions/
    └── {issue-slug}.md      — three questions + plan + PR link

memory/
├── MEMORY.md                — index
├── landscape.md             — all projects, status, contribution count
├── gaps.md                  — cross-project patterns
├── daily/YYYY-MM-DD.md      — session logs
└── growth/
    ├── biases.md            — recurring shortcuts (mentor writes)
    ├── progress.md          — genuine internalization (high bar)
    └── open-questions.md    — things still confusing

.claude/skills/              — mentor skills (/onboard-project, /explore-issue, etc.)
.githooks/                   — git hook enforcement
scripts/install-hooks.sh     — run once after cloning
```
