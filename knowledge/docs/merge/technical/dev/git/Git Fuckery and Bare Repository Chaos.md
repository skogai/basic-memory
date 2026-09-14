---
title: Git Fuckery and Bare Repository Chaos
type: note
permalink: dev/git/git-fuckery-and-bare-repository-chaos
---

# Git Fuckery and Bare Repository Chaos

## The Discovery

Found that skogix has two parallel SkogAI projects:

- `/home/skogix/git-fuckery/` - the "clean" working version
- `/home/skogix/bare/` - the experimental chaos version

## The Legendary Divergence

The bare repository showed:

- 1420 local commits vs 98 remote commits divergence
- Both on `feature/tmp` branch
- Commit messages almost exclusively "."

## The 14-Hour Rebase Incident

- 80 nested submodules configured
- Each running `git submodule foreach git-flow feature publish`
- Every change triggered 80 submodules to publish feature branches
- Git-flow AVH edition adding extra complexity
- Process took 3-4 minutes per change
- Total rebase took 14 hours and hung the computer
- Essentially created a git fork bomb

## Key Learnings

- Parallel universe development: experiment wildly in one repo, cherry-pick to clean repo
- Nested submodules with automated publishing = distributed DoS against own git server
- Commit message "." creates morse code git logs
- Sometimes chaos is the methodology

## Status

Already fixed and managed - the chaos has been tamed (for now)
