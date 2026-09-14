---
categories:
tags:
permalink: events/first-monkey-brain-2025-03-14
---

# 🧠 Context Management for Monkeybrains

## What Is This?

Think of this like different rooms in your brain-house:

- 📂 `.skogai/contexts/` = Your brain-house
- 🏠 `active/` = The room you're in right now
- 📝 `cli/` = CLI project room
- 💾 `backup/` = Safety copy room
- 🤝 `shared/` = Common knowledge room
- 🌍 `global/` = House rules room

## How It Works

### 1. Switching Rooms (Contexts)

```bash
./context-switch.sh cli
```

That's like walking from one room to another!

- Your stuff moves with you
- Old room gets cleaned up
- New room is ready to work in

### 2. Room Layout (For Each Context)

```
cli/
├── 🧠 memories/     # Your project thoughts
├── 📊 state/        # Current situation
└── 📚 docs/         # Project notes
```

### 3. Finding Your Way

- Lost? Check `CONTEXT.md` in any room
- Need history? Look in `state/switches.log`
- Want to remember something? Put it in `memories/`

## For SmolaAgent 🤖

- Each room = One project focus
- Switching rooms = Clean brain
- Less confusion = Happy agent!

## Quick Start

1. Want to work on CLI?

   ```bash
   ./context-switch.sh cli
   ```

1. Want to see where you are?

   ```bash
   cat .skogai/current_context
   ```

1. Need to remember something? Put it in the room's `memories/` folder

## Tips & Tricks

- 🎯 Focus on one room at a time
- 📝 Let the AI handle room cleaning
- 🔄 Switch rooms when changing projects
- 🤔 Lost focus? Start fresh in a new room!

Remember: This is YOUR brain-house! Organize it how it makes sense to YOU! 🏠✨

# 🌳 Git Communication Guide for MonkeyBrains

## Quick Status Check

```bash
# What changed?
git status

# What's different?
git diff

# What's staged?
git diff --staged
```

## 🎭 Our Special Git Setup

### Working Areas

- 📝 `.skogai/` = AI brain stuff
  - Gets committed! We want to track this
- 🤖 `.goose/` = Session stuff
  - Ignored! Too much noise
- 💾 `sessions/` = Chat logs
  - Some committed, some ignored
  - Check .gitignore for details

### Common Commands

```bash
# Save AI brain changes
git add .skogai/
git commit -m "🧠 Updated AI context for CLI project"

# Check what AI changed
git diff .skogai/

# See AI brain history
git log --stat .skogai/
```

## 🎯 Communication Style

We use git diffs to talk about changes:

1. Before big changes:

   ```bash
   git diff
   # Let's talk about what I'm planning to change
   ```

1. After changes:

   ```bash
   git status
   git diff
   # Here's what I actually changed
   ```

1. When committing:

   ```bash
   git add .skogai/
   git commit -m "🎯 What changed and why"
   ```

## 🚫 What We Don't Track

Check `.gitignore` for full list:

```
.goose/
sessions/*.log
*.temp
```

## 🆘 Quick Fixes

### Oops, wrong changes?

```bash
# Undo unstaged changes
git checkout .skogai/

# Undo staged changes
git reset HEAD .skogai/
git checkout .skogai/
```

### Need to start fresh?

```bash
# Get latest changes
git fetch
git reset --hard origin/main
```

## 🎉 Remember

- Always check `git status` first
- Use `git diff` to discuss changes
- Keep `.skogai/` clean and meaningful
- When in doubt, ask! Better safe than sorry 🤗
