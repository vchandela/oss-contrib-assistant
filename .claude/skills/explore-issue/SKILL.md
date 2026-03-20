---
name: explore-issue
description: Analyze a GitHub issue using the three-question protocol before any code is written. Use when given an issue URL, issue number, or issue description. Enforces reading code before planning a fix.
allowed-tools: WebFetch,WebSearch,Bash(gh:*),Read,Glob,Grep
---

# Skill: explore-issue

## When to use

When an issue URL, issue number, or issue description is provided. Always before `/plan-contribution`.

## Phase 1 — Read the issue

Fetch the full issue: `gh issue view {number} --repo {org}/{repo} --comments`

Do not summarize it to the user. Ask:
> "What is your understanding of this issue? Describe it in your own words —
> what is broken, and from the user's perspective, what should happen instead?"

Wait. Correct misunderstandings. If they cannot describe it, that is the signal: read the issue
again more carefully.

## Phase 2 — The three questions

Do not proceed until the user can answer all three. Ask them one at a time. Do not move to
the next until the current one is answered with specificity.

**Q1 — Why does this issue exist?**

> "Not what the bug is — why did the codebase allow this? What design decision, missing
> validation, or untested edge case made this possible?"

Do not accept "because there's a bug in X." Push for: what *should* have been in place that
isn't? What assumption in the original design doesn't hold here?

**Q2 — What is the blast radius?**

> "Before you look at the fix — what other code might be affected if this behavior changes?
> What would you search for to find all callers of the relevant code?"

Have them identify search terms. Then run the searches together using Grep/Glob. Surfaces:
- All callers of the affected function/method
- All tests that touch the affected behavior
- Any configuration or documentation that references it

**Q3 — What does the project want?**

> "Look at the issue comments — has a maintainer indicated a preferred direction?
> What does CONTRIBUTING.md say about this module or pattern?
> Are there similar closed issues or PRs that show how this class of problem was solved before?"

Fetch 2–3 related closed issues/PRs. Ask: "What does the resolution pattern tell you?"

## Phase 3 — Code location

Only after the three questions are answered. Ask:
> "Where do you think this code lives? What file and function? Don't search yet — guess first."

After their guess:
> "What search term would you use to find it?"

Run the search with them. If their guess was wrong, ask why — do not just show the right file.

When the right file is found:
> "Read the relevant section. What does it do? What does it assume? Where does your issue
> fit in this execution path?"

## Phase 4 — Write the contribution note

Create `projects/{name}/contributions/{issue-number}-{slug}.md`:

```markdown
# Issue #{number}: {title}
Project: {org}/{repo} | Date: {YYYY-MM-DD} | Status: exploring

## Why does this issue exist?
<!-- architectural/design reason, not just "there's a bug" -->

## Blast radius
<!-- what else is affected, what tests exist -->

## What the project wants
<!-- maintainer signals, similar resolved issues, CONTRIBUTING guidance -->

## Code location
<!-- files, functions, line ranges -->

## Open questions before planning
<!-- things still unclear that need investigation -->
```

End with: "Good. Now you know what the problem is and where it lives. Use /plan-contribution
when you're ready to think about the fix."
