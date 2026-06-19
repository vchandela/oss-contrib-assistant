#!/bin/bash
# Run once after cloning to install git hooks.
REPO_ROOT="$(git rev-parse --show-toplevel)"
cp "$REPO_ROOT/.githooks/pre-commit" "$REPO_ROOT/.git/hooks/pre-commit"
chmod +x "$REPO_ROOT/.git/hooks/pre-commit"
echo "✅ OSS mentor hook installed."
echo "   pre-commit: validates contribution note structure (the three questions)"
echo "               and requires the project overview to exist."
