# gh - GitHub Actions Workflows

## When to Use
Working with GitHub Actions - run workflows, check status, view logs

## Key Commands

### gh run list
List workflow runs

```bash
gh run list [flags]
```

**Flags:**
```bash
-w, --workflow string     Filter by workflow file name
-b, --branch string       Filter by branch
-e, --event string        Filter by event type
-s, --status string       Filter by status
-L, --limit int           Max runs to fetch (default 20)
--json fields             JSON output
--jq expression           Filter JSON
```

**Status values:** `queued|in_progress|completed|success|failure|cancelled`

### gh run view
View workflow run details

```bash
gh run view [<run-id>] [flags]
```

**Flags:**
```bash
-j, --job string          View specific job ID
--log                     View full logs
--log-failed              View failed job logs only
-v, --verbose             Show job steps
-w, --web                 Open in browser
--json fields             JSON output
```

### gh run watch
Watch a workflow run

```bash
gh run watch [<run-id>] [flags]
```

**Flags:**
```bash
-i, --interval int        Refresh interval in seconds (default 3)
--exit-status             Exit with non-zero if run fails
```

### gh run rerun
Re-run a workflow

```bash
gh run rerun [<run-id>] [flags]
```

**Flags:**
```bash
--failed                  Rerun only failed jobs
```

### gh run cancel
Cancel a workflow run

```bash
gh run cancel [<run-id>]
```

### gh run download
Download artifacts

```bash
gh run download [<run-id>] [flags]
```

**Flags:**
```bash
-n, --name string         Download specific artifact
-D, --dir string          Download directory
```

### gh workflow list
List workflows

```bash
gh workflow list [flags]
```

**Flags:**
```bash
-a, --all                 Include disabled workflows
-L, --limit int           Max workflows to fetch (default 50)
--json fields             JSON output
```

### gh workflow view
View workflow details

```bash
gh workflow view [<workflow-id> | <workflow-name>] [flags]
```

**Flags:**
```bash
-w, --web                 Open in browser
-y, --yaml                View workflow YAML
-r, --ref string          View workflow from ref
```

### gh workflow run
Run a workflow

```bash
gh workflow run [<workflow-id> | <workflow-name>] [flags]
```

**Flags:**
```bash
-f, --field key=value     Add input parameter
-F, --raw-field key=value Add string input parameter
-r, --ref string          Branch/tag to run on
--json                    Output JSON
```

### gh workflow enable
Enable a workflow

```bash
gh workflow enable [<workflow-id> | <workflow-name>]
```

### gh workflow disable
Disable a workflow

```bash
gh workflow disable [<workflow-id> | <workflow-name>]
```

## Common Patterns

### Check Latest Run Status
```bash
gh run list --limit 1
```

### View Recent Runs for Specific Workflow
```bash
gh run list --workflow "CI" --limit 5
```

### Watch Latest Run
```bash
gh run watch
```

### View Failed Job Logs
```bash
gh run view --log-failed
```

### Get Run Status as JSON
```bash
gh run view <run-id> --json status,conclusion,databaseId,displayTitle
```

### List All Workflow Runs with Status
```bash
gh run list --json databaseId,workflowName,status,conclusion,headBranch,event,createdAt \
  --jq '.[] | "\(.databaseId): \(.workflowName) - \(.status) (\(.conclusion // "running"))"'
```

### Run Workflow with Inputs
```bash
gh workflow run "Deploy" \
  -f environment=production \
  -f version=v1.2.3
```

### Rerun Failed Jobs Only
```bash
gh run rerun <run-id> --failed
```

### Download All Artifacts
```bash
gh run download <run-id>
```

### Download Specific Artifact
```bash
gh run download <run-id> --name "test-results"
```

### View Workflow YAML
```bash
gh workflow view "CI" --yaml
```

### Check All Workflows Status
```bash
gh workflow list --json name,state,path
```

## AI Agent Patterns

### DON'T parse text output
```bash
# BAD
gh run list | grep "completed" | cut -d' ' -f1
```

```bash
# GOOD
gh run list --status completed --json databaseId --jq '.[].databaseId'
```

### DO check run before operations
```bash
# Get status before deciding action
STATUS=$(gh run view --json status,conclusion --jq '.status')
if [ "$STATUS" = "completed" ]; then
  # do something
fi
```

### DO filter at query time
```bash
# GOOD - filter with flags
gh run list --workflow "CI" --status failure --branch main

# AVOID - filter with jq if flags exist
gh run list --json ... --jq 'filter expression'
```

### DO use --exit-status for CI
```bash
# Exit with run's exit code
gh run watch --exit-status
```

## Available JSON Fields

### Workflow Runs
```bash
gh run view --json
```

Common fields:
```
databaseId, displayTitle, status, conclusion,
event, workflowName, workflowDatabaseId,
headBranch, headSha, createdAt, updatedAt,
url, jobs
```

### Workflows
```bash
gh workflow view --json
```

Common fields:
```
name, path, state, id, createdAt, updatedAt, url
```

## Status Values

### Run Status
- `queued` - Waiting to start
- `in_progress` - Currently running
- `completed` - Finished

### Run Conclusion (when completed)
- `success` - All jobs succeeded
- `failure` - At least one job failed
- `cancelled` - Manually cancelled
- `skipped` - Skipped
- `timed_out` - Exceeded time limit

## Don't Use When
- Just viewing in browser (use `--web`)
- Need to modify workflow YAML (edit .github/workflows/*.yml)
- Need real-time log streaming (use `gh run watch`)

## See Also
- @skogai/gh/json.md - JSON output
- GitHub Actions docs: https://docs.github.com/en/actions
- Run `gh workflow --help` and `gh run --help`
