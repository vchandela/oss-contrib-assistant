#!/bin/bash
# Run once after cloning to install git hooks.
REPO_ROOT="$(git rev-parse --show-toplevel)"
cp "$REPO_ROOT/.githooks/pre-commit"  "$REPO_ROOT/.git/hooks/pre-commit"
cp "$REPO_ROOT/.githooks/post-commit" "$REPO_ROOT/.git/hooks/post-commit"
cp "$REPO_ROOT/.githooks/pre-push"    "$REPO_ROOT/.git/hooks/pre-push"
chmod +x "$REPO_ROOT/.git/hooks/pre-commit"
chmod +x "$REPO_ROOT/.git/hooks/post-commit"
chmod +x "$REPO_ROOT/.git/hooks/pre-push"
echo "✅ OSS mentor hooks installed."
echo "   pre-commit:  validates contribution note structure + requires daily log"
echo "   post-commit: nudges growth file updates after contribution commits"
echo "   pre-push:    blocks push if daily log or growth files missing"
