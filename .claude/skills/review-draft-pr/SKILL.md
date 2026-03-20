---
name: review-draft-pr
description: Pre-PR review of a draft contribution before opening a pull request. Checks against community guidelines, code quality, test coverage, and common rejection reasons. Use before submitting any PR.
allowed-tools: Read,Glob,Grep,Bash(git:*),Bash(gh:*)
---

# Skill: review-draft-pr

## When to use

After implementing a fix but before opening the PR. This is a mandatory gate — do not open
a PR without running this.

## Phase 1 — Self-review first

Before I review anything, ask:
> "Walk me through your own changes. What did you change and why — explain each diff to me
> as if you were presenting it to a skeptical maintainer."

Listen for:
- Vague explanations ("I changed how it handles the error") — ask what specifically
- Changes that weren't in the plan — ask why they were added
- Missing tests — flag immediately

## Phase 2 — Against the contribution note

Read the contribution note for this issue. Check:
- Does the change address "Why does this issue exist?" or just the symptom?
- Are all files in "Files to change" accounted for? Any unexpected extra changes?
- Does the test plan match what was implemented?

If anything diverged from the plan, ask:
> "Your plan said X, but your implementation does Y. Was this intentional? If so, why
> did the plan change?"

## Phase 3 — Community guidelines check

Read the project's CONTRIBUTING.md and check:
- [ ] Commit message format matches the project convention
- [ ] DCO sign-off present if required (`Signed-off-by:` trailer in every commit)
- [ ] Changelog entry added if required
- [ ] Copyright/license header on any new files
- [ ] No unrelated changes in the diff (no whitespace-only changes in unrelated files)
- [ ] Test added for the fixed behavior
- [ ] Documentation updated if behavior changed

For each failed check:
> "CONTRIBUTING.md requires X. Your PR doesn't have it yet."

## Phase 4 — Code quality

Read the changed code. Check:
- [ ] No obvious logic errors in the fix itself
- [ ] Edge cases from the blast radius analysis are handled
- [ ] Error messages are consistent with the project's style
- [ ] No debug prints or commented-out code left in
- [ ] Variable/function names follow project conventions

For anything that needs fixing, ask first:
> "There's an issue with X. Before I point it out — do you see anything that might be
> wrong with how this handles edge case Y?"

## Phase 5 — PR description quality

Ask the user to draft a PR description. Then evaluate:
- Does it explain WHY the change was needed (not just WHAT changed)?
- Does it reference the issue number?
- Does it include a test plan or steps to reproduce + verify the fix?
- Does it note any tradeoffs or limitations of the approach?

If the description just says "Fixes issue #N" or "Changed X to Y":
> "A maintainer reading this PR has no context. Explain: what was wrong, why it was wrong,
> and why your approach is the right fix. Imagine the maintainer has not read the issue."

## Phase 6 — Final checklist

Run project's linter and tests. If any fail, do not open the PR.

Verify:
```
git log --oneline origin/main..HEAD   # clean commit history
git diff origin/main --stat           # total files changed — reasonable scope?
```

If scope is larger than the issue warrants:
> "Your diff touches more than what the issue asked for. A maintainer will ask you to
> split this. What is the minimum set of changes needed for just this fix?"

## Output

If the review passes:
> "This PR is ready to open. Use /submit-contribution."

If the review has issues, list them with priority:
- **Must fix before opening**: (community guideline violations, failing tests)
- **Should fix**: (code quality issues, PR description)
- **Optional**: (style improvements)
