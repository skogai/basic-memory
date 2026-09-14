# gh - Pull Request Operations

## When to Use
Working with pull requests - create, checkout, review, merge

## Key Commands

### gh pr create
Create a pull request

```bash
gh pr create [flags]
```

**Essential Flags:**
```bash
-t, --title string        PR title
-b, --body string         PR body
-B, --base branch         Base branch (default: repo default branch)
-H, --head branch         Head branch (default: current branch)
-d, --draft               Create as draft PR
-l, --label name          Add labels
-a, --assignee login      Assign users (@me for yourself)
-r, --reviewer login      Request reviewers
-m, --milestone name      Add to milestone
-p, --project name        Add to project
-w, --web                 Open browser to create
-f, --fill                Use commit info for title/body
--fill-first              Use first commit only
```

### gh pr checkout
Checkout a PR locally

```bash
gh pr checkout {<number> | <url> | <branch>}
```

**Examples:**
```bash
gh pr checkout 123
gh pr checkout https://github.com/owner/repo/pull/123
gh pr checkout feature-branch
```

### gh pr view
View PR details

```bash
gh pr view [<number> | <url> | <branch>] [flags]
```

**Flags:**
```bash
-c, --comments            View PR comments
-w, --web                 Open in browser
--json fields             JSON output
--jq expression           Filter with jq
```

### gh pr list
List PRs (see filtering.md)

### gh pr status
Show status of relevant PRs

```bash
gh pr status
```

Shows:
- PRs assigned to you
- PRs you created
- PRs requesting your review

### gh pr review
Review a pull request

```bash
gh pr review [<number> | <url> | <branch>] [flags]
```

**Flags:**
```bash
-a, --approve             Approve PR
-r, --request-changes     Request changes
-c, --comment             Comment without approval
-b, --body string         Review comment body
```

### gh pr merge
Merge a pull request

```bash
gh pr merge [<number> | <url> | <branch>] [flags]
```

**Flags:**
```bash
-m, --merge               Create merge commit (default)
-s, --squash              Squash commits
-r, --rebase              Rebase commits
-d, --delete-branch       Delete branch after merge
--auto                    Enable auto-merge
--disable-auto            Disable auto-merge
```

### gh pr diff
View PR diff

```bash
gh pr diff [<number> | <url> | <branch>] [flags]
```

**Flags:**
```bash
--color string            Use color: {always|never|auto}
--patch                   Display in patch format
```

### gh pr checks
View PR check status

```bash
gh pr checks [<number> | <url> | <branch>]
```

Shows CI/CD check results

### gh pr edit
Edit PR details

```bash
gh pr edit [<number> | <url> | <branch>] [flags]
```

**Flags:**
```bash
--add-assignee login      Add assignees
--add-label name          Add labels
--add-reviewer login      Add reviewers
--remove-assignee login   Remove assignees
--remove-label name       Remove labels
--remove-reviewer login   Remove reviewers
-t, --title string        New title
-b, --body string         New body
-B, --base branch         Change base branch
```

## Common Workflows

### Create PR from Current Branch
```bash
# Quick create with prompts
gh pr create

# With all details inline
gh pr create \
  --title "Add feature X" \
  --body "Description of changes" \
  --label "enhancement" \
  --reviewer @user

# Draft PR
gh pr create --draft

# Use commit messages
gh pr create --fill
```

### Check Out PR for Review
```bash
# By number
gh pr checkout 123

# By URL
gh pr checkout https://github.com/owner/repo/pull/123

# Then review locally
git log
git diff main...
```

### Review a PR
```bash
# Approve
gh pr review 123 --approve -b "LGTM!"

# Request changes
gh pr review 123 --request-changes -b "Please fix X"

# Comment only
gh pr review 123 --comment -b "Question about Y"
```

### Check PR Status
```bash
# View checks
gh pr checks 123

# View full details
gh pr view 123 --json statusCheckRollup,reviewDecision --jq '.'

# View comments
gh pr view 123 --comments
```

### Merge PR
```bash
# Merge with prompt
gh pr merge 123

# Squash and delete branch
gh pr merge 123 --squash --delete-branch

# Auto-merge when checks pass
gh pr merge 123 --auto --squash
```

### Get PR Info as JSON
```bash
# All PRs
gh pr list --json number,title,state,headRefName

# Specific PR
gh pr view 123 --json number,title,body,state,reviewDecision,statusCheckRollup

# PRs with reviews
gh pr list --json number,title,reviews --jq '.[] | select(.reviews | length > 0)'
```

## Common Patterns for AI Agents

### DON'T manually parse PR numbers
```bash
# BAD
gh pr list | grep "#" | cut -d'#' -f2 | ...
```

```bash
# GOOD
gh pr list --json number --jq '.[].number'
```

### DON'T fetch details multiple times
```bash
# BAD - multiple calls
gh pr view 123 --json title
gh pr view 123 --json state
gh pr view 123 --json reviewDecision
```

```bash
# GOOD - one call
gh pr view 123 --json title,state,reviewDecision
```

### DO use --fill for automatic titles/bodies
```bash
# If you have good commit messages
gh pr create --fill
```

### DO check status before operations
```bash
# Check if PR is mergeable
gh pr view 123 --json mergeable,reviewDecision --jq '{mergeable, reviewDecision}'
```

## Available JSON Fields

Run to discover:
```bash
gh pr view --json
```

Common fields:
```
number, title, body, state, isDraft, url,
headRefName, baseRefName, author,
reviewDecision, reviews, reviewRequests,
statusCheckRollup, mergeable, mergeStateStatus,
commits, additions, deletions, changedFiles,
createdAt, updatedAt, closedAt, mergedAt, mergedBy
```

## Don't Use When
- Just viewing in browser (use `--web`)
- Need to edit PR description/code (check out and edit locally)

## See Also
- @skogai/gh/json.md - JSON output
- @skogai/gh/filtering.md - Filtering PRs
- Run `gh pr <command> --help` for detailed flags
