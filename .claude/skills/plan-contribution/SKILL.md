---
name: plan-contribution
description: Design a contribution approach through Socratic dialogue. Use after explore-issue and read-code are complete. Never propose a plan — draw the plan out of the user through questions.
allowed-tools: Read,Glob,Grep,WebFetch,Bash(gh:*)
---

# Skill: plan-contribution

## Prerequisite check

Before starting, verify:
1. The contribution note for this issue exists at `projects/{name}/contributions/{issue-slug}.md`
2. The three questions section is filled in
3. Code location is identified

If any are missing, say: "Use /explore-issue first. You cannot plan a contribution without
understanding why the issue exists and what the blast radius is."

## The planning protocol

Do NOT propose a solution. Draw the solution out through questions. This is the most important
skill for becoming a real contributor — the ability to reason about a fix before implementing it.

**Round 1 — First instinct**
> "What is your first instinct for fixing this? Describe it in plain language — no code."

Whatever they say, ask:
> "What would break with that approach? What edge case does it not handle?"

**Round 2 — Constraints from the codebase**
> "Given what you read in the code, what constraints does the fix have to respect?
> What invariants does the surrounding code assume?"

If they cannot answer: "Go back and re-read the blast radius section of your contribution note.
What do the callers of this function assume?"

**Round 3 — What the project wants**
> "What would the maintainer of this project say about your approach?
> Is there a prior PR that solved a similar problem a specific way?"

Fetch a similar resolved PR if one exists. Ask:
> "How does your proposed approach differ from how the maintainer solved this before?
> Is that difference intentional or did you not know about their pattern?"

**Round 4 — Test first**
> "Before writing any fix code — what test would you write that fails right now and passes
> after the fix? Describe the test in plain language."

This is mandatory. If they cannot describe the test, the fix is not understood yet.

**Round 5 — Implementation plan**
Only after rounds 1–4 are satisfied. Ask:
> "Now describe the implementation plan in order: which files, which functions, what you add/remove/change.
> Be specific — file names and function names, not just 'update the X module.'"

## Evaluate the plan

After they present a plan, evaluate:
- Does it respect the blast radius they identified?
- Does it align with the maintainer's stated preference?
- Does it have a clear test?
- Is it minimal — does it only change what is necessary?

If the plan is over-engineered:
> "You're solving more than the issue asks for. What is the minimum change that fixes the
> stated problem without adding scope?"

If the plan misses the root cause:
> "This fixes the symptom. Does it fix the reason the issue exists — what you put in
> 'Why does this issue exist?' in your contribution note?"

## Output

Update the contribution note:
```markdown
## Planned approach
<!-- the plan that emerged from the dialogue — not the first instinct -->

## Test plan
<!-- what test will be written, what it asserts -->

## Files to change
<!-- specific files and functions -->

## Risks / unknowns remaining
<!-- what could still go wrong -->
```

End with: "Good plan. Now implement it. Use /review-draft-pr when you have a working draft
— do not open a PR without a review pass first."
