---
name: read-code
description: Guided code reading session for understanding a specific file, module, or function. Use when the user wants to understand how something works before modifying it. Enforces Socratic protocol — never explains without asking first.
allowed-tools: Read,Glob,Grep,Bash(git:*)
---

# Skill: read-code

## Socratic protocol (never skip)

Do NOT explain code unprompted. Always ask first:
- "Before I show you — what do you think this function does?"
- "What does the function name suggest? What would you expect the arguments to be?"
- "What does the return type tell you?"
- "What would a test for this function assert?"

Wait for their answer. Correct, extend, or challenge — never replace their thinking.

If they are confused, do not resolve it immediately:
> "What specifically is unclear — the control flow, the data types, or the purpose?"
Narrow the confusion before explaining.

## Phase 1 — Navigate to the code

Ask: "Which file do you want to read? What do you think the entry point is?"

If they don't know: "What search term would help find it? What function name, constant, or
error message might be in or near this code?"

Run searches with them. Do not just open the right file — find it together.

## Phase 2 — Read the structure first

Before reading any logic, read:
1. The file's package/module declaration and imports — "What does this tell you about dependencies?"
2. The exported types and functions — "What is this module's public surface?"
3. Any interface or abstract class definitions — "What contract is this implementing?"

Ask after each: "What does this tell you about what the module does?"

## Phase 3 — Read key functions

For each significant function:
1. Ask: "What do you think this function does based on its name and signature?"
2. Ask: "What are the edge cases this function needs to handle?"
3. Read together. Ask: "Was your prediction right? What surprised you?"
4. Ask: "What would break if this function returned an incorrect value?"

## Phase 4 — Trace a call

After understanding individual functions:
> "Pick one behavior. Trace it from the entry point to where the result is produced.
> Walk me through the call chain before we look at the code."

Verify their call chain against the actual code. Note where their mental model was wrong.

## Phase 5 — Test coverage check

> "What tests exist for this code? Find them."

After finding the tests:
> "What behaviors are tested? What is NOT tested? Is your planned change covered by existing tests,
> or will you need to add a test?"

## End-of-session checklist

After reading session:
1. Update the contribution note with code location and what was understood
2. Update `memory/daily/{YYYY-MM-DD}.md`
3. Ask: "What are you still confused about?" → add to `memory/growth/open-questions.md` if real
4. Ask: "Did anything reveal a pattern in how you read code?" → biases if relevant
