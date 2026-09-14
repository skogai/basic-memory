# gh - Direct API Access

## When to Use
- Need endpoint not covered by gh subcommands
- Need raw API response
- Building automation scripts
- Working with GraphQL

## Key Facts
- `gh api` handles authentication automatically
- Supports both REST and GraphQL
- Has built-in --jq and --template flags
- Supports pagination with --paginate

## Basic Usage

### GET Request
```bash
gh api /repos/{owner}/{repo}/issues
```

### POST Request
```bash
gh api /repos/{owner}/{repo}/issues -f title="Bug" -f body="Description"
```

### With Field Parameters
```bash
gh api /repos/{owner}/{repo}/issues -F assignees[]=username -f title="Title"
```

## Common Patterns

### Get Current User
```bash
gh api /user
```

### Get Repository Info
```bash
gh api /repos/{owner}/{repo}
```

### List Repo Issues with API
```bash
gh api /repos/OWNER/REPO/issues --jq '.[] | {number, title}'
```

### Create Issue via API
```bash
gh api /repos/OWNER/REPO/issues \
  -f title="Issue title" \
  -f body="Issue body" \
  -F labels[]=bug
```

### Pagination
```bash
gh api /repos/OWNER/REPO/issues --paginate
```

### Get PR Review Comments
```bash
gh api /repos/OWNER/REPO/pulls/123/comments
```

### GraphQL Query
```bash
gh api graphql -f query='
  query {
    viewer {
      login
      name
    }
  }
'
```

### GraphQL with Variables
```bash
gh api graphql \
  -f query='query($owner:String!, $repo:String!) {
    repository(owner:$owner, name:$repo) {
      issues(first:10) {
        nodes { number title }
      }
    }
  }' \
  -f owner=OWNER \
  -f repo=REPO
```

## Flag Reference

```bash
-X, --method string         HTTP method (default: GET)
-f, --raw-field key=value   String parameter
-F, --field key=value       Typed parameter (numbers, booleans, arrays)
-H, --header key:value      HTTP header
--paginate                  Fetch all pages
--jq expression             Filter with jq
--template string           Format with Go template
--cache duration            Cache response (e.g., "1h", "30m")
--hostname string           GitHub hostname (for Enterprise)
-i, --include               Include response headers
--silent                    No output
```

## Field Types (-f vs -F)

### -f (raw string)
```bash
gh api /repos/owner/repo/issues -f title="Title"
```

### -F (typed - interprets as JSON)
```bash
gh api /repos/owner/repo/issues \
  -F labels[]="bug" \
  -F labels[]="urgent" \
  -F milestone=5
```

## Response Codes

```bash
# Check response with --include
gh api /user -i

# Outputs:
HTTP/2.0 200 OK
...
{response body}
```

## Don't Use When
- gh has a specific subcommand (use `gh issue`, `gh pr`, etc.)
- You just need to view data (use gh subcommands with --json)
- Not working with GitHub API

## See Also
- GitHub REST API docs: https://docs.github.com/en/rest
- GitHub GraphQL API docs: https://docs.github.com/en/graphql
- @skogai/gh/json.md - JSON formatting
- Run `gh api --help` for complete reference
