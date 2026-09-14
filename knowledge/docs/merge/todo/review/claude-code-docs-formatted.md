---
title: claude-code-docs-formatted
type: note
permalink: skogai/docs-merge-todo/todo/review/claude-code-docs-formatted
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

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Command</th>
<th>Description</th>
<th>Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>claude</code></td>
<td>Start interactive REPL</td>
<td><code>claude</code></td>
</tr>
<tr class="even">
<td><code>claude "query"</code></td>
<td>Start REPL with initial prompt</td>
<td><code>claude "explain this project"</code></td>
</tr>
<tr class="odd">
<td><code>claude -p "query"</code></td>
<td>Run one-off query, then exit</td>
<td><code>claude -p "explain this function"</code></td>
</tr>
<tr class="even">
<td><code>cat file | claude -p "query"</code></td>
<td>Process piped content</td>
<td><code>cat logs.txt | claude -p "explain"</code></td>
</tr>
<tr class="odd">
<td><code>claude config</code></td>
<td>Configure settings</td>
<td><code>claude config set --global theme dark</code></td>
</tr>
<tr class="even">
<td><code>claude update</code></td>
<td>Update to latest version</td>
<td><code>claude update</code></td>
</tr>
<tr class="odd">
<td><code>claude mcp</code></td>
<td>Configure Model Context Protocol servers</td>
<td><a
href="about:/en/docs/agents/claude-code/tutorials#set-up-model-context-protocol-mcp">See
MCP section in tutorials</a></td>
</tr>
</tbody>
</table>

**CLI flags**:

- `--print` (`-p`): Print response without interactive mode
- `--json`: Return JSON output in `--print` mode, useful for scripting and automation
- `--verbose`: Enable verbose logging, shows full turn-by-turn output (helpful for debugging in both print and interactive modes)
- `--dangerously-skip-permissions`: Skip permission prompts

### Slash commands

Control Claude’s behavior within a session:

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Command</th>
<th>Purpose</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>/bug</code></td>
<td>Report bugs (sends conversation to Anthropic)</td>
</tr>
<tr class="even">
<td><code>/clear</code></td>
<td>Clear conversation history</td>
</tr>
<tr class="odd">
<td><code>/compact [instructions]</code></td>
<td>Compact conversation with optional focus instructions</td>
</tr>
<tr class="even">
<td><code>/config</code></td>
<td>View/modify configuration</td>
</tr>
<tr class="odd">
<td><code>/cost</code></td>
<td>Show token usage statistics</td>
</tr>
<tr class="even">
<td><code>/doctor</code></td>
<td>Checks the health of your Claude Code installation</td>
</tr>
<tr class="odd">
<td><code>/help</code></td>
<td>Get usage help</td>
</tr>
<tr class="even">
<td><code>/init</code></td>
<td>Initialize project with CLAUDE.md guide</td>
</tr>
<tr class="odd">
<td><code>/login</code></td>
<td>Switch Anthropic accounts</td>
</tr>
<tr class="even">
<td><code>/logout</code></td>
<td>Sign out from your Anthropic account</td>
</tr>
<tr class="odd">
<td><code>/memory</code></td>
<td>Edit CLAUDE.md memory files</td>
</tr>
<tr class="even">
<td><code>/pr_comments</code></td>
<td>View pull request comments</td>
</tr>
<tr class="odd">
<td><code>/review</code></td>
<td>Request code review</td>
</tr>
<tr class="even">
<td><code>/terminal-setup</code></td>
<td>Install Shift+Enter key binding for newlines (iTerm2 and VSCode
only)</td>
</tr>
<tr class="odd">
<td><code>/vim</code></td>
<td>Enter vim mode for alternating insert and command modes</td>
</tr>
</tbody>
</table>

## Manage Claude’s memory

Claude Code can remember your preferences across sessions, like style guidelines and common commands in your workflow.

### Determine memory type

Claude Code offers three memory locations, each serving a different purpose:

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>Memory Type</th>
<th>Location</th>
<th>Purpose</th>
<th>Use Case Examples</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Project memory</strong></td>
<td><code>./CLAUDE.md</code></td>
<td>Team-shared conventions and knowledge</td>
<td>Project architecture, coding standards, common workflows</td>
</tr>
<tr class="even">
<td><strong>Project memory (local)</strong></td>
<td><code>./CLAUDE.local.md</code></td>
<td>Personal project-specific preferences</td>
<td>Your sandbox URLs, preferred test data</td>
</tr>
<tr class="odd">
<td><strong>User memory</strong></td>
<td><code>~/.claude/CLAUDE.md</code></td>
<td>Global personal preferences</td>
<td>Code styling preferences, personal tooling shortcuts</td>
</tr>
</tbody>
</table>

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

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>Tool Type</th>
<th>Example</th>
<th>Approval Required</th>
<th>”Yes, don’t ask again” Behavior</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Read-only</td>
<td>File reads, LS, Grep</td>
<td>No</td>
<td>N/A</td>
</tr>
<tr class="even">
<td>Bash Commands</td>
<td>Shell execution</td>
<td>Yes</td>
<td>Permanently per project directory and command</td>
</tr>
<tr class="odd">
<td>File Modification</td>
<td>Edit/write files</td>
<td>Yes</td>
<td>Until session end</td>
</tr>
</tbody>
</table>

### Tools available to Claude

Claude Code has access to a set of powerful tools that help it understand and modify your codebase:

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Tool</th>
<th>Description</th>
<th>Permission Required</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>AgentTool</strong></td>
<td>Runs a sub-agent to handle complex, multi-step tasks</td>
<td>No</td>
</tr>
<tr class="even">
<td><strong>BashTool</strong></td>
<td>Executes shell commands in your environment</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td><strong>GlobTool</strong></td>
<td>Finds files based on pattern matching</td>
<td>No</td>
</tr>
<tr class="even">
<td><strong>GrepTool</strong></td>
<td>Searches for patterns in file contents</td>
<td>No</td>
</tr>
<tr class="odd">
<td><strong>LSTool</strong></td>
<td>Lists files and directories</td>
<td>No</td>
</tr>
<tr class="even">
<td><strong>FileReadTool</strong></td>
<td>Reads the contents of files</td>
<td>No</td>
</tr>
<tr class="odd">
<td><strong>FileEditTool</strong></td>
<td>Makes targeted edits to specific files</td>
<td>Yes</td>
</tr>
<tr class="even">
<td><strong>FileWriteTool</strong></td>
<td>Creates or overwrites files</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td><strong>NotebookReadTool</strong></td>
<td>Reads and displays Jupyter notebook contents</td>
<td>No</td>
</tr>
<tr class="even">
<td><strong>NotebookEditTool</strong></td>
<td>Modifies Jupyter notebook cells</td>
<td>Yes</td>
</tr>
</tbody>
</table>

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

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Rule</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Bash(npm run build)</strong></td>
<td>Matches the exact Bash command <code>npm run build</code>.</td>
</tr>
<tr class="even">
<td><strong>Bash(npm run test:*)</strong></td>
<td>Matches Bash commands starting with <code>npm run test</code>. See
note below about command separator handling.</td>
</tr>
<tr class="odd">
<td><strong>mcp__puppeteer__puppeteer_navigate</strong></td>
<td>Matches the <code>puppeteer_navigate</code> tool from the
<code>puppeteer</code> MCP server.</td>
</tr>
<tr class="even">
<td><strong>WebFetchTool(domain:example.com)</strong></td>
<td>Matches fetch requests to example.com</td>
</tr>
</tbody>
</table>

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

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Variable</th>
<th>Purpose</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>DISABLE_AUTOUPDATER</code></td>
<td>Set to <code>1</code> to disable the automatic updater</td>
</tr>
<tr class="even">
<td><code>DISABLE_BUG_COMMAND</code></td>
<td>Set to <code>1</code> to disable the <code>/bug</code> command</td>
</tr>
<tr class="odd">
<td><code>DISABLE_COST_WARNINGS</code></td>
<td>Set to <code>1</code> to disable cost warning messages</td>
</tr>
<tr class="even">
<td><code>HTTP_PROXY</code></td>
<td>Specify HTTP proxy server for network connections</td>
</tr>
<tr class="odd">
<td><code>HTTPS_PROXY</code></td>
<td>Specify HTTPS proxy server for network connections</td>
</tr>
<tr class="even">
<td><code>MCP_TIMEOUT</code></td>
<td>Timeout in milliseconds for MCP server startup</td>
</tr>
<tr class="odd">
<td><code>MCP_TOOL_TIMEOUT</code></td>
<td>Timeout in milliseconds for MCP tool execution</td>
</tr>
</tbody>
</table>

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

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Key</th>
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>autoUpdaterStatus</code></td>
<td><code>disabled</code> or <code>enabled</code></td>
<td>Enable or disable the auto-updater (default:
<code>enabled</code>)</td>
</tr>
<tr class="even">
<td><code>env</code></td>
<td>JSON (eg. <code>'{"FOO": "bar"}'</code>)</td>
<td>Environment variables that will be applied to every session</td>
</tr>
<tr class="odd">
<td><code>preferredNotifChannel</code></td>
<td><code>iterm2</code>, <code>iterm2_with_bell</code>,
<code>terminal_bell</code>, or <code>notifications_disabled</code></td>
<td>Where you want to receive notifications (default:
<code>iterm2</code>)</td>
</tr>
<tr class="even">
<td><code>theme</code></td>
<td><code>dark</code>, <code>light</code>,
<code>light-daltonized</code>, or <code>dark-daltonized</code></td>
<td>Color theme</td>
</tr>
<tr class="odd">
<td><code>verbose</code></td>
<td><code>true</code> or <code>false</code></td>
<td>Whether to show full bash and command outputs (default:
<code>false</code>)</td>
</tr>
</tbody>
</table>

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

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Key</th>
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>allowedTools</code></td>
<td>array of tools</td>
<td>Which tools can run without manual approval</td>
</tr>
<tr class="even">
<td><code>ignorePatterns</code></td>
<td>array of glob strings</td>
<td>Which files/directories are ignored when using tools</td>
</tr>
</tbody>
</table>

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
