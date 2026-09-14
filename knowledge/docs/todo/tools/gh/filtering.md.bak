# gh - Filtering Issues and PRs

## When to Use
Need to find specific issues/PRs without manual searching

## Key Facts
- Use native flags BEFORE using --jq for filtering
- Filtering flags are more efficient than post-processing with --jq
- Combine multiple filters for precise results

## Native Filter Flags

### Issues
```bash
--assignee <login>     # Filter by assignee (use @me for yourself)
--author <login>       # Filter by author
--label <name>         # Filter by label (can use multiple times)
--milestone <name>     # Filter by milestone
--state <state>        # open|closed|all (default: open)
--app <name>           # Filter by GitHub App author
--mention <login>      # Filter by mention
--search <query>       # GitHub search query syntax
```

### Pull Requests
```bash
--assignee <login>     # Filter by assignee
--author <login>       # Filter by author
--base <branch>        # Filter by base branch
--head <branch>        # Filter by head branch
--label <name>         # Filter by label
--state <state>        # open|closed|merged|all (default: open)
--draft                # Show only draft PRs
--search <query>       # GitHub search query syntax
```

## Common Patterns

### My Open Issues
```bash
gh issue list --assignee @me --state open
```

### Issues with Specific Label
```bash
gh issue list --label "bug" --label "high-priority"
```

### PRs Waiting for Review
```bash
gh pr list --search "review:required"
```

### PRs I Authored
```bash
gh pr list --author @me
```

### Closed Issues from Last Week
```bash
gh issue list --state closed --search "closed:>2025-10-06"
```

### PRs Targeting Specific Branch
```bash
gh pr list --base main
```

### Combine Filters with JSON Output
```bash
gh issue list --label "bug" --state open --json number,title --jq '.[].number'
```
**Example**:
```bash
$ gh issue list --label "documentation" --json number,title --jq '.[] | "\(.number): \(.title)"'
187: Create AI-Optimized CLI Command Documentation
160: Organize and document Supabase CLI knowledge base
```

### Complex Search Queries
```bash
# Issues without labels
gh issue list --search "no:label"

# Issues with multiple criteria
gh issue list --search "is:open label:bug assignee:@me"

# PRs with changes to specific file
gh pr list --search "path:README.md"

# Recently updated issues
gh issue list --search "updated:>2025-10-01"
```

## GitHub Search Query Syntax

Common search qualifiers:
```
is:open, is:closed, is:merged
label:name
assignee:@me
author:username
mentions:username
updated:>YYYY-MM-DD
created:YYYY-MM-DD..YYYY-MM-DD
no:label, no:assignee
path:filename
```

Full reference: https://docs.github.com/en/search-github/searching-on-github/searching-issues-and-pull-requests

## Don't Use When
- You need complex post-processing (then use --json with --jq)
- Filter isn't supported by gh (then use --search with GitHub query syntax)
- Working with data that needs transformation (use --template)

## See Also
- @skogai/gh/json.md - JSON output and formatting
- @skogai/gh/templates.md - Go template patterns (TODO)
- Run `gh issue list --help` for all flags
- Run `gh pr list --help` for all flags
