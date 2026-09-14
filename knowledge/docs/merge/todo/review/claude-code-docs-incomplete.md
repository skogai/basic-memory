---
title: claude-code-docs-incomplete
type: note
permalink: skogai/docs-merge-todo/todo/review/claude-code-docs-incomplete
---

Claude Code is an agentic coding tool that lives in your terminal, understands your codebase, and helps you code faster through natural language commands. By integrating directly with your development environment, Claude Code streamlines your workflow without requiring additional servers or complex setup.

Claude Code’s key capabilities include:

- Editing files and fixing bugs across your codebase
- Answering questions about your code’s architecture and logic
- Executing and fixing tests, linting, and other commands
- Searching through git history, resolving merge conflicts, and creating commits and PRs

______________________________________________________________________

## Before you begin

### Check system requirements

- **Operating Systems**: macOS 10.15+, Ubuntu 20.04+/Debian 10+, or Windows via WSL
- **Hardware**: 4GB RAM minimum
- **Software**:
  - Node.js 18+
  - [git](https://git-scm.com/downloads) 2.23+ (optional)
  - [GitHub](https://cli.github.com/) or [GitLab](https://gitlab.com/gitlab-org/cli) CLI for PR workflows (optional)
  - [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation) (rg) for enhanced file search (optional)
- **Network**: Internet connection required for authentication and AI processing
- **Location**: Available only in [supported countries](https://www.anthropic.com/supported-countries)

### Install and authenticate

1

2

3

4

______________________________________________________________________

## Core features and workflows

Claude Code operates directly in your terminal, understanding your project context and taking real actions. No need to manually add files to context - Claude will explore your codebase as needed. Claude Code uses `claude-3-7-sonnet-20250219` by default.

### Security and privacy by design

Your code’s security is paramount. Claude Code’s architecture ensures:

- **Direct API connection**: Your queries go straight to Anthropic’s API without intermediate servers
- **Works where you work**: Operates directly in your terminal
- **Understands context**: Maintains awareness of your entire project structure
- **Takes action**: Performs real operations like editing files and creating commits

### From questions to solutions in seconds

______________________________________________________________________

### Initialize your project

For first-time users, we recommend:

1. Start Claude Code with `claude`
1. Try a simple command like `summarize this project`
1. Generate a CLAUDE.md project guide with `/init`
1. Ask Claude to commit the generated CLAUDE.md file to your repository

## Use Claude Code for common tasks

Claude Code operates directly in your terminal, understanding your project context and taking real actions. No need to manually add files to context - Claude will explore your codebase as needed.

### Understand unfamiliar code

### Automate Git operations

### Edit code intelligently

### Test and debug your code

### Encourage deeper thinking

For complex problems, explicitly ask Claude to think more deeply:

Claude Code will show when Claude (3.7 Sonnet) is using extended thinking. You can proactively prompt Claude to “think” or “think deeply” for more planning-intensive tasks. We suggest that you first tell Claude about your task and let it gather context from your project. Then, ask it to “think” to create a plan.

### Automate CI and infra workflows

Claude Code comes with a non-interactive mode for headless execution. This is especially useful for running Claude Code in non-interactive contexts like scripts, pipelines, and Github Actions.

Use `--print` (`-p`) to run Claude in non-interactive mode. In this mode, you can set the `ANTHROPIC_API_KEY` environment variable to provide a custom API key.

Non-interactive mode is especially useful when you pre-configure the set of commands Claude is allowed to use:

______________________________________________________________________

## Control Claude Code with commands

### CLI commands

| Command             | Description                              | Example                                                                                                       |
| ------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `claude`            | Start interactive REPL                   | `claude`                                                                                                      |
| `claude "query"`    | Start REPL with initial prompt           | `claude "explain this project"`                                                                               |
| `claude -p "query"` | Run one-off query, then exit             | `claude -p "explain this function"`                                                                           |
| \`cat file          | claude -p "query"\`                      | Process piped content                                                                                         |
| `claude config`     | Configure settings                       | `claude config set --global theme dark`                                                                       |
| `claude update`     | Update to latest version                 | `claude update`                                                                                               |
| `claude mcp`        | Configure Model Context Protocol servers | [See MCP section in tutorials](about:/en/docs/agents/claude-code/tutorials#set-up-model-context-protocol-mcp) |

**CLI flags**:

- `--print` (`-p`): Print response without interactive mode
- `--json`: Return JSON output in `--print` mode, useful for scripting and automation
- `--verbose`: Enable verbose logging, shows full turn-by-turn output (helpful for debugging in both print and interactive modes)
- `--dangerously-skip-permissions`: Skip permission prompts

### Slash commands

Control Claude’s behavior within a session:

| Command                   | Purpose                                                               |
| ------------------------- | --------------------------------------------------------------------- |
| `/bug`                    | Report bugs (sends conversation to Anthropic)                         |
| `/clear`                  | Clear conversation history                                            |
| `/compact [instructions]` | Compact conversation with optional focus instructions                 |
| `/config`                 | View/modify configuration                                             |
| `/cost`                   | Show token usage statistics                                           |
| `/doctor`                 | Checks the health of your Claude Code installation                    |
| `/help`                   | Get usage help                                                        |
| `/init`                   | Initialize project with CLAUDE.md guide                               |
| `/login`                  | Switch Anthropic accounts                                             |
| `/logout`                 | Sign out from your Anthropic account                                  |
| `/memory`                 | Edit CLAUDE.md memory files                                           |
| `/pr_comments`            | View pull request comments                                            |
| `/review`                 | Request code review                                                   |
| `/terminal-setup`         | Install Shift+Enter key binding for newlines (iTerm2 and VSCode only) |
| `/vim`                    | Enter vim mode for alternating insert and command modes               |

## Manage Claude’s memory

Claude Code can remember your preferences across sessions, like style guidelines and common commands in your workflow.

### Determine memory type

Claude Code offers three memory locations, each serving a different purpose:

| Memory Type                | Location              | Purpose                               | Use Case Examples                                        |
| -------------------------- | --------------------- | ------------------------------------- | -------------------------------------------------------- |
| **Project memory**         | `./CLAUDE.md`         | Team-shared conventions and knowledge | Project architecture, coding standards, common workflows |
| **Project memory (local)** | `./CLAUDE.local.md`   | Personal project-specific preferences | Your sandbox URLs, preferred test data                   |
| **User memory**            | `~/.claude/CLAUDE.md` | Global personal preferences           | Code styling preferences, personal tooling shortcuts     |

All memory files are automatically loaded into Claude Code’s context when launched.

### How Claude looks up memories

Claude Code reads memories recursively: starting in the cwd, Claude Code recurses up to */* and reads any CLAUDE.md or CLAUDE.local.md files it finds. This is especially convenient when working in large repositories where you run Claude Code in *foo/bar/*, and have memories in both *foo/CLAUDE.md* and *foo/bar/CLAUDE.md*.

### Quickly add memories with the `#` shortcut

The fastest way to add a memory is to start your input with the `#` character:

You’ll be prompted to select which memory file to store this in.

### Directly edit memories with `/memory`

Use the `/memory` slash command during a session to open any memory file in your system editor for more extensive additions or organization.

### Memory best practices

- **Be specific**: “Use 2-space indentation” is better than “Format code properly”.
- **Use structure to organize**: Format each individual memory as a bullet point and group related memories under descriptive markdown headings.
- **Review periodically**: Update memories as your project evolves to ensure Claude is always using the most up to date information and context.

## Manage permissions and security

Claude Code uses a tiered permission system to balance power and safety:

| Tool Type         | Example              | Approval Required | ”Yes, don’t ask again” Behavior               |
| ----------------- | -------------------- | ----------------- | --------------------------------------------- |
| Read-only         | File reads, LS, Grep | No                | N/A                                           |
| Bash Commands     | Shell execution      | Yes               | Permanently per project directory and command |
| File Modification | Edit/write files     | Yes               | Until session end                             |

### Tools available to Claude

Claude Code has access to a set of powerful tools that help it understand and modify your codebase:

| Tool                 | Description                                          | Permission Required |
| -------------------- | ---------------------------------------------------- | ------------------- |
| **AgentTool**        | Runs a sub-agent to handle complex, multi-step tasks | No                  |
| **BashTool**         | Executes shell commands in your environment          | Yes                 |
| **GlobTool**         | Finds files based on pattern matching                | No                  |
| **GrepTool**         | Searches for patterns in file contents               | No                  |
| **LSTool**           | Lists files and directories                          | No                  |
| **FileReadTool**     | Reads the contents of files                          | No                  |
| **FileEditTool**     | Makes targeted edits to specific files               | Yes                 |
| **FileWriteTool**    | Creates or overwrites files                          | Yes                 |
| **NotebookReadTool** | Reads and displays Jupyter notebook contents         | No                  |
| **NotebookEditTool** | Modifies Jupyter notebook cells                      | Yes                 |

### Permission rules

You can manage Claude Code’s allowed tools with `/allowed-tools`.

Your personal project permission settings are saved in your global Claude config (in `~/.claude.json`).

Shared project permissions are loaded from `.claude/settings.json` when Claude Code is launched. These settings are shared across everyone working with this code so that each user doesn’t have to configure commonly used safe tools.

Example .claude/settings.json

Permission rules use the format: `Tool(optional-specifier)`

For example, adding `WebFetchTool` to the list of allow rules would allow any use of the web fetch tool without requiring user approval. Some tools have more fine-grained controls to allow specific tool invocations without user approval. See the table below for examples.

MCP tool names follow the format: `mcp__server_name__tool_name`, where:

- `server_name` is the name of the MCP server as configured in Claude Code
- `tool_name` is the specific tool provided by that server

| Rule                                       | Description                                                                                          |
| ------------------------------------------ | ---------------------------------------------------------------------------------------------------- |
| **Bash(npm run build)**                    | Matches the exact Bash command `npm run build`.                                                      |
| **Bash(npm run test:\*)**                  | Matches Bash commands starting with `npm run test`. See note below about command separator handling. |
| **mcp\_\_puppeteer\_\_puppeteer_navigate** | Matches the `puppeteer_navigate` tool from the `puppeteer` MCP server.                               |
| **WebFetchTool(domain:example.com)**       | Matches fetch requests to example.com                                                                |

### Protect against prompt injection

Prompt injection is a technique where an attacker attempts to override or manipulate an AI assistant’s instructions by inserting malicious text. Claude Code includes several safeguards against these attacks:

- **Permission system**: Sensitive operations require explicit approval
- **Context-aware analysis**: Detects potentially harmful instructions by analyzing the full request
- **Input sanitization**: Prevents command injection by processing user inputs
- **Command blocklist**: Blocks risky commands that fetch arbitrary content from the web like `curl` and `wget`

**Best practices for working with untrusted content**:

1. Review suggested commands before approval
1. Avoid piping untrusted content directly to Claude
1. Verify proposed changes to critical files
1. Report suspicious behavior with `/bug`

### Configure network access

Claude Code requires access to:

- api.anthropic.com
- statsig.anthropic.com
- sentry.io

Allowlist these URLs when using Claude Code in containerized environments.

### Environment variables

Claude Code supports the following environment variables to control its behavior:

| Variable                | Purpose                                            |
| ----------------------- | -------------------------------------------------- |
| `DISABLE_AUTOUPDATER`   | Set to `1` to disable the automatic updater        |
| `DISABLE_BUG_COMMAND`   | Set to `1` to disable the `/bug` command           |
| `DISABLE_COST_WARNINGS` | Set to `1` to disable cost warning messages        |
| `HTTP_PROXY`            | Specify HTTP proxy server for network connections  |
| `HTTPS_PROXY`           | Specify HTTPS proxy server for network connections |
| `MCP_TIMEOUT`           | Timeout in milliseconds for MCP server startup     |
| `MCP_TOOL_TIMEOUT`      | Timeout in milliseconds for MCP tool execution     |

______________________________________________________________________

## Configure Claude Code

Configure Claude Code by running `claude config` in your terminal, or the `/config` command when using the interactive REPL.

### Configuration options

Claude Code supports global and project-level configuration.

To manage your configurations, use the following commands:

- List settings: `claude config list`
- See a setting: `claude config get <key>`
- Change a setting: `claude config set <key> <value>`
- Push to a setting (for lists): `claude config add <key> <value>`
- Remove from a setting (for lists): `claude config remove <key> <value>`

By default `config` changes your project configuration. To manage your global configuration, use the `--global` (or `-g`) flag.

#### Global configuration

To set a global configuration, use `claude config set -g <key> <value>`:

| Key                     | Value                                                                      | Description                                                      |
| ----------------------- | -------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `autoUpdaterStatus`     | `disabled` or `enabled`                                                    | Enable or disable the auto-updater (default: `enabled`)          |
| `env`                   | JSON (eg. `'{"FOO": "bar"}'`)                                              | Environment variables that will be applied to every session      |
| `preferredNotifChannel` | `iterm2`, `iterm2_with_bell`, `terminal_bell`, or `notifications_disabled` | Where you want to receive notifications (default: `iterm2`)      |
| `theme`                 | `dark`, `light`, `light-daltonized`, or `dark-daltonized`                  | Color theme                                                      |
| `verbose`               | `true` or `false`                                                          | Whether to show full bash and command outputs (default: `false`) |

### Auto-updater permission options

When Claude Code detects that it doesn’t have sufficient permissions to write to your global npm prefix directory (required for automatic updates), you’ll see a warning that points to this documentation page. For detailed solutions to auto-updater issues, see the [troubleshooting guide](about:/en/docs/agents-and-tools/claude-code/troubleshooting#auto-updater-issues).

#### Recommended: Create a new user-writable npm prefix

**Why we recommend this option:**

- Avoids modifying system directory permissions
- Creates a clean, dedicated location for your global npm packages
- Follows security best practices

Since Claude Code is actively developing, we recommend setting up auto-updates using the recommended option above.

#### Disabling the auto-updater

If you prefer to disable the auto-updater instead of fixing permissions, you can use:

#### Project configuration

Manage project configuration with `claude config set <key> <value>` (without the `-g` flag):

| Key              | Value                 | Description                                          |
| ---------------- | --------------------- | ---------------------------------------------------- |
| `allowedTools`   | array of tools        | Which tools can run without manual approval          |
| `ignorePatterns` | array of glob strings | Which files/directories are ignored when using tools |

For example:

See [Permission rules](about:/_sites/docs.anthropic.com/en/docs/agents-and-tools/claude-code/overview#permission-rules) for the `allowedTools` rule format.

### Optimize your terminal setup

Claude Code works best when your terminal is properly configured. Follow these guidelines to optimize your experience.

**Supported shells**:

- Bash
- Zsh
- Fish

#### Themes and appearance

Claude cannot control the theme of your terminal. That’s handled by your terminal application. You can match Claude Code’s theme to your terminal during onboarding or any time via the `/config` command

#### Line breaks

You have several options for entering linebreaks into Claude Code:

- **Quick escape**: Type `\` followed by Enter to create a newline
- **Keyboard shortcut**: Press Option+Enter (Meta+Enter) with proper configuration

To set up Option+Enter in your terminal:

**For Mac Terminal.app:**

1. Open Settings → Profiles → Keyboard
1. Check “Use Option as Meta Key”

**For iTerm2 and VSCode terminal:**

1. Open Settings → Profiles → Keys
1. Under General, set Left/Right Option key to “Esc+”

**Tip for iTerm2 and VSCode users**: Run `/terminal-setup` within Claude Code to automatically configure Shift+Enter as a more intuitive alternative.

#### Notification setup

Never miss when Claude completes a task with proper notification configuration:

##### Terminal bell notifications

Enable sound alerts when tasks complete:

**For macOS users**: Don’t forget to enable notification permissions in System Settings → Notifications → [Your Terminal App].

##### iTerm 2 system notifications

For iTerm 2 alerts when tasks complete:

1. Open iTerm 2 Preferences
1. Navigate to Profiles → Terminal
1. Enable “Silence bell” and “Send notification when idle”
1. Set your preferred notification delay

Note that these notifications are specific to iTerm 2 and not available in the default macOS Terminal.

#### Handling large inputs

When working with extensive code or long instructions:

- **Avoid direct pasting**: Claude Code may struggle with very long pasted content
- **Use file-based workflows**: Write content to a file and ask Claude to read it
- **Be aware of VS Code limitations**: The VS Code terminal is particularly prone to truncating long pastes

#### Vim Mode

Claude Code supports a subset of Vim keybindings that can be enabled with `/vim` or configured via `/config`.

The supported subset includes:

- Mode switching: `Esc` (to NORMAL), `i`/`I`, `a`/`A`, `o`/`O` (to INSERT)
- Navigation: `h`/`j`/`k`/`l`, `w`/`e`/`b`, `0`/`$`/`^`, `gg`/`G`
- Editing: `x`, `dw`/`de`/`db`/`dd`/`D`, `cw`/`ce`/`cb`/`cc`/`C`, `.` (repeat)

______________________________________________________________________

## Manage costs effectively

Claude Code consumes tokens for each interaction. The average cost is $6 per developer per day, with daily costs remaining below $12 for 90% of users.

### Track your costs

- Use `/cost` to see current session usage
- Check [historical usage](https://support.anthropic.com/en/articles/9534590-cost-and-usage-reporting-in-console) in the Anthropic Console. Note: Users need Admin or Billing roles to view Cost tab
- Set [workspace spend limits](https://support.anthropic.com/en/articles/9796807-creating-and-managing-workspaces) for the Claude Code workspace. Note: Users need Admin role to set spend limits.

### Reduce token usage

- **Compact conversations:**

  - Claude uses auto-compact by default when context exceeds 95% capacity
  - Toggle auto-compact: Run `/config` and navigate to “Auto-compact enabled”
  - Use `/compact` manually when context gets large
  - Add custom instructions: `/compact Focus on code samples and API usage`
  - Customize compaction by adding to CLAUDE.md:

- **Write specific queries:** Avoid vague requests that trigger unnecessary scanning

- **Break down complex tasks:** Split large tasks into focused interactions

- **Clear history between tasks:** Use `/clear` to reset context

Costs can vary significantly based on:

- Size of codebase being analyzed
- Complexity of queries
- Number of files being searched or modified
- Length of conversation history
- Frequency of compacting conversations

______________________________________________________________________

## Model configuration

By default, Claude Code uses `claude-3-7-sonnet-20250219`. You can override this using the following environment variables:

You can also set these variables using the global configuration:

## Use with third-party APIs

### Connect to Amazon Bedrock

If you’d like to access Claude Code via proxy, you can use the `ANTHROPIC_BEDROCK_BASE_URL` environment variable:

If you don’t have prompt caching enabled, also set:

Requires standard AWS SDK credentials (e.g., `~/.aws/credentials` or relevant environment variables like `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`). To set up AWS credentials, run:

Contact Amazon Bedrock for prompt caching for reduced costs and higher rate limits.

### Connect to Google Vertex AI

If you’d like to access Claude Code via proxy, you can use the `ANTHROPIC_VERTEX_BASE_URL` environment variable:

If you don’t have prompt caching enabled, also set:

Requires standard GCP credentials configured through google-auth-library. To set up GCP credentials, run:

For the best experience, contact Google for heightened rate limits.

## Connect though a proxy

When using Claude Code with an LLM proxy (like [LiteLLM](https://docs.litellm.ai/docs/simple_proxy)), you can control authentication behavior using the following environment variables and configs. Note that you can mix and match these with Bedrock and Vertex-specific settings.

### Environment variables

- `ANTHROPIC_AUTH_TOKEN`: Custom value for the `Authorization` and `Proxy-Authorization` headers (the value you set here will be prefixed with `Bearer` )
- `ANTHROPIC_CUSTOM_HEADERS`: Custom headers you want to add to the request (in `Name: Value` format)
- `HTTP_PROXY`: Set the HTTP proxy URL
- `HTTPS_PROXY`: Set the HTTPS proxy URL

If you prefer to configure via a file instead of environment variables, you can add any of these variables to the `env` object in your global Claude config (in *~/.claude.json*).

### Global configuration options

- `apiKeyHelper`: A custom shell script to get an API key (invoked once at startup, and cached for the duration of each session)

______________________________________________________________________

## Development container reference implementation

Claude Code provides a development container configuration for teams that need consistent, secure environments. This preconfigured [devcontainer setup](https://code.visualstudio.com/docs/devcontainers/containers) works seamlessly with VS Code’s Remote - Containers extension and similar tools.

The container’s enhanced security measures (isolation and firewall rules) allow you to run `claude --dangerously-skip-permissions` to bypass permission prompts for unattended operation. We’ve included a [reference implementation](https://github.com/anthropics/claude-code/tree/main/.devcontainer) that you can customize for your needs.

### Key features

- **Production-ready Node.js**: Built on Node.js 20 with essential development dependencies
- **Security by design**: Custom firewall restricting network access to only necessary services
- **Developer-friendly tools**: Includes git, ZSH with productivity enhancements, fzf, and more
- **Seamless VS Code integration**: Pre-configured extensions and optimized settings
- **Session persistence**: Preserves command history and configurations between container restarts
- **Works everywhere**: Compatible with macOS, Windows, and Linux development environments

### Getting started in 4 steps

1. Install VS Code and the Remote - Containers extension
1. Clone the [Claude Code reference implementation](https://github.com/anthropics/claude-code/tree/main/.devcontainer) repository
1. Open the repository in VS Code
1. When prompted, click “Reopen in Container” (or use Command Palette: Cmd+Shift+P → “Remote-Containers: Reopen in Container”)

### Configuration breakdown

The devcontainer setup consists of three primary components:

- [**devcontainer.json**](https://github.com/anthropics/claude-code/blob/main/.devcontainer/devcontainer.json): Controls container settings, extensions, and volume mounts
- [**Dockerfile**](https://github.com/anthropics/claude-code/blob/main/.devcontainer/Dockerfile): Defines the container image and installed tools
- [**init-firewall.sh**](https://github.com/anthropics/claude-code/blob/main/.devcontainer/init-firewall.sh): Establishes network security rules

### Security features

The container implements a multi-layered security approach with its firewall configuration:

- **Precise access control**: Restricts outbound connections to whitelisted domains only (npm registry, GitHub, Anthropic API, etc.)
- **Default-deny policy**: Blocks all other external network access
- **Startup verification**: Validates firewall rules when the container initializes
- **Isolation**: Creates a secure development environment separated from your main system

### Customization options

The devcontainer configuration is designed to be adaptable to your needs:

- Add or remove VS Code extensions based on your workflow
- Modify resource allocations for different hardware environments
- Adjust network access permissions
- Customize shell configurations and developer tooling

______________________________________________________________________

## Next steps

______________________________________________________________________

## License and data usage

Claude Code is provided as a Beta research preview under Anthropic’s [Commercial Terms of Service](https://www.anthropic.com/legal/commercial-terms).

### How we use your data

We aim to be fully transparent about how we use your data. We may use feedback to improve our products and services, but we will not train generative models using your feedback from Claude Code. Given their potentially sensitive nature, we store user feedback transcripts for only 30 days.

#### Feedback transcripts

If you choose to send us feedback about Claude Code, such as transcripts of your usage, Anthropic may use that feedback to debug related issues and improve Claude Code’s functionality (e.g., to reduce the risk of similar bugs occurring in the future). We will not train generative models using this feedback.

### Privacy safeguards

We have implemented several safeguards to protect your data, including limited retention periods for sensitive information, restricted access to user session data, and clear policies against using feedback for model training.

For full details, please review our [Commercial Terms of Service](https://www.anthropic.com/legal/commercial-terms) and [Privacy Policy](https://www.anthropic.com/legal/privacy).

### License

© Anthropic PBC. All rights reserved. Use is subject to Anthropic’s [Commercial Terms of Service](https://www.anthropic.com/legal/commercial-terms).
