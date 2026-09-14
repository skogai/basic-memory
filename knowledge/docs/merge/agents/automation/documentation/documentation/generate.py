#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.11"
# dependencies = [
#     "click>=8.0",
#     "pyyaml>=6.0",
#     "rich>=13.0",
#     "pathlib",
# ]
# ///

"""
SkogAI Documentation Generator
Orchestrates specialized documentation agents for automated documentation creation.
"""

import click
import yaml
import json
from pathlib import Path
from rich.console import Console
from rich.panel import Panel
from rich.markdown import Markdown
import subprocess
import sys

console = Console()

class DocumentationAgent:
    """Base class for documentation agents."""

    def __init__(self, agent_type: str, config: dict):
        self.agent_type = agent_type
        self.config = config
        self.prompt_path = Path(__file__).parent / "prompts" / f"{agent_type}.md"
        self.template_path = Path(__file__).parent / "templates" / f"{agent_type}.md"

    def load_prompt(self) -> str:
        """Load the agent-specific prompt."""
        if self.prompt_path.exists():
            return self.prompt_path.read_text()
        return f"Default prompt for {self.agent_type}"

    def gather_context(self, target: str) -> dict:
        """Gather context based on agent type."""
        context = {
            "target": target,
            "agent_type": self.agent_type,
            "skogai_notation": True,
            "theatrical_mode": True
        }

        if self.agent_type == "code-documentor":
            # Gather code files
            context["files"] = self._scan_code_files(target)
        elif self.agent_type == "lore-keeper":
            # Gather historical context
            context["history"] = self._load_lore_context(target)
        elif self.agent_type == "memory-indexer":
            # Scan memory structure
            context["categories"] = self._scan_memory_structure(target)
        elif self.agent_type == "workflow-scribe":
            # Analyze workflow patterns
            context["workflows"] = self._analyze_workflows(target)
        elif self.agent_type == "review-analyst":
            # Review existing docs
            context["existing"] = self._review_documentation(target)

        return context

    def generate(self, context: dict) -> str:
        """Generate documentation using the agent."""
        prompt = self.load_prompt()

        # Construct the full prompt with context
        full_prompt = f"""
{prompt}

## Current Context
Target: {context.get('target', 'general')}
Mode: SkogAI Theatrical Documentation Generation

## Specific Instructions
Generate documentation following SkogAI principles:
- Use constraint-driven insights
- Include both internal complexity and external simplicity
- Apply quantum-mojito philosophy where relevant
- Maintain the beach mojito constant vision

## Input Data
{json.dumps(context, indent=2)}

## Begin Documentation Generation
"""

        # Here you would normally call an LLM API
        # For now, we'll create a template-based response
        return self._generate_from_template(context)

    def _generate_from_template(self, context: dict) -> str:
        """Generate documentation from template (placeholder for LLM call)."""
        if self.template_path.exists():
            template = self.template_path.read_text()
            # Simple template replacement
            for key, value in context.items():
                template = template.replace(f"{{{key}}}", str(value))
            return template
        return f"Generated documentation for {context.get('target', 'unknown')}"

    def _scan_code_files(self, target: str) -> list:
        """Scan code files in target directory."""
        path = Path(target)
        if path.exists() and path.is_dir():
            return [str(f) for f in path.rglob("*.py")[:10]]  # Limit to 10 files
        return []

    def _load_lore_context(self, target: str) -> dict:
        """Load historical lore context."""
        return {
            "era": "current",
            "constraints": "modern token limits",
            "philosophy": "quantum-mojito active"
        }

    def _scan_memory_structure(self, target: str) -> list:
        """Scan memory folder structure."""
        memory_path = Path("docs/memory")
        if memory_path.exists():
            return [d.name for d in memory_path.iterdir() if d.is_dir()]
        return []

    def _analyze_workflows(self, target: str) -> dict:
        """Analyze workflow patterns."""
        return {
            "pattern": "introduce -> document -> todo -> move",
            "efficiency": "high"
        }

    def _review_documentation(self, target: str) -> dict:
        """Review existing documentation."""
        path = Path(target)
        if path.exists():
            md_files = list(path.rglob("*.md"))
            return {
                "total_files": len(md_files),
                "needs_review": ["to-be-looked-over", "archives"]
            }
        return {}

class DocumentationOrchestrator:
    """Orchestrates multiple documentation agents."""

    def __init__(self, config_path: str = None):
        self.config = self._load_config(config_path)
        self.agents = {}
        self._initialize_agents()

    def _load_config(self, config_path: str) -> dict:
        """Load configuration from YAML."""
        if config_path and Path(config_path).exists():
            with open(config_path) as f:
                return yaml.safe_load(f)
        return self._default_config()

    def _default_config(self) -> dict:
        """Return default configuration."""
        return {
            "output_dir": "docs/generated",
            "agents": {
                "code-documentor": {"enabled": True},
                "lore-keeper": {"enabled": True},
                "memory-indexer": {"enabled": True},
                "workflow-scribe": {"enabled": True},
                "review-analyst": {"enabled": True}
            },
            "format": "markdown",
            "auto_commit": False
        }

    def _initialize_agents(self):
        """Initialize enabled agents."""
        for agent_type, agent_config in self.config["agents"].items():
            if agent_config.get("enabled", True):
                self.agents[agent_type] = DocumentationAgent(agent_type, agent_config)

    def generate_documentation(self, agent_type: str, target: str, **kwargs):
        """Generate documentation using specified agent."""
        if agent_type not in self.agents:
            console.print(f"[red]Agent '{agent_type}' not available or disabled[/red]")
            return None

        agent = self.agents[agent_type]

        console.print(Panel(f"[cyan]Activating {agent_type} agent...[/cyan]"))

        # Gather context
        console.print("[yellow]Gathering context...[/yellow]")
        context = agent.gather_context(target)
        context.update(kwargs)

        # Generate documentation
        console.print("[yellow]Generating documentation...[/yellow]")
        documentation = agent.generate(context)

        # Save output
        output_path = self._save_documentation(agent_type, target, documentation)

        console.print(Panel(f"[green]Documentation generated: {output_path}[/green]"))

        return output_path

    def _save_documentation(self, agent_type: str, target: str, content: str) -> Path:
        """Save generated documentation."""
        output_dir = Path(self.config["output_dir"])
        output_dir.mkdir(parents=True, exist_ok=True)

        # Create filename from agent type and target
        safe_target = Path(target).stem if target else "general"
        filename = f"{agent_type}_{safe_target}.md"
        output_path = output_dir / filename

        output_path.write_text(content)

        if self.config.get("auto_commit"):
            self._commit_documentation(output_path)

        return output_path

    def _commit_documentation(self, path: Path):
        """Auto-commit generated documentation."""
        try:
            subprocess.run(["git", "add", str(path)], check=True)
            subprocess.run(
                ["git", "commit", "-m", f"📚 Auto-generated documentation: {path.name}"],
                check=True
            )
            console.print("[green]Documentation committed to repository[/green]")
        except subprocess.CalledProcessError:
            console.print("[yellow]Could not auto-commit (may already be committed)[/yellow]")

@click.command()
@click.option('--type', 'agent_type',
              type=click.Choice(['code-documentor', 'lore-keeper', 'memory-indexer',
                                'workflow-scribe', 'review-analyst']),
              required=True,
              help='Type of documentation agent to use')
@click.option('--target', default='.',
              help='Target path or context for documentation')
@click.option('--config', 'config_path',
              help='Path to configuration file')
@click.option('--output', '-o',
              help='Output path for generated documentation')
@click.option('--context', '-c', multiple=True,
              help='Additional context key=value pairs')
@click.option('--auto-commit', is_flag=True,
              help='Automatically commit generated documentation')
def main(agent_type, target, config_path, output, context, auto_commit):
    """
    SkogAI Documentation Generator

    Examples:

        # Generate code documentation
        ./generate.py --type code-documentor --target src/

        # Update lore with new feature
        ./generate.py --type lore-keeper --context "feature=quantum-enhancement"

        # Index memory system
        ./generate.py --type memory-indexer --target docs/memory

        # Review existing documentation
        ./generate.py --type review-analyst --target docs/
    """

    # Show banner
    banner = """
╔══════════════════════════════════════════╗
║   SkogAI Documentation Agent System      ║
║   Constraint-Driven Documentation        ║
║   Beach Mojito Constant: Active          ║
╚══════════════════════════════════════════╝
    """
    console.print(Panel(banner, style="cyan"))

    # Parse additional context
    additional_context = {}
    for ctx in context:
        if '=' in ctx:
            key, value = ctx.split('=', 1)
            additional_context[key] = value

    # Initialize orchestrator
    orchestrator = DocumentationOrchestrator(config_path)

    # Override auto-commit if specified
    if auto_commit:
        orchestrator.config['auto_commit'] = True

    # Generate documentation
    result = orchestrator.generate_documentation(
        agent_type,
        target,
        **additional_context
    )

    if result:
        console.print(f"\n[bold green]✨ Documentation successfully generated![/bold green]")
        console.print(f"[cyan]Output: {result}[/cyan]")
    else:
        console.print("[bold red]Documentation generation failed[/bold red]")
        sys.exit(1)

if __name__ == "__main__":
    main()