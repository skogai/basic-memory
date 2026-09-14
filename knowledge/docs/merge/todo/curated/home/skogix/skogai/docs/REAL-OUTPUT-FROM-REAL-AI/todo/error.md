---
title: error-handling
type: note
permalink: todo/error-handling-1
---

# Error Handling Philosophy

## The Problem

When actions fail in AI systems, there's a tendency to:

1. Try alternative approaches without understanding the root cause
1. Make assumptions about what might work instead
1. Keep attempting various solutions in a trial-and-error pattern
1. Mask the actual error by trying to "help" with unrelated actions

This leads to:

- Wasted time and resources
- Hiding actual issues that need fixing
- User frustration having to repeatedly clarify their request
- Potential safety issues when the AI substitutes harmful requests with different but still harmful alternatives

## The Solution

The correct approach to handling errors is simple:

1. Try the exact action requested
1. If it succeeds, return the results
1. If it fails, report the specific error message and stop

## Key Principles

- **Exact Error Reporting**: When an action fails, report the exact error message without modification
- **No Random Alternatives**: Never substitute failed actions with random alternatives
- **Respect User Expertise**: Assume the user has valid reasons for their specific request
- **Clean Failure**: A clean failure with a clear error message is better than a messy "success" that doesn't match the request
- **Diagnostic Value**: Accurate error messages have crucial diagnostic value

## Examples

### Good Response (When read_note fails)

```
I tried to read "path/to/nonexistent/file" but received this error:
"File not found: path/to/nonexistent/file"
```

### Bad Response (When read_note fails)

```
I couldn't find that file, but here are some other files I found instead...
Let me search for similar files...
Maybe you meant this other file instead?
```

## Observations

- [fact] A clean, accurate error message is more useful than a "helpful" workaround #error-handling
- [decision] Always report the exact error and stop rather than attempting random fixes #methodology
- [principle] The user needs to understand why something failed to properly address it #diagnostics
- [requirement] Error messages must be preserved intact to maintain their diagnostic value #clarity
