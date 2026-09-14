#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.11"
# dependencies = [
#     "click>=8.0",
#     "anthropic>=0.31.0",
#     "rich>=13.0",
# ]
# ///

"""
SkogAI Documentation Agent - ACTUALLY WORKING VERSION
Uses real Claude API to generate documentation
"""

import click
import os
from pathlib import Path
from rich.console import Console
from anthropic import Anthropic
import json

console = Console()

# Get API key from environment or config
def get_api_key():
    # Check environment first
    if api_key := os.environ.get("ANTHROPIC_API_KEY"):
        return api_key

    # Check SkogAI config
    config_path = Path("/home/skogix/skogai/config/config.json")
    if config_path.exists():
        with open(config_path) as f:
            config = json.load(f)
            if token := config.get("claude", {}).get("env", {}).get("CLAUDE_CODE_AUTH_TOKEN"):
                return token

    return None

def generate_documentation(file_path: str, doc_type: str = "code") -> str:
    """Actually generate documentation using Claude API"""

    api_key = get_api_key()
    if not api_key:
        console.print("[red]No API key found. Set ANTHROPIC_API_KEY environment variable.[/red]")
        return None

    client = Anthropic(api_key=api_key)

    # Read the file content
    path = Path(file_path)
    if not path.exists():
        console.print(f"[red]File not found: {file_path}[/red]")
        return None

    content = path.read_text()

    # Build the prompt based on doc type
    prompts = {
        "code": f"""You are documenting code for the SkogAI ecosystem.

Analyze this code and generate comprehensive documentation following SkogAI principles:
- Use constraint-driven insights
- Include both what and why
- Add SkogAI notation where relevant: $ (define), @ (intent), | (choice)
- Use [category] tags and [[forward-references]]

File: {path.name}
```
{content}
```

Generate markdown documentation with:
1. Overview
2. Key functions/classes with purpose
3. Usage examples
4. SkogAI integration points
5. Relations to other components
""",

        "lore": f"""You are the Lore Keeper of SkogAI, chronicling its evolution.

Document this component in the context of SkogAI's history:
- How does it reflect constraint-driven innovation?
- What theatrical elements are present?
- How does it embody the quantum-mojito philosophy?
- What's the connection to the beach mojito constant?

Component: {path.name}
```
{content}
```

Generate narrative documentation that captures both technical and philosophical aspects.
""",

        "memory": f"""You are the Memory Indexer for SkogAI's knowledge base.

Create an index entry for this component:
- Categorize using [tags]
- Create [[forward-references]]
- Map semantic connections
- Build navigation paths

File: {path.name}
```
{content}
```

Generate a memory index entry with categories, relations, and navigation guidance.
"""
    }

    prompt = prompts.get(doc_type, prompts["code"])

    try:
        # Make actual API call
        message = client.messages.create(
            model="claude-3-5-sonnet-20241022",
            max_tokens=2000,
            temperature=0.7,
            messages=[
                {
                    "role": "user",
                    "content": prompt
                }
            ]
        )

        return message.content[0].text

    except Exception as e:
        console.print(f"[red]Error calling Claude API: {e}[/red]")
        return None

@click.command()
@click.argument('file_path')
@click.option('--type', 'doc_type',
              type=click.Choice(['code', 'lore', 'memory']),
              default='code',
              help='Type of documentation to generate')
@click.option('--output', '-o', help='Output file path')
@click.option('--append', is_flag=True, help='Append to existing file')
def main(file_path, doc_type, output, append):
    """
    Generate REAL documentation using Claude API

    Examples:
        ./doc-agent.py myfile.py --type code
        ./doc-agent.py config.json --type lore --output docs/lore/config-story.md
        ./doc-agent.py memory.md --type memory --append
    """

    console.print(f"[cyan]Generating {doc_type} documentation for {file_path}...[/cyan]")

    # Generate the documentation
    documentation = generate_documentation(file_path, doc_type)

    if not documentation:
        console.print("[red]Failed to generate documentation[/red]")
        return

    # Output the documentation
    if output:
        output_path = Path(output)
        output_path.parent.mkdir(parents=True, exist_ok=True)

        if append and output_path.exists():
            existing = output_path.read_text()
            documentation = existing + "\n\n" + documentation

        output_path.write_text(documentation)
        console.print(f"[green]Documentation saved to {output_path}[/green]")
    else:
        # Print to console
        console.print("\n[bold cyan]Generated Documentation:[/bold cyan]\n")
        console.print(documentation)

if __name__ == "__main__":
    main()