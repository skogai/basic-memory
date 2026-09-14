# gh - Repository Operations

## When to Use
Working with repositories - view, clone, fork, create

## Key Commands

### gh repo view
View repository details

```bash
gh repo view [<repository>] [flags]
```

**Flags:**
```bash
-w, --web                 Open in browser
-b, --branch string       View specific branch
--json fields             JSON output
--jq expression           Filter JSON
```

### gh repo clone
Clone a repository

```bash
gh repo clone <repository> [<directory>] [-- <gitflags>...]
```

**Examples:**
```bash
gh repo clone owner/repo
gh repo clone owner/repo my-dir
gh repo clone owner/repo -- --depth=1
```

### gh repo fork
Fork a repository

```bash
gh repo fork [<repository>] [flags]
```

**Flags:**
```bash
--clone                   Clone fork after creating
--remote                  Add remote for fork
--remote-name string      Name for remote (default "origin")
--fork-name string        Name for fork
--org string              Fork to organization
--default-branch-only     Clone only default branch
```

### gh repo create
Create a repository

```bash
gh repo create [<name>] [flags]
```

**Flags:**
```bash
-d, --description string  Description
--public                  Make public
--private                 Make private (default)
--internal                Make internal (orgs only)
-c, --clone               Clone after creating
--disable-issues          Disable issues
--disable-wiki            Disable wiki
-g, --gitignore string    Gitignore template
-l, --license string      License
--push                    Push local to new repo
-r, --remote string       Remote name
-s, --source string       Source repo path for push
-t, --team string         Grant access to org team
--template string         Template repository
```

### gh repo list
List repositories

```bash
gh repo list [<owner>] [flags]
```

**Flags:**
```bash
--archived              Show only archived
--fork                  Show only forks
--source                Show only sources (non-forks)
--language string       Filter by language
-L, --limit int         Max repos (default 30)
--no-archived           Omit archived
--topic string          Filter by topic
--visibility string     Filter by visibility: public|private|internal
--json fields           JSON output
--jq expression         Filter JSON
```

### gh repo sync
Sync a fork

```bash
gh repo sync [<destination-repository>] [flags]
```

**Flags:**
```bash
-b, --branch string       Branch to sync
-s, --source string       Source repository
--force                   Hard reset instead of merge
```

### gh repo set-default
Set default repository for commands

```bash
gh repo set-default [<repository>]
```

### gh repo delete
Delete a repository

```bash
gh repo delete [<repository>] [flags]
```

**Flags:**
```bash
--yes                     Skip confirmation
```

### gh repo rename
Rename a repository

```bash
gh repo rename <new-name> [flags]
```

**Flags:**
```bash
-y, --yes                 Skip confirmation
```

### gh repo archive
Archive a repository

```bash
gh repo archive [<repository>] [flags]
```

**Flags:**
```bash
-y, --yes                 Skip confirmation
```

### gh repo unarchive
Unarchive a repository

```bash
gh repo unarchive [<repository>] [flags]
```

**Flags:**
```bash
-y, --yes                 Skip confirmation
```

## Common Patterns

### View Current Repo Info
```bash
gh repo view
```

### View Specific Repo
```bash
gh repo view owner/repo
```

### Get Repo Info as JSON
```bash
gh repo view --json name,owner,description,url,isPrivate,isFork,stargazerCount,forkCount,defaultBranchRef
```

### List My Repos
```bash
gh repo list
```

### List Org Repos
```bash
gh repo list myorg
```

### List Non-Fork Repos
```bash
gh repo list --source --no-archived
```

### List Repos by Language
```bash
gh repo list --language go --json name,language
```

### Clone with Depth
```bash
gh repo clone owner/repo -- --depth=1 --single-branch
```

### Fork and Clone
```bash
gh repo fork owner/repo --clone
```

### Create Private Repo from Template
```bash
gh repo create my-new-repo \
  --template owner/template-repo \
  --private \
  --clone
```

### Create and Push Local Repo
```bash
# In local git repo
gh repo create my-repo --private --source=. --push
```

### Sync Fork with Upstream
```bash
gh repo sync --branch main
```

### Get Default Branch
```bash
gh repo view --json defaultBranchRef --jq '.defaultBranchRef.name'
```

### Check if Repo is Fork
```bash
gh repo view --json isFork,parent --jq '.'
```

## AI Agent Patterns

### DON'T parse text for repo info
```bash
# BAD
gh repo view | grep "Description:" | cut -d':' -f2
```

```bash
# GOOD
gh repo view --json description --jq '.description'
```

### DO get multiple fields at once
```bash
# Get everything needed in one call
gh repo view --json name,owner,defaultBranchRef,isPrivate,isFork
```

### DO check repo exists before operations
```bash
# Check if repo exists
if gh repo view owner/repo &>/dev/null; then
  # repo exists
fi
```

### DON'T list all repos if filtering available
```bash
# BAD - fetch all then filter
gh repo list --json name | jq 'filter...'

# GOOD - filter at source
gh repo list --source --language go --limit 10
```

## Available JSON Fields

Run to discover:
```bash
gh repo view --json
```

Common fields:
```
name, owner, description, url,
defaultBranchRef, isPrivate, isFork, isArchived,
createdAt, updatedAt, pushedAt,
stargazerCount, forkCount, watchers,
primaryLanguage, languages, licenseInfo,
hasIssuesEnabled, hasWikiEnabled, hasProjectsEnabled,
parent (for forks)
```

## Don't Use When
- Need to modify repo files (clone and edit locally)
- Need to browse code (use `gh browse` or `--web`)
- Need Git operations (use `git` commands directly)

## See Also
- @skogai/gh/json.md - JSON output
- @skogai/git/ - Git command docs
- Run `gh repo --help` for all commands
