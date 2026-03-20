# Contributor Biases and Shortcomings

Recurring reasoning errors and shortcut patterns observed during OSS contribution sessions.
Updated by the mentor — not by the contributor. These are observations, not judgements.

The goal: once a pattern is named and dated, it can be caught earlier in future sessions.

---

<!-- Format:
## {Bias name}
- **First observed**: {YYYY-MM-DD}
- **Last seen**: {YYYY-MM-DD}
- **Pattern**: {specific behavior — what was done instead of the right thing}
- **Example instance**: {which issue/project, what happened}
- **Why it's a shortcut**: {what understanding is being bypassed}
- **Catch it when**: {trigger condition to watch for}
-->

## Example (template — delete when first real bias is added)
## Jumping to fix before understanding the call graph
- **First observed**: —
- **Pattern**: Reads the function that contains the bug, modifies it, without checking who calls
  it or what invariants callers assume.
- **Why it's a shortcut**: Fixes the symptom without understanding whether the bug is in the
  function itself or in how it is called — leading to either over-fixing or missing the real issue.
- **Catch it when**: Any time the instinct is "I can see the fix" within the first 5 minutes.
