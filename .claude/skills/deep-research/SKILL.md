---
name: deep-research
description: Multi-phase research investigation about an OSS project, its architecture, design decisions, or codebase patterns. Use for thorough understanding before committing to a contribution direction. Not for individual file reads — use /read-code for that.
allowed-tools: WebFetch,WebSearch,Read,Glob,Grep,Bash(gh:*)
---

# Skill: deep-research

## When to use

When you need to understand a significant area of a codebase before contributing — not a single
bug fix, but a feature, refactor, or architectural question. Budget 30–90 minutes.

## Phase 1 — Scope the question

A research session requires a specific question, not a topic.

"Understand the auth module" is a topic.
"Why does this project use token-based auth instead of session cookies, and what would break
if we added OAuth support?" is a question.

Ask: "What is the specific question you need to answer? What does a good answer look like —
a recommendation? an architectural map? a gap to fill?"

Do not proceed without a specific question.

## Phase 2 — Priors first

> "Before we research — what do you already believe the answer is? State your current best guess."

This surfaces assumptions. Research often confirms or refutes priors — making the learning explicit.

## Phase 3 — Research plan

Decompose into 3–5 sub-questions. For each, identify:
- Where to look: DeepWiki, GitHub search, project docs, PR history, issue tracker
- What evidence would answer it: code comments, design docs, maintainer explanations in issues
- How many independent sources needed to be confident

Use DeepWiki for architecture: `https://deepwiki.com/{org}/{repo}`
Use GitHub search for design discussions: `gh issue list --search "auth design" --repo {org}/{repo}`
Use git log for historical decisions: `git log --grep="auth" --oneline`

## Phase 4 — Evidence collection

Search multiple sources. For each finding:
- Record what it claims
- Note whether it is primary (code, comments) or secondary (issues, PRs, docs)
- Note any contradictions with other findings

Do not synthesize yet. Collect first.

## Phase 5 — Triangulate

For every major claim: do at least 2 independent sources agree?

Flag claims from a single source — these are hypotheses, not conclusions.
Flag contradictions — these are often the most interesting design tensions.

Ask: "Which of your findings are you most uncertain about? What would make you more confident?"

## Phase 6 — Synthesize

Answer each sub-question. Then answer the top-level question.

State explicitly:
- What is established (multiple consistent sources)
- What is inferred (single source or reasoning from code structure)
- What is unknown (could not find evidence either way)

## Phase 7 — Package

Output:
1. Direct answer to the scoped question
2. Update `projects/{name}/overview.md` with architectural findings
3. Update `projects/{name}/gaps.md` with remaining open questions
4. Recommended next action

## Teaching note

Deep research about a codebase is not reading more files. It is asking a precise question
and building confidence through triangulated evidence from code, history, and maintainer intent.
The goal is a decision about how to contribute — not an encyclopedia entry.
