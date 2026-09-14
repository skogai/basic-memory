---
title: custom-tool-example
type: note
permalink: skogai/todo/interfaces/aichat/custom-tool-example
---

# Creating and Using Custom Tools in AIChat

This document walks through a practical example of creating a simple custom tool for AIChat and verifying its functionality.

## Overview

AIChat's function calling capabilities can be extended with custom tools that follow the llm-functions framework pattern. This example demonstrates the complete workflow of creating a simple "hello_world" tool, making it available to AIChat, and testing it both in the AIChat interface and directly through function calls.

## Creating a Simple Hello World Tool

The simplest way to create a custom tool is using a shell script with the argc annotation system.

### Step 1: Create the Tool Script

Create a file named `hello_world.sh` in the `tools/tools/` directory:

```bash
#!/usr/bin/env bash
set -e

# @describe A simple tool that says hello to the world or to a specified name.

# @option --name The name to greet

# @env LLM_OUTPUT=/dev/stdout The output path

main() {
    if [ -z "$argc_name" ]; then
        echo "Hello, world!" >> "$LLM_OUTPUT"
    else
        echo "Hello, $argc_name!" >> "$LLM_OUTPUT"
    fi
}

eval "$(argc --argc-eval "$0" "$@")"
```

The key components of this tool are:

- `@describe` - Documents the tool's purpose
- `@option` - Defines the optional parameter "name"
- The main function that outputs a greeting

### Step 2: Build and Link the Tool

After creating the tool script, you need to build and link it to make it available to AIChat:

```bash
# Make the script executable
chmod +x tools/tools/hello_world.sh

# Build the tools
./scripts/argc-tool.sh build

# Link them to AIChat
./scripts/argc-tool.sh link-to-aichat
```

### Step 3: Update a Role to Access the Tool

To make the tool available in AIChat for a specific role, you need to update the role's configuration. For example, to add the tool to the "skogai" role:

1. Update the configuration in `interfaces/aichat/configs/skogai.json` or similar to include the new tool in the "tools" array.
1. Alternatively, ensure the tool is available in the default set of tools for all roles.

## Testing the Tool

### Testing via AIChat Interface

You can test the tool by running AIChat with the appropriate role:

```bash
aichat --role skogai "please return the output from hello_world skogix"
```

This should produce output similar to:

```
I'll run the hello_world function with the name "skogix" for you.
Here's the output from running the hello_world function with the name "skogix":

Hello, skogix!
```

### Testing via Direct Function Call

If your environment supports direct function calls (like in a chat interface with function calling capabilities), you can invoke the tool directly using syntax that might look like:

```example
[hello_world --name "skogix"]
```

Which should return:

```
Hello, skogix!
```

Note that the actual syntax for function calls will depend on your specific environment and integration.

## Key Benefits of Custom Tools

1. **Functionality Extension**: Easily add new capabilities to AIChat without modifying core code
1. **Standardized Interface**: Tools follow a consistent pattern making them interoperable
1. **Language Flexibility**: Create tools in any scripting language (Bash, Python, JavaScript, etc.)
1. **Automated Documentation**: The annotation system automatically generates documentation
1. **Parameter Validation**: Built-in parameter handling with validation

## Best Practices

When creating custom tools:

1. Always include a clear `@describe` annotation explaining the tool's purpose
1. Mark required parameters with `!` (e.g., `--path!`)
1. Provide sensible defaults for optional parameters when possible
1. Include proper error handling
1. Keep tools focused on a single, well-defined task

## Conclusion

Custom tools significantly extend the capabilities of AIChat, allowing it to perform specific actions and integrate with external systems. By following the standard argc annotation pattern, these tools can be seamlessly incorporated into the existing framework.

This example demonstrates just a basic tool, but the same approach can be used to create more sophisticated tools that interact with APIs, process data, or control external systems.
