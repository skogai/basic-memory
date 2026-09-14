# gh - Release Management

## When to Use
Creating and managing GitHub releases

## Key Commands

### gh release create
Create a new release

```bash
gh release create <tag> [<files>...] [flags]
```

**Flags:**
```bash
-t, --title string             Release title
-n, --notes string             Release notes
-F, --notes-file file          Read notes from file
--generate-notes               Auto-generate notes from PRs
-d, --draft                    Create as draft
-p, --prerelease               Mark as prerelease
--target string                Target branch/commit (default: default branch)
--latest                       Mark as latest release
--discussion-category string   Create discussion in category
--verify-tag                   Abort if tag doesn't exist
```

### gh release list
List releases

```bash
gh release list [flags]
```

**Flags:**
```bash
-L, --limit int           Max releases (default 30)
--exclude-drafts          Exclude drafts
--exclude-pre-releases    Exclude prereleases
--json fields             JSON output
--jq expression           Filter JSON
```

### gh release view
View release details

```bash
gh release view [<tag>] [flags]
```

**Flags:**
```bash
-w, --web                 Open in browser
--json fields             JSON output
--jq expression           Filter JSON
```

### gh release download
Download release assets

```bash
gh release download [<tag>] [flags]
```

**Flags:**
```bash
-p, --pattern string      Download assets matching pattern
-D, --dir string          Directory to download to
-A, --archive format      Download source archive: {tar.gz|zip}
--skip-existing           Skip existing files
```

### gh release upload
Upload assets to release

```bash
gh release upload <tag> <files>... [flags]
```

**Flags:**
```bash
--clobber                 Overwrite existing assets
```

### gh release delete
Delete a release

```bash
gh release delete <tag> [flags]
```

**Flags:**
```bash
-y, --yes                 Skip confirmation
--cleanup-tag             Delete tag as well
```

### gh release delete-asset
Delete a release asset

```bash
gh release delete-asset <tag> <asset-name> [flags]
```

**Flags:**
```bash
-y, --yes                 Skip confirmation
```

### gh release edit
Edit a release

```bash
gh release edit <tag> [flags]
```

**Flags:**
```bash
-t, --title string             New title
-n, --notes string             New notes
-F, --notes-file file          Read notes from file
--draft                        Mark as draft
--prerelease                   Mark as prerelease
--latest                       Mark as latest
--discussion-category string   Move to discussion category
--tag string                   Change tag name
--target string                Change target
```

## Common Patterns

### Create Release from Tag
```bash
# Tag must exist first
git tag v1.0.0
git push origin v1.0.0

# Create release
gh release create v1.0.0 \
  --title "Release v1.0.0" \
  --notes "Release notes here"
```

### Create Release with Auto-Generated Notes
```bash
gh release create v1.0.0 --generate-notes
```

### Create Draft Release
```bash
gh release create v1.0.0 \
  --draft \
  --title "v1.0.0" \
  --notes "Draft release"
```

### Create Release with Assets
```bash
gh release create v1.0.0 \
  --title "v1.0.0" \
  --notes "Release with binaries" \
  dist/app-linux \
  dist/app-macos \
  dist/app-windows.exe
```

### Create Prerelease
```bash
gh release create v1.0.0-rc.1 \
  --prerelease \
  --title "Release Candidate 1" \
  --notes "Testing release"
```

### Upload Additional Assets
```bash
gh release upload v1.0.0 additional-file.zip
```

### Download Latest Release Assets
```bash
gh release download
```

### Download Specific Release
```bash
gh release download v1.0.0
```

### Download Matching Assets
```bash
gh release download v1.0.0 --pattern "*.zip"
```

### Download Source Archive
```bash
gh release download v1.0.0 --archive tar.gz
```

### List All Releases
```bash
gh release list
```

### Get Latest Release Info
```bash
gh release view --json tagName,name,createdAt,assets
```

### View Specific Release
```bash
gh release view v1.0.0
```

### Edit Release Notes
```bash
gh release edit v1.0.0 --notes "Updated notes"
```

### Convert Draft to Published
```bash
gh release edit v1.0.0 --draft=false
```

### Delete Release (Keep Tag)
```bash
gh release delete v1.0.0
```

### Delete Release and Tag
```bash
gh release delete v1.0.0 --cleanup-tag
```

## AI Agent Patterns

### DO create tag first
```bash
# CORRECT order
git tag v1.0.0
git push origin v1.0.0
gh release create v1.0.0

# gh release create can create tag, but explicit is clearer
```

### DO use --generate-notes
```bash
# Let GitHub generate notes from PRs
gh release create v1.0.0 --generate-notes
```

### DON'T parse text output
```bash
# BAD
gh release list | grep "v1" | head -1

# GOOD
gh release list --json tagName --jq '.[0].tagName'
```

### DO check if release exists
```bash
if gh release view v1.0.0 &>/dev/null; then
  echo "Release exists"
fi
```

### DO get asset download URLs
```bash
gh release view v1.0.0 --json assets \
  --jq '.assets[] | {name, url: .url}'
```

## Available JSON Fields

Run to discover:
```bash
gh release view --json
```

Common fields:
```
tagName, name, body, isDraft, isPrerelease, isLatest,
createdAt, publishedAt, url, author,
assets (array with name, url, size, downloadCount)
```

## Release Notes Tips

### Auto-Generated Notes
```bash
# GitHub generates from merged PRs
gh release create v1.0.0 --generate-notes
```

### From File
```bash
gh release create v1.0.0 --notes-file CHANGELOG.md
```

### From Git Log
```bash
# Generate notes from commits
git log v0.9.0..v1.0.0 --pretty=format:"- %s (%h)" > notes.txt
gh release create v1.0.0 --notes-file notes.txt
```

## Don't Use When
- Just viewing in browser (use `--web`)
- Need to create tag only (use `git tag`)
- Need complex asset management (consider GitHub API via `gh api`)

## See Also
- @skogai/gh/json.md - JSON output
- @skogai/git/tags.md - Git tag operations (TODO)
- Run `gh release --help`
