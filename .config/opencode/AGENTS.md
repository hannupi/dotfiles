## Branching rules

Never commit directly to `main`. Always work on a feature branch.

**Workflow:**

1. Before any commit, check the current branch. If on `main` (or any other base branch), always create and switch to a feature branch first — no exceptions.
2. Commit work to the feature branch.
3. Never create a pull request even if asked, only print suggestion for PR body and title for the user

## Atomic commits

For larger changes, favor atomic commits — each commit should represent one logical change that could stand on its own (compiles, makes sense in isolation). Proactively suggest how to split the work before starting, e.g. "I'd suggest splitting this into 3 commits: X, Y, Z — want me to proceed that way?"

## Git commit style

When creating git commits, match the author's style exactly:

- **No ticket:** if there is no ticket, just write a lowercase description with no prefix.
- **Single line only** — no body, no bullet points, no multi-line messages.
- **Tense:** imperative or noun-phrase, lowercase, no trailing period. Examples: `remove unused method`, `fix priority in tests`, `add support for multiple documents`.
- **Length:** 3–7 words after the ticket. Keep it short and concrete.
- **No conventional commit prefixes** — do not use `feat:`, `fix:`, `chore:`, `refactor:` etc.
- **No co-author lines** — do not add `Co-Authored-By` or any trailer lines.
- **No attribution** — do not mention AI or any tool in the commit message.

### Examples

```
added label support and can now make epics and defects
remove status log
remove unused updateRequest method
fix priority in tests
add claude instructions readme
update 06-release-process
quality of life tweaks
```
