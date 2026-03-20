---
name: submit-contribution
description: Open the pull request and update all memory files. Use only after review-draft-pr passes. Handles PR creation, contribution note update, daily log, and growth file prompts.
allowed-tools: Bash(gh:*),Bash(git:*),Read,Write
---

# Skill: submit-contribution

## Prerequisite check

Verify `/review-draft-pr` has been run and passed. If the contribution note does not have
a `## Planned approach` section, stop and say:
"Run /explore-issue → /plan-contribution → /review-draft-pr in order before submitting."

## Phase 1 — Final pre-submit check

```bash
git log --oneline origin/main..HEAD    # verify commits look right
git diff origin/main --stat            # verify scope
```

Ask: "Are you happy with the commit history and scope? Is there anything you want to clean up?"

## Phase 2 — Open the PR

Use `gh pr create` with:
- Title: following the project's commit message convention
- Body: the description drafted in review-draft-pr
- `--draft` if the project uses draft PRs for early feedback (check CONTRIBUTING.md)

```bash
gh pr create \
  --title "{title}" \
  --body "$(cat <<'EOF'
## What
<!-- one paragraph: what the change does -->

## Why
<!-- why this was needed — link to the issue -->

## How
<!-- brief explanation of the approach chosen and why -->

## Test plan
<!-- what was tested and how -->

Closes #{issue-number}
EOF
)"
```

## Phase 3 — Update contribution note

Add to the contribution note:
```markdown
## PR
- URL: {pr-url}
- Opened: {YYYY-MM-DD}
- Status: open

## Review feedback
<!-- fill in as maintainer responds -->
```

## Phase 4 — Memory update

1. Update `memory/landscape.md` — increment contribution count, update last-active date
2. Update `memory/daily/{YYYY-MM-DD}.md` — log the submission

## Phase 5 — Growth reflection

Ask:
> "Now that the PR is open — what did you learn about this codebase that you didn't know
> before you started? What would you do differently next time?"

Then ask:
> "Did you catch yourself taking any shortcuts during this contribution?
> Reading a fix without understanding why? Guessing at a blast radius instead of searching?"

Based on the answers:
- If shortcut detected → add to `memory/growth/biases.md`
- If genuine learning → add to `memory/growth/open-questions.md` or `progress.md` (high bar)

End with: "PR submitted. Now wait for maintainer feedback — do not ping the maintainer for
at least one week. Use the time to start exploring another issue in /explore-issue."
