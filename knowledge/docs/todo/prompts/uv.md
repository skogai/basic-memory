---
permalink: skogai/todo/prompts/uv
---

______________________________________________________________________

## prompt:uv

[$prompt:uv]

# UV Package Manager - Daily Usage Guide

UV is a high-performance Python package manager that combines the functionality of pip, venv, and other Python tools.

## Daily UV Workflow

### Creating a Virtual Environment

```
uv venv             # Create venv in .venv (current directory)
uv venv path/to/env # Create venv in specified location
```

### Installing Packages

```
uv pip install package_name             # Install a package
uv pip install package_name==1.2.3      # Install specific version
uv pip install -r requirements.txt      # Install from requirements file
```

### Managing Project Dependencies

```
uv add package_name        # Add to pyproject.toml and install
uv add package_name -d     # Add as a dev dependency
uv sync                    # Sync environment with pyproject.toml
```

### Running Code

```
uv run python script.py    # Run script in project environment
uv run pytest              # Run tests in project environment
uv run -m module_name      # Run module in project environment
```

### Upgrading Packages

```
uv pip install --upgrade package_name   # Upgrade a package
uv pip freeze > requirements.txt        # Save current environment
```

UV is fast, reliable, and compatible with standard Python workflows while providing significant performance improvements over traditional tools. [/$prompt:uv]
