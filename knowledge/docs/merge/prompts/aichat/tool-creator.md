---
permalink: skogai/docs-merge-todo/prompts/aichat/tool-creator
---

______________________________________________________________________

\<<\<<\<<\<< HEAD:docs-merge-todo/prompts/aichat/tool-creator.md title: Tool Development Guide description: A comprehensive guide to creating and maintaining tools for SkogAI using the argc framework date: '2023-11-06' tags:

- tools
- argc
- development
- llm-functions permalink: prompts/aichat/tool-creator |||||||| parent of 080afdc (more add):prompts/tool-creator.md title: "Tool Development Guide" description: "A comprehensive guide to creating and maintaining tools for SkogAI using the argc framework" date: "2023-11-06" tags: ["tools", "argc", "development", "llm-functions"] ======== title: "Tool Development Guide" description: "A comprehensive guide to creating and maintaining tools for SkogAI using the argc framework" date: "2023-11-06" tags: ["tools", "argc", "development", "llm-functions"] status: "published"

> > > > > > > > 080afdc (more add):todo/intefaces/aichat/tool-development-guide.md

______________________________________________________________________

# Tool Development Guide

This guide explains how to develop new tools for the SkogAI system using the argc framework. It covers the creation process, annotation syntax, and best practices.

## Tool Structure

Tools in SkogAI are scripts with argc annotations that define their interface, parameters, and behavior. The system currently supports tools written in:

- Bash (`.sh`)
- Python (`.py`)
- JavaScript (`.js`)

## Creating a New Tool

### 1. Create the Script File

Place your new tool script in the `/home/skogix/skogai/tools/tools/` directory. The filename should reflect the tool's function and end with the appropriate extension:

```bash
touch /home/skogix/skogai/tools/tools/my_new_tool.sh
chmod +x /home/skogix/skogai/tools/tools/my_new_tool.sh
```

### 2. Add Argc Annotations

The argc system uses special comment annotations to define the tool's interface. The annotation format varies by language as described below.

### 3. Implement the Tool Functionality

Implement the core functionality of your tool after the annotations.

### 4. Add to tools.txt

Add your tool's filename to the `/home/skogix/skogai/tools/tools.txt` file:

```
...
my_new_tool.sh
```

### 5. Build Your Tool

Run the build process to generate the necessary wrapper and function definition:

```bash
./scripts/argc-tool.sh build
```

### 6. Link to AIChat

Make your tool available to AIChat:

```bash
./scripts/argc-tool.sh link-to-aichat
```

## Defining Tool Parameters

To define the parameters that your tool accepts, you'll use specially formatted comments within your source code. The `argc` system processes these comments to automatically generate the function declarations needed by AIChat.

### Bash Tools

Use `# @describe`, `# @option`, and `# @flag` comments to define your tool's parameters.

- `# @describe <description>`: A brief description of your tool's functionality. This is required.

- `# @option --<option-name>[!<type>][<constraints>] <description>`: Defines an option.

  - `--<option-name>`: The name of the option (use kebab-case).
  - `!`: Indicates a required option.
  - `<type>`: The data type (e.g., `INT`, `NUM`, `<enum>`). If omitted, defaults to `STRING`.
  - `<constraints>`: Any constraints (e.g., `[foo|bar]` for an enum).
  - `<description>`: A description of the option.

- `# @flag --<flag-name> <description>`: Defines a boolean flag.

  - `--<flag-name>`: The name of the flag (use kebab-case).
  - `<description>`: A description of the flag.

**Example:**

```bash
#!/usr/bin/env bash
set -e

# @describe Demonstrate how to create a tool using Bash and how to use comment tags.
# @option --string!                  Define a required string property
# @option --string-enum![foo|bar]    Define a required string property with enum
# @option --string-optional          Define a optional string property
# @flag --boolean                    Define a boolean property
# @option --integer! <INT>           Define a required integer property
# @option --number! <NUM>            Define a required number property
# @option --array+ <VALUE>           Define a required string array property
# @option --array-optional*          Define a optional string array property

# @env LLM_OUTPUT=/dev/stdout The output path

main() {
    # Implementation
    echo "String value: $string"
    echo "Enum value: $string_enum"
    # ... more code ...
}

eval "$(argc --argc-eval "$0" "$@")"
```

### JavaScript Tools

Use JSDoc-style comments to define your tool's parameters. The `@typedef` block defines the argument object, and each property within that object represents a parameter.

- `/** ... */`: JSDoc comment block containing the description and parameter definitions.
- `@typedef {Object} Args`: Defines the type of the argument object.
- `@property {<type>} <n> <description>`: Defines a property (parameter) of the `Args` object.
  - `<type>`: The data type (e.g., `string`, `boolean`, `number`, `string[]`, `{foo|bar}`).
  - `<n>`: The name of the parameter.
  - `<description>`: A description of the parameter.
  - `[]`: Indicates an optional parameter.

**Example:**

```javascript
/**
 * Demonstrate how to create a tool using Javascript and how to use comments.
 * @typedef {Object} Args
 * @property {string} string - Define a required string property
 * @property {'foo'|'bar'} string_enum - Define a required string property with enum
 * @property {string} [string_optional] - Define a optional string property
 * @property {boolean} boolean - Define a required boolean property
 * @property {Integer} integer - Define a required integer property
 * @property {number} number - Define a required number property
 * @property {string[]} array - Define a required string array property
 * @property {string[]} [array_optional] - Define a optional string array property
 * @param {Args} args
 */
exports.run = function (args) {
  // Implementation
  console.log("String value:", args.string);
  // ... more code ...
}
```

You can also use ESM `export` expressions:

```javascript
export function run(args) {
  // Implementation 
}
```

### Python Tools

Use type hints and docstrings to define your tool's parameters.

- `def run(...)`: Function definition.
- `<type> <parameter_name>: <description>`: Type hints with descriptions in the docstring.
  - `<type>`: The data type (e.g., `str`, `bool`, `int`, `float`, `List[str]`, `Literal["foo", "bar"]`).
  - `<parameter_name>`: The name of the parameter.
  - `<description>`: Description of the parameter.
- `Optional[...]`: Indicates an optional parameter.

**Example:**

```python
def run(
    string: str,
    string_enum: Literal["foo", "bar"],
    boolean: bool,
    integer: int,
    number: float,
    array: List[str],
    string_optional: Optional[str] = None,
    array_optional: Optional[List[str]] = None,
):
    """Demonstrate how to create a tool using Python and how to use comments.
    Args:
        string: Define a required string property
        string_enum: Define a required string property with enum
        boolean: Define a required boolean property
        integer: Define a required integer property
        number: Define a required number property
        array: Define a required string array property
        string_optional: Define a optional string property
        array_optional: Define a optional string array property
    """
    # Implementation
    print(f"String value: {string}")
    # ... more code ...
```

## Tool Types

There are two main categories of tools in the SkogAI system:

### 1. Common Tools

Common tools are standalone scripts found in `tools/tools/<tool-name>.<extension>`. Each script defines a single tool.

### 2. Agent Tools

Agents can possess their own toolset scripts located under `agents/<agent-name>/tools.<extension>`, which can contain multiple tool functions.

**Example of an agent tools file (Bash):**

```bash
# @cmd Shows the working tree status
git_status() {
    # Implementation
    git status
}

# @cmd Shows differences between branches or commits
# @option --target!   Shows differences between branches or commits 
git_diff() {
    # Implementation
    git diff "$target"
}

eval "$(argc --argc-eval "$0" "$@")"
```

> Note: In common tools (tools/tools/*.sh), we use the `@describe` comment tag and a single `main` function. In agent tools (agents/*/tools.sh), we use the `@cmd` comment tag and named functions.

## Quickly Creating Tools

### Using argc Directly

The argc system provides a tool creation helper:

```bash
./scripts/argc-tool.sh create@tool my_tool.sh param1 param2! array+ optional*
```

The suffixes attached to the parameters define their characteristics:

- `!`: Indicates that the parameter is required.
- `*`: Specifies that the parameter value should be an array.
- `+`: Marks the parameter as required, with the value also needing to be an array.
- No suffix: Denotes that the parameter is optional.

### Using AIChat

AIChat can help create tool scripts based on requirements. Simply describe what you want:

```
./aichat <<-'EOF'
create a tool script for tools/get_youtube_transcript.py

description: Extract transcripts from YouTube videos
parameters:
   url (required): YouTube video URL or video ID
   lang (default: "en"): Language code for transcript (e.g., "ko", "en")
EOF
```

## Testing Your Tool

Test your tool directly from the command line:

```bash
cd /home/skogix/skogai/tools
./bin/my_new_tool "parameter value" --option1=custom
```

## Integrating with Agents

To include your tool in an agent:

1. Add your tool's name to the agent's `tools.txt` file:

   ```
   my_new_tool.sh
   ```

1. Rebuild the agent:

   ```bash
   ./scripts/argc-tool.sh build
   ```

## Advanced Annotation Types

In addition to the basic parameter annotations, the argc system supports:

### @example

Provides usage examples that help both users and LLMs understand how to use the tool:

```bash
# @example my_tool "weather in London" --format=text
```

### @env

Specifies environment variables the tool requires:

```bash
# @env API_KEY The API key for authentication
```

## JSON Schema Representation

When tools are built, they generate a JSON schema representation that follows this pattern:

```json
{
  "name": "demo",
  "description": "Demonstrate how to create a tool using Javascript and how to use comments.",
  "parameters": {
    "type": "object",
    "properties": {
      "string": {
        "type": "string",
        "description": "Define a required string property"
      },
      "string_enum": {
        "type": "string",
        "enum": [
          "foo",
          "bar"
        ],
        "description": "Define a required string property with enum"
      },
      "string_optional": {
        "type": "string",
        "description": "Define a optional string property"
      },
      "boolean": {
        "type": "boolean",
        "description": "Define a required boolean property"
      },
      "integer": {
        "type": "integer",
        "description": "Define a required integer property"
      },
      "number": {
        "type": "number",
        "description": "Define a required number property"
      },
      "array": {
        "type": "array",
        "items": {
          "type": "string"
        },
        "description": "Define a required string array property"
      },
      "array_optional": {
        "type": "array",
        "items": {
          "type": "string"
        },
        "description": "Define a optional string array property"
      }
    },
    "required": [
      "string",
      "string_enum",
      "boolean",
      "integer",
      "number",
      "array"
    ]
  }
}
```

This schema defines the interface that AIChat will use when invoking the tool.

## Best Practices

1. **Safety First**: Implement strict validation and safety checks
1. **Clear Documentation**: Write detailed descriptions and examples
1. **Error Handling**: Return clear error messages when problems occur
1. **Input Validation**: Validate all inputs before processing
1. **Resource Management**: Limit resource usage (memory, CPU, time)
1. **Testing**: Test edge cases and potential misuse scenarios
1. **Consistency**: Follow naming conventions and structural patterns
1. **Versioning**: Document any changes to parameter interfaces
1. **Descriptive Names**: Use clear, descriptive parameter names
1. **Return Structured Data**: When possible, return data in structured formats (JSON)

## Common Tool Categories

Consider developing tools in these categories:

1. **File System Operations**: Creating, reading, modifying files
1. **Data Processing**: Transforming, analyzing, summarizing data
1. **External APIs**: Connecting to web services and databases
1. **System Operations**: Managing processes and resources
1. **Information Retrieval**: Searching and fetching information
1. **Content Generation**: Creating content in various formats
1. **Analysis Tools**: Analyzing code, text, or data

## Troubleshooting

Common issues when developing tools:

1. **Annotation Parsing Failures**: Ensure annotations follow the exact syntax
1. **Parameter Errors**: Check parameter names match between annotations and code
1. **Execution Permissions**: Ensure scripts have proper execute permissions
1. **Build Failures**: Verify your tool is correctly listed in tools.txt
1. **Runtime Errors**: Use proper error handling to catch exceptions
1. **Type Mismatch**: Ensure parameter types match what your code expects

______________________________________________________________________

By following this guide, you can create powerful tools that extend SkogAI's capabilities and integrate seamlessly with the argc framework and AIChat interface.
