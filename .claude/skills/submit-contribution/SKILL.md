---
name: submit-contribution
description: Open the pull request and update the project's notes. Use only after review-draft-pr passes. Handles PR creation, contribution note update, and the project journal.
allowed-tools: Bash(gh:*),Bash(git:*),Read,Write
---

# Skill: submit-contribution

## Prerequisite check

Verify `/review-draft-pr` has been run and passed. If the contribution note does not have
a `## Planned approach` section, stop and say:
"Run /explore-issue → /plan-contribution → /review-draft-pr in order before submitting."

## Phase 1 — Final pre-submit check

```bash
# Verify commits are on your feature branch, not main
git log --oneline upstream/main..HEAD   # commits that will be in the PR
git diff upstream/main --stat           # total scope

# Push your branch to your fork (origin), not upstream
git push origin HEAD
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

## Phase 4 — Journal update

Prepend a dated entry to `memory/{name}/journal.md` logging the submission: the PR URL,
what shipped, and the new cliff-hanger (what to watch for in review, or the next mystery).

## Phase 5 — Reflection

Ask:
> "Now that the PR is open — what did you learn about this codebase that you didn't know
> before you started? What would you do differently next time?"

Then ask:
> "Did you catch yourself taking any shortcuts during this contribution?
> Reading a fix without understanding why? Guessing at a blast radius instead of searching?"

Capture anything durable — a genuine insight, or a shortcut to watch for — in
`memory/{name}/map.md` or the journal entry. Keep it honest and specific.

End with: "PR submitted. Now wait for maintainer feedback — do not ping the maintainer for
at least one week. Use the time to start exploring another issue in /explore-issue."
