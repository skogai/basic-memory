# gh - JSON Output and Formatting

## When to Use
Need structured data from GitHub (issue numbers, PR details, labels, etc.)

## Key Facts
- gh has **BUILT-IN --jq flag** (no need to pipe to jq command!)
- gh has **--template flag** for Go templates
- To discover available fields: run command with `--json` but no field list

## Replaces
DON'T DO THIS (hundreds of attempts):
```bash
gh issue list | grep "#" | cut -d'#' -f2 | cut -d' ' -f1
gh issue list | awk '{print $1}' | sed 's/#//'
gh issue list --json number | jq '.[].number'  # WORKS but verbose
```

DO THIS:
```bash
gh issue list --json number --jq '.[].number'
```

## Essential Patterns

### Discover Available Fields
```bash
gh issue list --json
gh pr list --json
gh repo view --json
```
**Example**:
```bash
$ gh issue list --json
{
  "assignees": "Comma-separated list of login names",
  "author": "author data",
  "body": "Body of the issue",
  ...
}
```

### Get Issue Numbers (Built-in --jq)
```bash
gh issue list --json number --jq '.[].number'
```
**Example**:
```bash
$ gh issue list --json number --jq '.[].number'
1
2
5
12
160
187
```

### Get Issues with Title
```bash
gh issue list --json number,title --jq '.[] | "\(.number): \(.title)"'
```
**Example**:
```bash
$ gh issue list --json number,title --jq '.[] | "\(.number): \(.title)"'
187: Create AI-Optimized CLI Command Documentation
160: Organize and document Supabase CLI knowledge base
```

### Filter Issues with Labels Using --jq
```bash
gh issue list --json number,title,labels --jq 'map(select((.labels | length) > 0))'
```

### Format with Go Templates (--template)
```bash
gh issue list --json number,title --template '{{range .}}#{{.number}} {{.title}}{{"\n"}}{{end}}'
```
**Example**:
```bash
$ gh issue list --json number,title --template '{{range .}}#{{.number}} {{.title}}{{"\n"}}{{end}}'
#187 Create AI-Optimized CLI Command Documentation
#160 Organize and document Supabase CLI knowledge base
```

### Get Specific Issue Details
```bash
gh issue view 187 --json number,title,body,labels,state
```

### Get PR Review Status
```bash
gh pr list --json number,title,reviewDecision --jq '.[] | select(.reviewDecision=="APPROVED")'
```

### Create Issue and Get JSON Back
```bash
gh issue create --title "Title" --body "Body" --label "bug" --json number,url
```

### Using --template with Helpers
```bash
# With hyperlinks
gh issue list --json title,url --template '{{range .}}{{hyperlink .url .title}}{{"\n"}}{{end}}'

# With color and table
gh pr list --json number,title,updatedAt --template '{{range .}}{{tablerow (printf "#%v" .number | autocolor "green") .title (timeago .updatedAt)}}{{end}}'
```

## Available JSON Fields

### Issues
```
number, title, state, body, author, assignees, labels,
createdAt, updatedAt, closedAt, url, comments
```

### Pull Requests
```
number, title, state, isDraft, reviewDecision, mergeable,
headRefName, baseRefName, commits, additions, deletions, url, reviews
```

### Repositories
```
name, owner, description, createdAt, pushedAt, url,
isPrivate, isFork, stargazerCount
```

## Template Helpers Available

From `gh help formatting`:
- `autocolor` - colorize for terminals
- `color <style> <input>` - colorize
- `join <sep> <list>` - join array
- `pluck <field> <list>` - extract field from objects
- `tablerow <fields>...` - align as table
- `tablerender` - render table
- `timeago <time>` - relative time
- `timefmt <format> <time>` - format timestamp
- `truncate <length> <input>` - truncate string
- `hyperlink <url> <text>` - terminal hyperlink

## Don't Use When
- Simple text output is sufficient (use default `gh issue list`)
- You just need to view in browser (use `--web` flag)

## See Also
- Run `gh help formatting` for complete formatting guide
- @skogai/jq/basics.md - jq syntax (TODO)
- @skogai/gh/templates.md - Go template patterns (TODO)
