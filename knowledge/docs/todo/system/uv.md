---
title: uv
type: note
permalink: skogai/todo/system/uv
---

# UV - Fast Python Package Manager

UV is an extremely fast Python package manager designed to simplify dependency management and environment setup for Python projects.

## General Concept

UV combines the functionality of multiple Python tools (pip, venv, virtualenv) into a single, high-performance utility. It handles:

- Virtual environment creation
- Package installation and management
- Dependency resolution
- Project configuration
- Python version management

The key advantages of UV are speed, reliability, and a unified interface for all Python package management tasks.

## Key Commands

### 1. `uv venv` - Virtual Environment Creation

Create isolated Python environments for your projects:

```bash
# Basic usage - creates venv in the specified path
uv venv path/to/venv

# Create environment with specific Python version
uv venv --python=3.11 path/to/venv

# Create with additional options
uv venv --system-site-packages --prompt="myproject" path/to/venv
```

**Common options:**

- `--python`: Specify Python interpreter version
- `--seed`: Install seed packages (pip, setuptools, wheel)
- `--system-site-packages`: Give access to system packages
- `--prompt`: Custom terminal prompt prefix

### 2. `uv pip` - Package Management

Manage Python packages with a familiar pip-like interface:

```bash
# Install packages
uv pip install requests pandas

# Install from requirements file
uv pip install -r requirements.txt

# Uninstall packages
uv pip uninstall requests

# List installed packages
uv pip list

# Show detailed package info
uv pip show requests

# Generate requirements file from environment
uv pip freeze > requirements.txt
```

**Key subcommands:**

- `install`: Install packages
- `uninstall`: Remove packages
- `list`: Display installed packages
- `freeze`: Output installed packages in requirements format
- `show`: Display package information

### 3. `uv add` - Project Dependency Management

Add and manage dependencies for your Python project:

```bash
# Add a specific version of a package
uv add requests==2.28.1

# Add multiple packages
uv add black pytest mypy

# Add development dependencies
uv add --dev pytest pytest-cov

# Add dependencies to specific groups
uv add --group docs sphinx sphinx-rtd-theme

# Add dependencies from requirements file
uv add --requirements requirements.txt
```

**Common options:**

- `--dev`: Add as development dependency
- `--group`: Add to specified dependency group
- `--optional`: Add as optional dependency
- `--editable`: Add as editable install
- `--upgrade`: Allow package upgrades

### 4. `uv sync` - Update Project Environment

Synchronize your project's dependencies with your environment:

```bash
# Basic sync - updates environment based on project dependencies
uv sync

# Sync with development dependencies
uv sync --group dev

# Sync all dependency groups
uv sync --all-groups

# Upgrade all packages during sync
uv sync --upgrade

# Upgrade specific package
uv sync --upgrade-package requests
```

**Common options:**

- `--extra`: Include optional dependencies from the specified extra
- `--all-extras`: Include all optional dependencies
- `--group`: Include dependencies from specified group
- `--all-groups`: Include dependencies from all groups
- `--check`: Verify environment is synchronized without making changes

### 5. `uv run` - Run Commands and Scripts

Run commands or scripts in your project's environment:

```bash
# Run a command
uv run pytest

# Run a Python script
uv run -s script.py

# Run a Python module
uv run -m pytest

# Run with additional packages installed temporarily
uv run --with requests pytest
```

**Common options:**

- `-m, --module`: Run a Python module
- `-s, --script`: Run the given path as a Python script
- `--with`: Run with specified packages installed
- `--isolated`: Run in an isolated virtual environment
- `--env-file`: Load environment variables from a .env file

## Basic Workflow

The usual UV workflow is straightforward:

1. Create a virtual environment: `uv venv .venv`
1. Activate it: `source .venv/bin/activate` (on Unix) or `.venv\Scripts\activate` (on Windows)
1. Add dependencies: `uv add requests pandas`
1. Sync your environment: `uv sync`
1. Run your code: `uv run -s your_script.py` or `python your_script.py`
1. Add development tools as needed: `uv add --dev pytest black`

UV simplifies Python project setup and maintenance with its integrated approach to package and environment management, all while being significantly faster than traditional tools.
